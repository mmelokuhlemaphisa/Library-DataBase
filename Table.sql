CREATE DATABASE LibraryDB;


CREATE TABLE authors (
    authorId SERIAL PRIMARY KEY,
    authorName VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    birth_year INT,
    death_year INT  
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT REFERENCES authors(id),
    genres VARCHAR(100)[] ,
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE patrons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    borrowed_books INT[] DEFAULT ARRAY[]::INT[]
);