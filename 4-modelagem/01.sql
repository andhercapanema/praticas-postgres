CREATE DATABASE "pratica_modelagem";

CREATE TABLE "users" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    main_address_id INTEGER NOT NULL
);

CREATE TABLE "products" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    current_price INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    size_id INTEGER NOT NULL,
    main_image_id INTEGER NOT NULL
);

CREATE TABLE "products_categories" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE "products_sizes" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(1) NOT NULL UNIQUE
);

CREATE TABLE "products_images" (
    id SERIAL PRIMARY KEY,
    image_url TEXT NOT NULL,
    product_id INTEGER NOT NULL
);

CREATE TABLE "orders" (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    date DATE NOT NULL DEFAULT NOW(),
    address_id INTEGER NOT NULL
);

CREATE TABLE "orders_statuses" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(9) NOT NULL
);

CREATE TABLE "orders_products" (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    paid_price INTEGER NOT NULL
);

CREATE TABLE "users_addresses" (
    id SERIAL PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    number VARCHAR(10) NOT NULL,
    zip_code VARCHAR(9) NOT NULL,
    complement VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    city_id INTEGER NOT NULL,
    reference VARCHAR(50) NOT NULL,
    users_id INTEGER NOT NULL
);

CREATE TABLE "cities" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    state_id INTEGER NOT NULL
);

CREATE TABLE "states" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

ALTER TABLE users ADD CONSTRAINT users_fk0 FOREIGN KEY (main_address_id) REFERENCES users_addresses(id);

ALTER TABLE products ADD CONSTRAINT products_fk0 FOREIGN KEY (category_id) REFERENCES products_categories(id);

ALTER TABLE products ADD CONSTRAINT products_fk1 FOREIGN KEY (size_id) REFERENCES products_sizes(id);

ALTER TABLE products ADD CONSTRAINT products_fk2 FOREIGN KEY (main_image_id) REFERENCES products_images(id);

ALTER TABLE products_images ADD CONSTRAINT products_images_fk0 FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE orders ADD CONSTRAINT orders_fk0 FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE orders ADD CONSTRAINT orders_fk1 FOREIGN KEY (status_id) REFERENCES orders_statuses(id);

ALTER TABLE orders ADD CONSTRAINT orders_fk2 FOREIGN KEY (address_id) REFERENCES users_addresses(id);

ALTER TABLE orders_products ADD CONSTRAINT orders_products_fk0 FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE orders_products ADD CONSTRAINT orders_products_fk1 FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE users_addresses ADD CONSTRAINT users_addresses_fk0 FOREIGN KEY (city_id) REFERENCES cities(id);

ALTER TABLE users_addresses ADD CONSTRAINT users_addresses_fk1 FOREIGN KEY (users_id) REFERENCES users(id);

ALTER TABLE cities ADD CONSTRAINT cities_fk0 FOREIGN KEY (state_id) REFERENCES states(id);