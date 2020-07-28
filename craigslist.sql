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


