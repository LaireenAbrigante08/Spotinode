const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const multer = require('multer');
const path = require('path');

const app = express();

// Middleware for parsing form data
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public')); // Serve static files (CSS, uploaded files, etc.)

// Setting the view engine to EJS
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views')); // Ensure correct views path

// MySQL connection setup
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'worship'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

// Multer configuration for file uploads
const storage = multer.diskStorage({
    destination: './public/uploads', // Upload folder
    filename: (req, file, cb) => {
        // Rename the uploaded file
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

// Set file size limit to 50MB
const upload = multer({
    storage: storage,
    limits: { fileSize: 50000000 } // Limit file size to 50MB
}).single('song');

// Route to display the index page and fetch songs from the database
app.get('/', (req, res) => {
    db.query('SELECT * FROM songs', (err, results) => {
        if (err) throw err;
        res.render('index', { songs: results });
    });
});

// Route to handle file uploads
app.post('/upload', (req, res) => {
    upload(req, res, (err) => {
        if (err instanceof multer.MulterError) {
            // Handle Multer errors specifically
            if (err.code === 'LIMIT_FILE_SIZE') {
                return res.send('Error: File is too large. Max size is 50MB.');
            }
        } else if (err) {
            console.error('Multer error:', err);
            return res.send('Error uploading file.');
        }

        const { song_name, artist_name } = req.body;
        const song_path = `/uploads/${req.file.filename}`;

        // SQL query to insert the uploaded song details into the database
        const query = 'INSERT INTO songs (song_name, artist_name, song_path) VALUES (?, ?, ?)';
        db.query(query, [song_name, artist_name, song_path], (err, result) => {
            if (err) throw err;
            res.redirect('/');
        });
    });
});

// Starting the server
app.listen(8080, () => {
    console.log('Server started on http://localhost:8080');
});
