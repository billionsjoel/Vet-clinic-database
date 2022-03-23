/*Queries that provide answers to the questions from all projects.*/

--By :- Billions A joel

--select statements
SELECT DISTINCT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016/01/01' AND date_of_birth <= '2019/31/12';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name ='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
select * from animals where neutered=true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 AND weight_kg <=17.3;

--Transactions
begin transaction;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
select * from animals;
rollback;
select * from animals;
end transaction;


begin transaction;
update animals set species='digimon' where name like '%mon';
select * from animals;
update animals set species='pokemon' where species='';
select * from animals;
commit;
end transaction;


begin transaction;
delete from animals;
select * from animals;
rollback;
select * from animals;
end transaction;

begin;
delete from animals where date_of_birth >= '2022-01-01';
select * from animals;
savepoint sp1;
update animals set weight_kg = weight_kg * -1;
rollback to sp1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;
end;

--Join tables and query them with aggregate functions
select count(*) DISTINCT from animals;
select count(*) from animals where escape_attempts =0;
select avg(weight_kg) from animals;
select name from animals where escape_attempts = (select max(escape_attempts) from animals);
select min(weight_kg), max(weight_kg) from animals;
select avg(escape_attempts) from animals where date_of_birth >= '1990-01-01' and date_of_birth <= '2000-01-01';

SELECT owners.id, COUNT(*) AS owner_count FROM owners JOIN animals ON owners.id = animals.owner_id;
SELECT owners.full_name, COUNT(full_name) AS owner_count FROM owners JOIN animals ON owners.id = animals.owner_id group by 1 order by owner_count desc LIMIT 1;

select * from animals inner join owners on animals.owner_id = owners.id where full_name='Melody Pond';
select * from animals inner join species on animals.species_id = species.id where species.name='pokemon';
select owners.full_name,animals.name from animals inner join owners on animals.owner_id =owners.id order by owners.full_name;
select species.name, count(*) from animals inner join species on animals.species_id = species.id group by species.name;
select * from animals join species on animals.species_id = species.id join owners on animals.owner_id = owners.id where full_name = 'Jennifer Orwell' and species.name = 'Digimon';
select * from animals join species on animals.species_id = species.id join owners on animals.owner_id = owners.id where full_name = 'Dean Winchester' and escape_attempts <= 0;

