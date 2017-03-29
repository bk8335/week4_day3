DROP TABLE houses;
DROP TABLE students;

CREATE TABLE students (
  id serial8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT2
);
CREATE TABLE houses(
  id serial8 PRIMARY KEY,
 name VARCHAR(255),
 logo VARCHAR(255)
)

