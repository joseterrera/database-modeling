-- from the terminal run:
-- psql < doctors.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist
-- users will share a connection with reg90n, each user will have a preferred location
-- posts will share a connection with all other tables:
  -- 1. a user can have many posts
  -- 2. a user will post in one category
  -- 3. a user will post in one region


CREATE TABLE region (
  id SERIAL PRIMARY KEY,
  location TEXT NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  location INTEGER REFERENCES region
);



CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  user_id INTEGER REFERENCES users,
  category_id INTEGER REFERENCES categories,
  location_id INTEGER REFERENCES region

);




INSERT INTO users
  (id, username, password, location)
VALUES
  (1, 'The Sun', 'Password1', 1),
  (2, 'The Sunssset', 'Password2', 2),
  (3, 'Theeeee Sun', 'Password3', 3);


INSERT INTO region
  (id, location)
VALUES
  (1, 'Londonn'), 
  (2, 'Sunnyva'),
  (3, 'Nueva York'); 




INSERT INTO categories
  (id, name)
VALUES
  (1, 'Furniture'), 
  (2, 'electronics'),
  (3, 'rooms for rent'); 



INSERT INTO posts
  (id, title, description, user_id, category_id, location_id)
VALUES
  (1, 'Finch', 'Lorem ipsum dolor', 1, 1,2), 
  (2, 'Gathercoal', 'En un lugar de la mancha', 1,2,3),
  (3, 'Pauley',  'Longtemps je me suis couche de bonne heure' ,3,2,1); 
