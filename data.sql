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

insert into vets(name, age, date_of_graduation)
values('William Tatcher', 45, '2000-04-23'),
values('Maisy Smith', 26, '2019-01-17'),
values('Stephanie Mendez', 64, '1981-05-04'),
values('Jack Harkness ', 38, '2008-06-08');

insert into specializations(species_id, vets_id) values((select id from species where name='pokemon'), (select id from vets where name='William Tatcher'));
insert into specializations(species_id, vets_id) values((select id from species where name='Digimon'), (select id from vets where name='Stephanie Mendez'));
insert into specializations(species_id, vets_id) values((select id from species where name='pokemon'), (select id from vets where name='Stephanie Mendez'));
insert into specializations(species_id, vets_id) values((select id from species where name='Digimon'), (select id from vets where name='Jack Harkness'));

insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Agumon'), (select id from vets where name='William Tatcher'), '2020-06-24');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Agumon'), (select id from vets where name='Stephanie Mendez'), '2020-07-22');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Gabumon'), (select id from vets where name='Jack Harkness '), '2021-02-02');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Pikachu'), (select id from vets where name='Maisy Smith'), '2020-01-05');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Pikachu'), (select id from vets where name='Maisy Smith'), '2020-05-14');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Devimon'), (select id from vets where name='Stephanie Mendez'), '2021-05-04');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Charmander'), (select id from vets where name='Jack Harkness '), '2021-02-24');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Plantmon'), (select id from vets where name='Maisy Smith'), '2019-12-21');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Plantmon'), (select id from vets where name='William Tatcher'), '2020-08-10');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Plantmon'), (select id from vets where name='Maisy Smith'), '2021-04-07');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Squirtle'), (select id from vets where name='Stephanie Mendez'), '2019-09-29');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Angemon'), (select id from vets where name='Jack Harkness '), '2020-11-04');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Boarmon'), (select id from vets where name='Maisy Smith'), '2019-05-15');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Boarmon'), (select id from vets where name='Maisy Smith'), '2020-03-08');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Blossom'), (select id from vets where name='Stephanie Mendez'), '2020-05-24');
insert into visits(animals_id, vets_id, date_of_visits) values((select id from animals where name='Blossom'), (select id from vets where name='William Tatcher'), '2021-01-11');
