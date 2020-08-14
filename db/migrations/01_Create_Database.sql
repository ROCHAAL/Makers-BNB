CREATE DATABASE makersbnb;
\c makersbnb;
CREATE TABLE listings (
id SERIAL PRIMARY KEY,
address VARCHAR(100),
description VARCHAR(200),
available_dates VARCHAR(100),
price_per_night VARCHAR(10),
booking_status VARCHAR (10) DEFAULT 'available'
);