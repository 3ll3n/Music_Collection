DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS albums CASCADE;


CREATE TABLE artists(
  id SERIAL4 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE albums(
  id SERIAL4 primary key,
  title VARCHAR(255) not null,
  genre VARCHAR(255) not null,
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE
);