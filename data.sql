INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', TO_DATE('03/02/2020', 'DD/MM/YYYY'), 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', TO_DATE('12/05/2017', 'DD/MM/YYYY'), 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', TO_DATE('08/02/2020', 'DD/MM/YYYY'), 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', TO_DATE('15/11/2022', 'DD/MM/YYYY'), 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', TO_DATE('02/04/1993', 'DD/MM/YYYY'), 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', TO_DATE('12/06/2005', 'DD/MM/YYYY'), 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', TO_DATE('07/06/2005', 'DD/MM/YYYY'), 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', TO_DATE('13/10/1998', 'DD/MM/YYYY'), 3, true, 17);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '04-23-2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '01-17-2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '05-04-1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '06-08-2008');

INSERT INTO specializations(vets_id, species_id) VALUES (1, 1);
INSERT INTO specializations(vets_id, species_id) VALUES (3, 1);
INSERT INTO specializations(vets_id, species_id) VALUES (3, 2);
INSERT INTO specializations(vets_id, species_id) VALUES (4, 2);

INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 1, '05-24-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 1, '07-22-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 2, '02-02-2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, '01-05-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, '05-08-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, '05-14-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 4, '05-04-2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 5, '02-24-2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 6, '12-21-2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 6, '08-10-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 6, '04-07-2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 7, '09-29-2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 8, '10-03-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 8, '11-04-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '01-24-2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '05-15-2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '02-27-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '08-03-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 10, '05-24-2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 10, '01-11-2021');