\c midterm

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS votes CASCADE;
DROP TABLE IF EXISTS polls CASCADE;
DROP TABLE IF EXISTS  CASCADE;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);


CREATE TABLE polls (
  id SERIAL PRIMARY KEY,
  host INTEGER REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255),
  description TEXT,
  admin_url VARCHAR(255),
  voting_url VARCHAR(255),
);

CREATE TABLE votes (
  id SERIAL PRIMARY KEY,
  poll_id INTEGER REFERENCES polls(id) ON DELETE CASCADE,
  option_id INTEGER REFERENCES options(id) ON DELETE CASCADE,
  priority INTEGER,
  guest_name VARCHAR(255)
);

CREATE TABLE options (
  id SERIAL PRIMARY KEY,
  poll_id INTEGER REFERENCES polls(id) ON DELETE CASCADE,
  choice VARCHAR(255),
);
