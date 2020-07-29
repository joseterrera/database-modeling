-- from the terminal run:
-- psql < doctors.sql

DROP DATABASE IF EXISTS doctors;

CREATE DATABASE doctors;

\c doctors


-- doctors, patients and diseases will be relatively simple
--  There will be two more tables that will connect doctors, patients and diseases
--  visits will have connection with one doctor and one patient
-- diagnosis will share a connection with the diseases table, as it will need a disease id, and it
-- will also share a connection with the visits table

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty TEXT NOT NULL
);


CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  insurance TEXT NOT NULL,
  birthday TEXT not NULL
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors,
  patient_id INTEGER REFERENCES patients
);


CREATE TABLE diagnosis (
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits,
  disease_id INTEGER REFERENCES diseases,
  notes TEXT

);


INSERT INTO doctors
  (id, name, specialty)
VALUES
  (1, 'The Sun', 'Milky Way'),
  (2, 'The Sunsss', 'Milky Way'),
  (3, 'Theeeee Sun', 'Milky Wayssss');


INSERT INTO patients 
  (id, insurance, birthday)
VALUES
  (1, 'Finch', '2018-04-08 09:00:00'), 
  (2, 'Gathercoal', '2018-12-19 12:45:00'),
  (3, 'Pauley',  '2018-01-02 07:00:00'); 


INSERT INTO diseases
  (id, name, description)
VALUES
  (1, 'One', 'Two'),
  (2, 'Three', 'Four'),
  (3, 'Five', 'Six');


INSERT INTO visits
  (id, doctor_id, patient_id)
VALUES
  (1,2,2),
  (2,2,1),
  (3,3,3);


INSERT INTO  diagnosis
  (id, visit_id, disease_id)
VALUES
  (1,2,2),
  (2,2,1),
  (3,3,3);
