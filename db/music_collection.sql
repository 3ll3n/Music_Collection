DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL4 primary key,
  name VARCHAR(255) 
)

CREATE TABLE albums(
  id SERIAL4 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
)