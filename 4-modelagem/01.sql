CREATE DATABASE "pratica_modelagem";

CREATE TABLE "users" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "products" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    price INTEGER NOT NULL,
    category VARCHAR(50) NOT NULL,
    size VARCHAR(1) NOT NULL
);

CREATE TABLE "products_images" (
    id SERIAL PRIMARY KEY,
    image_url TEXT NOT NULL,
    product_id INTEGER NOT NULL REFERENCES "products"("id")
);

CREATE TABLE "sales" (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "users"("id"),
    status VARCHAR(9) NOT NULL,
    date TIMESTAMP NOT NULL NOW(),
    delivery_address TEXT NOT NULL,
);

CREATE TABLE "sales_products" (
    id SERIAL PRIMARY KEY,
    sale_id INTEGER NOT NULL REFERENCES "sales"("id"),
    product_id INTEGER NOT NULL REFERENCES "products"("id"),
    amount INTEGER NOT NULL
);