CREATE DATABASE makersbnb_test;
\c makersbnb_test;
CREATE TABLE listings (
id SERIAL PRIMARY KEY,
address VARCHAR(100),
description VARCHAR(200)
);