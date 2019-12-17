
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

INSERT INTO city_table (city_name, formatted_query, latitude, longitude) VALUES ('seattle', 'seattle', '47', '-122');

-- CREATE TABLE IF NOT EXISTS events(
--   id SERIAL PRIMARY KEY,
--   link VARCHAR(255),
--   'name' VARCHAR(255),
--   event_date VARCHAR(255),
--   summary VARCHAR(255)
-- );

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
