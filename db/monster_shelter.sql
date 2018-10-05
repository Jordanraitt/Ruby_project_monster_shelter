DROP TABLE trainers;
DROP TABLE monsters;

CREATE TABLE trainer(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE monsters(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  trainer_id INT4 REFERENCES trainer(id)
);
