CREATE DATABASE "pratica_modelagem_integridade";

CREATE TABLE "customers" (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "bank_accounts" (
    id SERIAL PRIMARY KEY,
    customers_id INTEGER NOT NULL,
    account_number TEXT NOT NULL UNIQUE,
    agency TEXT NOT NULL,
    open_date DATE NOT NULL DEFAULT NOW(),
    close_date DATE
);

CREATE TYPE transactions_types AS ENUM ('deposit', 'withdraw');

CREATE TABLE "transactions" (
    id SERIAL PRIMARY KEY,
    bank_accounts_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    type transactions_types,
    time TIMESTAMP NOT NULL DEFAULT NOW(),
    description VARCHAR(50),
    cancelled BOOL DEFAULT FALSE
);

CREATE TABLE "credit_cards" (
    id SERIAL PRIMARY KEY,
    bank_accounts_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    number VARCHAR(16) NOT NULL,
    security_code VARCHAR(3) NOT NULL,
    expiration_month INTEGER NOT NULL,
    expiration_year INTEGER NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);

CREATE TYPE phones_types AS ENUM ('landline', 'mobile');

CREATE TABLE "customers_phones" (
    id SERIAL PRIMARY KEY,
    customers_id INTEGER NOT NULL,
    number VARCHAR(20) NOT NULL,
    type phones_types
);

CREATE TABLE "customers_addresses" (
    id SERIAL PRIMARY KEY,
    customers_id INTEGER NOT NULL UNIQUE,
    street VARCHAR(50) NOT NULL,
    number VARCHAR(10) NOT NULL,
    complement VARCHAR(50) NOT NULL,
    postal_code VARCHAR(9) NOT NULL,
    city_id INTEGER NOT NULL
);

CREATE TABLE "cities" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    state_id INTEGER NOT NULL
);

CREATE TABLE "states" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE bank_accounts ADD CONSTRAINT bank_accounts_fk0 FOREIGN KEY (customers_id) REFERENCES customers(id);

ALTER TABLE transactions ADD CONSTRAINT transactions_fk0 FOREIGN KEY (bank_accounts_id) REFERENCES bank_accounts(id);

ALTER TABLE credit_cards ADD CONSTRAINT credit_cards_fk0 FOREIGN KEY (bank_accounts_id) REFERENCES bank_accounts(id);

ALTER TABLE customers_phones ADD CONSTRAINT customers_phones_fk0 FOREIGN KEY (customers_id) REFERENCES customers(id);

ALTER TABLE customers_addresses ADD CONSTRAINT customers_addresses_fk0 FOREIGN KEY (customers_id) REFERENCES customers(id);

ALTER TABLE customers_addresses ADD CONSTRAINT customers_addresses_fk1 FOREIGN KEY (city_id) REFERENCES cities(id);

ALTER TABLE cities ADD CONSTRAINT cities_fk0 FOREIGN KEY (state_id) REFERENCES states(id);