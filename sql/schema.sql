CREATE TABLE IF NOT EXISTS weather(
  id SERIAL PRIMARY KEY,
  forecast VARCHAR(255),
  'time' VARCHAR(255)
);

-- CREATE TABLE IF NOT EXISTS yelp(
--   id SERIAL PRIMARY KEY,
--   first_name VARCHAR(255),
--   last_name VARCHAR(255)
-- );

CREATE TABLE IF NOT EXISTS events(
  id SERIAL PRIMARY KEY,
  link VARCHAR(255),
  'name' VARCHAR(255),
  event_date VARCHAR(255),
  summary VARCHAR(255)
);

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