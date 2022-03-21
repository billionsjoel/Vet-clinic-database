/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT,
  nuetered BOOL,
  weight_kg DECIMAL
);
