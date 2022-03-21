/*Queries that provide answers to the questions from all projects.*/

SELECT DISTINCT name FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
