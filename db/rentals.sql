DROP TABLE rentals;
DROP table customers;
DROP TABLE stock;

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  forename VARCHAR(255),
  surname VARCHAR(255),
  dress_size INT
);

CREATE TABLE stock(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  category VARCHAR(255),
  designer VARCHAR(255),
  size INT,
  price INT,
  available BOOLEAN
);

CREATE TABLE rentals(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  stock_id INT REFERENCES stock(id) ON DELETE CASCADE,
  date_rented DATE
);
