/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg DECIMAL NOT NULL
);

ALTER TABLE
  animals
ADD
  species varchar(255);

create table owners(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  age INT NOT NULL
);

create table species(
 id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(255) NOT NULL
);

alter table animals drop column species;