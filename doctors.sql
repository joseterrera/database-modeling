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


CREATE TABLE diseases (
  id SERIAL PRIMARY KEY
  name TEXT NOT NULL
  description TEXT NOT NULL
)


CREATE TABLE diagnosis (
  id SERIAL PRIMARY KEY
  visit_id INTEGER REFERENCES visits
  disease_id INTEGER REFERENCES diseases
  notes TEXT

)


