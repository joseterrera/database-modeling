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
  head_referee_id INTEGER REFERENCES referees,
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

-- can we make a table with 3 options? for match_id win, loss or draw
CREATE TABLE results (
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams,
  match_id INTEGER REFERENCES matches
);



INSERT INTO teams
  (id, name, city)
VALUES
  (1, 'Team Portland', 'Oregon'),
  (2, 'Team Beaverton', 'Oregon'),
  (3, 'Team Ocreanside', 'California');

-- any other way to eacape quotes
INSERT INTO players
  (id, name, birthday, height, team_id)
VALUES
  (1, 'Ricky', 'Sep 11, 1999', '5 11', 1),
  (1, 'Joe', 'Aug 1, 1991', '5 6', 2),
  (1, 'Jerry', 'Oct 18, 1995', '5 9', 3);


INSERT INTO referees
  (id, name)
VALUES
  (1, 'Jones'),
  (2, 'Peters'),
  (3, 'Murphy'),
  (4, 'Sanchez');


INSERT INTO season
  (id, start_date, end_date)
VALUES
  (1, 'March 20 2020', 'June 21, 2020'),
  (2, 'July 11, 2020', 'Aug 20, 2020'),
  (3, 'September 10, 2020', 'October 30, 2020');


INSERT into matches
  (id, location, date, start_time, season_id, home_team_id, away_team_id, head_referee_id,assistant_referee_1_id , assistant_referee_2_id)
VALUES
  (1, 'OR', 'June 12, 2020', '3om', '1', '2', '3', '1', '2', '3'),
  (1, 'OR', 'June 19, 2020', '1om', '2', '2', '1', '3', '2', '1'),
  (1, 'CA', 'September 10, 2020', '12om', '3', '1', '2', '2', '3', '3'),
  (1, 'OR', 'August 1, 2020', '3om', '1', '3', '2', '1', '2', '3');



INSERT into table lineups
    (id, player_id, match_id, team_id)
VALUES
  (1,2,3,1),
  (2,3,2,1),
  (3,3,1,2);

INSERT INTO TABLE goals
  (id, player_id, match_id)
VALUES
  (1, 2, 2),
  (2, 1, 1),
  (3, 2, 2);


INSERT INTO TABLE results
  (id, team_id, match_id)
VALUES
  (1, 2, 3),
  (2, 1, 1),
  (3, 2, 2);