-- from the terminal run:
-- psql < doctors.sql

DROP DATABASE IF EXISTS doctors;

CREATE DATABASE doctors;

\c doctors


CREATE TABLE doctors (
  id SERIAL PRIMARY KEY
  name TEXT NOT NULL,
  specialty TEXT NOT NULL

)

CREATE TABLE patients (
  id SERIAL PRIMARY KEY
  insurance TEXT NOT NULL
  birthday TEXT not NULL
)


CREATE TABLE visits (
  id SERIAL PRIMARY KEY
  doctor_id INTEGER REFERENCES doctors
  patient_id INTEGER REFERENCES patients
)


-- CREATE TABLE doctors
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   specialty TEXT NOT NULL,
--   location TEXT NOT NULL,
--   patients_this_doctor_has INTEGER REFERENCES patient ON DELETE CASCADE
-- );


-- CREATE TABLE patients (
--   patient_id SERIAL PRIMARY KEY,
--   patient_name TEXT NOT NULL,
--   insurance TEXT NOT NULL,
--   birthday TEXT NOT NULL,
-- );


-- CREATE TABLE diseases (
--   id
--   name
--   -- Many patients may have many diseases
--   patient_id INTEGER REFERENCES patient ON DELETE CASCADE
-- )

