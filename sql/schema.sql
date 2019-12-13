-- DROP TABLE location;

-- CREATE TABLE IF NOT EXISTS location(
--     id SERIAL PRIMARY KEY,
--     search_query VARCHAR(255) NOT NULL,
--     formatted_address VARCHAR(255) NOT NULL,
--     latitude FLOAT(20) NOT NULL,
--     longitude FLOAT(20) NOT NULL
-- );

-- INSERT INTO location (search_query, formatted_address, latitude, longitude) VALUES ('A', 'B', '1', '2');

DROP TABLE IF EXISTS location;

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    search_query VARCHAR(255),
    formatted_query VARCHAR(255),
    latitude NUMERIC(10, 7),
    longitude NUMERIC(10, 7)
  );

-- CREATE TABLE IF NOT EXISTS weather(
--   id SERIAL PRIMARY KEY,
--   forecast VARCHAR(255),
--   'time' VARCHAR(255)
-- );

-- CREATE TABLE IF NOT EXISTS yelp(
--   id SERIAL PRIMARY KEY,
--   first_name VARCHAR(255),
--   last_name VARCHAR(255)
-- );

-- CREATE TABLE IF NOT EXISTS events(
--   id SERIAL PRIMARY KEY,
--   link VARCHAR(255),
--   'name' VARCHAR(255),
--   event_date VARCHAR(255),
--   summary VARCHAR(255)
-- );

-- CREATE TABLE IF NOT EXISTS movies(
--   id SERIAL PRIMARY KEY,
--   first_name VARCHAR(255),
--   last_name VARCHAR(255)
-- );

-- CREATE TABLE IF NOT EXISTS hiking(
--   id SERIAL PRIMARY KEY,
--   first_name VARCHAR(255),
--   last_name VARCHAR(255)
-- );