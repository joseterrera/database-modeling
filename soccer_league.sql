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
   id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season (
  id SERIAL PRIMARY KEY,
  start_date TEXT not NULL,
  end_date TEXT NOT null
);

CREATE TABLE matches (
  id SERIAL PRIMARY key,
  location TEXT NOT NULL,
  date TEXT NOT NULL,
  start_time TEXT NOT NULL,
  season_id INTEGER REFERENCES season,
  home_team_id INTEGER REFERENCES teams,
  away_team_id INTEGER REFERENCES teams,
  head_referee_if INTEGER REFERENCES referees.
  assistant_referee_1_id INTEGER REFERENCES referees,
  assistant_referee_2_id INTEGER REFERENCES referees
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    team_id INTEGER REFERENCES teams
);




CREATE TABLE goals(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players,
  match_id INTEGER REFERENCES matches

);

-- can we make a table with 3 options?
CREATE TABLE results (
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams,
  match_id INTEGER REFERENCES matches
)