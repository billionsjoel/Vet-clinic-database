/*Queries that provide answers to the questions from all projects.*/

SELECT DISTINCT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016/01/01' AND date_of_birth <= '2019/31/12';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name ='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
select * from animals where neutered=true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 AND weight_kg <=17.3;

begin transaction;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
select * from animals;
rollback;
select * from animals;

