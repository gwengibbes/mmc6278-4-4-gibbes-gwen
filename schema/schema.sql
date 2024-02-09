CREATE DATABASE IF NOT EXISTS music_db;

USE music_db;

CREATE TABLE artists (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- create a "name" column that's a VARCHAR of max 100 characters
name VARCHAR(100)
);

CREATE TABLE albums (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- create a "name" column that's a VARCHAR of max 100 characters
name VARCHAR(100),
-- create an "artist_id" column that's an INTeger
artist_id INT,
-- create a "release_year" column that's an INTeger
release_year INT,
  FOREIGN KEY (artist_id)
    REFERENCES artists (id)
    ON DELETE CASCADE
);

CREATE TABLE songs (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- create a "name" column that's a VARCHAR of max 100 characters
name VARCHAR(100),
-- create a "track_number" column that's an INTeger
track_number INT,
-- create an "artist_id" column that's an INTeger
artist_id INT,
-- create an "album_id" column that's an INTeger
album_id INT,
  FOREIGN KEY (artist_id)
    REFERENCES artists (id)
    ON DELETE CASCADE,
  FOREIGN KEY (album_id)
    REFERENCES albums (id)
    ON DELETE CASCADE
);

-- NOTE: The foreign key constraINTs above ensure that when, for example,
-- an artist is deleted, that artist's songs and albums are also removed.
-- When an album is removed, that album's songs are also removed.