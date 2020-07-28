-- from the terminal run:
-- psql < doctors.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist



CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  users_location TEXT REFERENCES region
)

CREATE TABLE region (
  id SERIAL PRIMARY KEY
  location TEXT NOT NULL
)

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  user_id INTEGER REFERENCES users,
  category_id INTEGER REFERENCES category,
  location_id INTEGER REFERENCES region

)


