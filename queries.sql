SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016/01/01' AND '2019/12/31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species LIKE 'unspecified';
SELECT species from animals;
COMMIT;
SELECT species from animals;

BEGIN;
DELETE FROM animals
SELECT COUNT(*) FROM ANIMALS;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01/01/2022';
SAVEPOINT savepoint_1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint_1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01/01/1990' AND '31/12/2000';

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name='Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id=species.id WHERE species_id=1;

SELECT animals.name, full_name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;
SELECT species.name, COUNT(*) from animals JOIN species ON animals.species_id=species.id GROUP BY species.name;

SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;

SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 1 ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 3;

SELECT vets.name, species.name FROM vets JOIN specializations ON vets.id = specializations.vets_id JOIN species ON specializations.species_id = species.id;
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 3 AND visits.date_of_visit >='04-01-2020' AND visits.date_of_visit <='08-30-2020';

SELECT COUNT(*) FROM visits JOIN animals ON animals.id = visits.animals_id GROUP BY animals.name;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets  ON vets.id = visits.vets_id WHERE vets.id = 2 ORDER BY visits.date_of_visit LIMIT 1;
SELECT animals.*, vets.*, vistis.visit_date FROM visits LEFT JOIN animals ON animals.id = visits.animal_id LEFT JOIN vets ON vets.id = visits.vet_id ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(*) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 2;

SELECT species.name, COUNT(visits.animals_id) FROM visits JOIN vets ON visits.vets_id = vets.id FULL JOIN animals ON visits.animals_id = animals.id JOIN species  ON species.id = animals.species_id WHERE vets.id = 2 
GROUP BY species.name;