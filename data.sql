/* Populate database with sample data. */
  INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8.00),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11.00);

  INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Charmander', '2020-02-08', 0, true, -11),
  ('Plantmon', '2021-11-15', 2, true, -5.7),
  ('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45),
  ('Boarmon', '2005-06-07', 7, true, 20),
  ('Blossom', '1998-10-13', 3, true, 17),
  ('Ditto', '2022-05-14', 4, true, 22);

insert into owners(full_name, age) values('sam smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

insert into species(name) values('pokemon'),('Digimon');
update animals set species_id = (select id from species where name='Digimon') where name like '%mon';
update animals set owner_id = (select id from owners where full_name='sam smith') where name ='Agumon';
update animals set owner_id = (select id from owners where full_name='Jennifer Orwell') where name ='Gabumon' or name='Pikachu';
update animals set owner_id = (select id from owners where full_name='Bob') where name ='Devimon' or name='Plantmon';
update animals set owner_id = (select id from owners where full_name='Melody Pond') where name ='Charmander' or name='Squirtle' or name='Blossom';
update animals set owner_id = (select id from owners where full_name='Dean Winchester') where name ='Angemon' or name='Boarmon';

select * from animals inner join owners on animals.owner_id = owners.id where full_name='Melody Pond';
select * from animals inner join species on animals.species_id = species.id where species.name='pokemon';
select owners.full_name,animals.name from animals inner join owners on animals.owner_id =owners.id order by owners.full_name;
select species.name, count(*) from animals inner join species on animals.species_id = species.id group by species.name;
select * from animals join species on animals.species_id = species.id join owners on animals.owner_id = owners.id where full_name = 'Jennifer Orwell' and species.name = 'Digimon';