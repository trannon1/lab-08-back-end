DROP TABLE city_table;
CREATE TABLE IF NOT EXISTS city_table(
  id SERIAL PRIMARY KEY NOT NULL,
  city_name VARCHAR(255) NOT NULL,
  formatted_query VARCHAR(255) NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL
);

INSERT INTO city_table (city_name, formatted_query, latitude, longitude) VALUES ('seattle', 'seattle', '47', '-122');

-- -- DROP TABLE yelp,
-- -- CREATE TABLE IF NOT EXISTS yelp(
-- --   id SERIAL PRIMARY KEY,
-- --   first_name VARCHAR(255),
-- --   last_name VARCHAR(255)
-- -- );

-- DROP TABLE events,
-- CREATE TABLE IF NOT EXISTS events(
--   id SERIAL PRIMARY KEY,
--   link VARCHAR(255),
--   'name' VARCHAR(255),
--   event_date VARCHAR(255),
--   summary VARCHAR(255)
-- );

-- -- DROP TABLE movies,
-- -- CREATE TABLE IF NOT EXISTS movies(
-- --   id SERIAL PRIMARY KEY,
-- --   first_name VARCHAR(255),
-- --   last_name VARCHAR(255)
-- -- );

-- -- DROP TABLE hiking,
-- -- CREATE TABLE IF NOT EXISTS hiking(
-- --   id SERIAL PRIMARY KEY,
-- --   first_name VARCHAR(255),
-- --   last_name VARCHAR(255)
-- -- );
