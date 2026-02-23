CREATE DATABASE MUSIC_STORE;
USE MUSIC_STORE;

-- 1. Genre and MediaType

CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120)
);

CREATE TABLE MediaType (
    media_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120)
);

-- 2. Employee

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY,
	last_name VARCHAR(120),
	first_name VARCHAR(120),
	title VARCHAR(120),
	reports_to INT,
  levels VARCHAR(255),
	birthdate DATE,
	hire_date DATE,
	address VARCHAR(255),
	city VARCHAR(100),
	state VARCHAR(100),
	country VARCHAR(100),
	postal_code VARCHAR(20),
	phone VARCHAR(50),
	fax VARCHAR(50),
	email VARCHAR(100)
);

-- 3. Customer

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(120),
    last_name VARCHAR(120),
    company VARCHAR(120),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(100),
    support_rep_id INT,
    FOREIGN KEY (support_rep_id)
        REFERENCES Employee(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Artist

CREATE TABLE Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120)
);

-- 5. Album

CREATE TABLE Album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(160),
    artist_id INT,
    FOREIGN KEY (artist_id)
        REFERENCES Artist(artist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Track

CREATE TABLE Track (
    track_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    album_id INT,
    media_type_id INT,
    genre_id INT,
    composer VARCHAR(220),
    milliseconds INT,
    bytes INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (album_id)
        REFERENCES Album(album_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (media_type_id)
        REFERENCES MediaType(media_type_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (genre_id)
        REFERENCES Genre(genre_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. Invoice

CREATE TABLE Invoice (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    billing_address VARCHAR(255),
    billing_city VARCHAR(100),
    billing_state VARCHAR(100),
    billing_country VARCHAR(100),
    billing_postal_code VARCHAR(20),
    total DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 8. InvoiceLine

CREATE TABLE InvoiceLine (
    invoice_line_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    track_id INT,
    unit_price DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (invoice_id)
        REFERENCES Invoice(invoice_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (track_id)
        REFERENCES Track(track_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 9. Playlist

CREATE TABLE Playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- 10. PlaylistTrack

CREATE TABLE PlaylistTrack (
    playlist_id INT,
    track_id INT,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id)
        REFERENCES Playlist(playlist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (track_id)
        REFERENCES Track(track_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
