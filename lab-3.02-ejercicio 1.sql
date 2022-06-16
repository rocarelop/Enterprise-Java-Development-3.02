CREATE SCHEMA demo;
USE demo;
CREATE TABLE books(
id INT PRIMARY KEY,
author VARCHAR(50),
title VARCHAR(100));

CREATE TABLE specifications_books(
title VARCHAR (50) PRIMARY KEY,
word_count INT,
views INT);


