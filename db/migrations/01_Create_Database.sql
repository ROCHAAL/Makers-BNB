CREATE DATABASE makersbnb;
\c makersbnb;
CREATE TABLE listings (
id SERIAL PRIMARY KEY,
address VARCHAR(100),
description VARCHAR(200)
);