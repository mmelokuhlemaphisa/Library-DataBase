# Library Management System (PostgreSQL)

A comprehensive library management system built with PostgreSQL that manages books, authors, and patrons. This system allows for complete CRUD operations and advanced querying capabilities.

---

## 🎯 Project Overview

This Library Management System provides functionality to:

- Manage a collection of books with multiple genres
- Track author information and relationships
- Handle patron records and borrowed books
- Perform complex queries and data operations

---


## 🚀 Setup Instructions

### Prerequisites

- PostgreSQL installed on your system
- pgAdmin or psql command-line tool
- Access to create databases

---

## 📅 Sprint Breakdown

### Sprint 1: Project Setup ✅

**Tasks:**

- [x] Create database `LibraryDB`
- [x] Create `authors` table
- [x] Create `books` table
- [x] Create `patrons` table

**SQL Code:**

```sql
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
```

**File:** `Table.sql`

### Sprint 2: Insert Data ✅

**Tasks:**

- [x] Insert 10 authors
- [x] Insert 10 books
- [x] Insert 10 patrons

**SQL Code:**

```sql
-- Insert Authors
INSERT INTO authors (authorName, nationality, birth_year, death_year)
VALUES
('George Orwell', 'British', 1903, 1950),
('Harper Lee', 'American', 1926, 2016),
('F. Scott Fitzgerald', 'American', 1896, 1940),
('Aldous Huxley', 'British', 1894, 1963),
('J.D. Salinger', 'American', 1919, 2010),
('Herman Melville', 'American', 1819, 1891),
('Jane Austen', 'British', 1775, 1817),
('Leo Tolstoy', 'Russian', 1828, 1910),
('Fyodor Dostoevsky', 'Russian', 1821, 1881),
('J.R.R. Tolkien', 'British', 1892, 1973);

-- Insert Books
INSERT INTO books (title, authorId, genres, published_year, available)
VALUES
('1984', 1, ARRAY['Dystopian','Political Fiction'], 1949, TRUE),
('To Kill a Mockingbird', 2, ARRAY['Southern Gothic','Bildungsroman'], 1960, TRUE),
('The Great Gatsby', 3, ARRAY['Tragedy'], 1925, TRUE),
('Brave New World', 4, ARRAY['Dystopian','Science Fiction'], 1932, TRUE),
('The Catcher in the Rye', 5, ARRAY['Realist Novel','Bildungsroman'], 1951, TRUE),
('Moby-Dick', 6, ARRAY['Adventure Fiction'], 1851, TRUE),
('Pride and Prejudice', 7, ARRAY['Romantic Novel'], 1813, TRUE),
('War and Peace', 8, ARRAY['Historical Novel'], 1869, TRUE),
('Crime and Punishment', 9, ARRAY['Philosophical Novel'], 1866, TRUE),
('The Hobbit', 10, ARRAY['Fantasy'], 1937, TRUE);

-- Insert Patrons
INSERT INTO patrons (name, email, borrowed_books)
VALUES
('Alice Johnson', 'alice@example.com', ARRAY[]::INT[]),
('Bob Smith', 'bob@example.com', ARRAY[1,2]),
('Carol White', 'carol@example.com', ARRAY[]::INT[]),
('David Brown', 'david@example.com', ARRAY[3]),
('Eve Davis', 'eve@example.com', ARRAY[]::INT[]),
('Frank Moore', 'frank@example.com', ARRAY[4,5]),
('Grace Miller', 'grace@example.com', ARRAY[]::INT[]),
('Hank Wilson', 'hank@example.com', ARRAY[6]),
('Ivy Taylor', 'ivy@example.com', ARRAY[]::INT[]),
('Jack Anderson', 'jack@example.com', ARRAY[7,8]);
```

**File:** `InsertData.sql`

### Sprint 3: Read Operations (Queries) ✅

**Tasks:**

- [x] Get all books
- [x] Get a book by title
- [x] Get all books by a specific author
- [x] Get all available books

**SQL Code:**

```sql
-- 1. Get all books
SELECT * FROM books;

-- 2. Get a book by title (example: '1984')
SELECT * FROM books WHERE title = '1984';

-- 3. Get all books by a specific author (by author name)
SELECT b.*
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE a.name = 'George Orwell';

-- 4. Get all available books
SELECT * FROM books WHERE available = TRUE;
```

**File:** `Quaries.sql`

### Sprint 4: Update Operations ✅

**Tasks:**

- [x] Mark a book as borrowed (set available = false)
- [x] Add a new genre to an existing book
- [x] Add a borrowed book to a patron's record

**SQL Code:**

```sql
-- 5. Mark a book as borrowed (set available = false) for book id = 1
UPDATE books SET available = FALSE WHERE id = 1;

-- 6. Add a new genre to an existing book (append to array)
UPDATE books SET genres = array_append(genres, 'Political Satire') WHERE id = 1;

-- 7. Add a borrowed book to a patron's record (append book id to patron's borrowed_books)
UPDATE patrons SET borrowed_books = array_append(borrowed_books, 1) WHERE id = 1;
```

**File:** `Quaries.sql`

### Sprint 5: Delete Operations ✅

**Tasks:**

- [x] Delete a book by title
- [x] Delete an author by ID

**SQL Code:**

```sql
-- 8. Delete a book by title
DELETE FROM books WHERE title = 'The Great Gatsby';

-- 9. Delete an author by ID
DELETE FROM authors WHERE id = 10;
```

**File:** `Quaries.sql`

### Sprint 6: Advanced Queries ✅

**Tasks:**

- [x] Find books published after 1950
- [x] Find all American authors
- [x] Set all books as available
- [x] Find all books that are available AND published after 1950
- [x] Find authors whose names contain "George"
- [x] Increment the published year 1869 by 1

**SQL Code:**

```sql
-- 10. Find books published after 1950
SELECT * FROM books WHERE published_year > 1950;

-- 11. Find all American authors
SELECT * FROM authors WHERE nationality = 'American';

-- 12. Set all books as available
UPDATE books SET available = TRUE;

-- 13. Find all books that are available AND published after 1950
SELECT * FROM books WHERE available = TRUE AND published_year > 1950;

-- 14. Find authors whose names contain 'George'
SELECT * FROM authors WHERE name ILIKE '%George%';

-- 15. Increment the published year 1869 by 1
UPDATE books SET published_year = published_year + 1 WHERE published_year = 1869;
```

**File:** `Quaries.sql`

### Sprint 7: Documentation ✅

**Tasks:**

- [x] Document all SQL commands in README.md
- [x] Include instructions for running queries in pgAdmin or psql

**Running in pgAdmin:**

1. Open pgAdmin and connect to PostgreSQL server
2. Create new database: `LibraryDB`
3. Open Query Tool
4. Execute scripts in order: `Table.sql` → `InsertData.sql` → `Quaries.sql`

**Running in psql:**

```bash
# Connect to PostgreSQL
psql -U your_username -d postgres

# Create database
CREATE DATABASE LibraryDB;

# Connect to library database
\c LibraryDB

# Execute scripts
\i Table.sql
\i InsertData.sql
\i Quaries.sql
```

**File:** This `README.md` document



## 📁 File Structure

```
Library-DataBase/
├── README.md           # Project documentation (this file)
├── Table.sql          # Database schema creation
├── InsertData.sql     # Sample data insertion
└── Quaries.sql        # Query examples and operations
```

## 🎉 Project Completion Status

All sprints have been successfully completed with full functionality:

- ✅ Database structure created
- ✅ Sample data populated
- ✅ CRUD operations implemented
- ✅ Advanced queries functional
- ✅ Documentation complete

---

_This project demonstrates proficiency in PostgreSQL database design, SQL query writing, and comprehensive data management for a real-world library system._
