CREATE DATABASE "pratica_modelagem_movie_rental";

CREATE TABLE "movies_categories" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE "movies" (
    id SERIAL NOT NULL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    category_id INTEGER NOT NULL REFERENCES movies_categories(id)
);

CREATE TABLE "movies_disks" (
    id SERIAL NOT NULL PRIMARY KEY,
    bar_code TEXT NOT NULL UNIQUE,
    movie_id INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE "countries" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE "actors" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    birth_date DATE NOT NULL
);

CREATE TABLE "movies_actors" (
    id SERIAL NOT NULL PRIMARY KEY,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    actor_id INTEGER NOT NULL REFERENCES actors(id)
);

CREATE TABLE "states" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id)
);

CREATE TABLE "cities" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    state_id INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE "customers_addresses" (
    id SERIAL NOT NULL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT,
    district TEXT NOT NULL,
    zip_code TEXT NOT NULL,
    city_id INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE "customers" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    address_id INTEGER NOT NULL REFERENCES customers_addresses(id)
);

CREATE TABLE "phones" (
    id SERIAL NOT NULL PRIMARY KEY,
    phone_number TEXT NOT NULL UNIQUE
);

CREATE TABLE "customers_phones" (
    id SERIAL NOT NULL PRIMARY KEY,
    phone_id INTEGER NOT NULL REFERENCES phones(id)
    customer_id INTEGER NOT NULL REFERENCES customers(id)
);

CREATE TABLE "locations" (
    id SERIAL NOT NULL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers(id),
    location_date DATE NOT NULL DEFAULT NOW(),
    return_date DATE,
    location_rate integer
);

CREATE TABLE "locations_disks" (
    id SERIAL NOT NULL PRIMARY KEY,
    location_id INTEGER NOT NULL REFERENCES locations(id),
    movie_disk_id INTEGER NOT NULL REFERENCES movies_disks(id)
);

CREATE TABLE "movies_rating" (
    id SERIAL NOT NULL PRIMARY KEY,
    location_id INTEGER NOT NULL REFERENCES locations(id),
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    movie_rate INTEGER NOT NULL
);
