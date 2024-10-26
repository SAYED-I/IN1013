DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE IF NOT EXISTS pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20),
  owner VARCHAR(20),
  species VARCHAR(45),
  gender VARCHAR(20),
  birth DATE,
  death DATE,
  PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(20),
  remark VARCHAR(100),
  PRIMARY KEY (petname, eventdate), 
  FOREIGN KEY (petname) REFERENCES petPet(petname) 
);







