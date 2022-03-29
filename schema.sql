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
ALTER TABLE animals ADD species_id SMALLINT NOT NULL;
ALTER TABLE animals ADD CONSTRAINT fkey_species_id FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fkey_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

create table vets(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT NOT NULL,
  date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  CONSTRAINT species_vet_pk PRIMARY KEY (species_id, vets_id),
  CONSTRAINT FK_species FOREIGN KEY (species_id) REFERENCES species (id),
  CONSTRAINT FK_vets FOREIGN KEY (vets_id) REFERENCES vets (id)
);

CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  date_of_visits DATE NOT NULL,
  CONSTRAINT animals_vet_pk PRIMARY KEY (animals_id, vets_id),
  CONSTRAINT FK_visits_animals FOREIGN KEY (animals_id) REFERENCES animals (id),
  CONSTRAINT FK_visits_vets FOREIGN KEY (vets_id) REFERENCES vets (id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animals_asc ON visits(animal_id ASC);
CREATE INDEX visits_vets_asc ON visits(vets_id ASC);
CREATE INDEX owners_email_asc ON owners(email ASC);