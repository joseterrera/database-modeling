-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday TEXT NOT NULL,
  height TEXT NOT NULL,
  team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
  
)

CREATE TABLE lineups ()

CREATE TABLE season ()
å
CREATE TABLE matches ()

CREATE TABLE goals()

CREATE TABLE results ()