CREATE DATABASE "pratica_modelagem_agencia_de_viagens";

CREATE TABLE "companies" (
    id SERIAL NOT NULL PRIMARY KEY,
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE "airports" (
    id SERIAL NOT NULL PRIMARY KEY,
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE "flights" (
    id SERIAL NOT NULL PRIMARY KEY,
    take_off_airport_id INTEGER NOT NULL REFERENCES airports(id),
    land_airport_id INTEGER NOT NULL REFERENCES airports(id),
    key TEXT NOT NULL UNIQUE,
    take_off_time TIMESTAMP NOT NULL,
    land_time TIMESTAMP NOT NULL,
    company_id INTEGER NOT NULL REFERENCES companies(id)
);
