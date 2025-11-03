
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

-- Update operations
-- 5. Mark a book as borrowed (set available = false) for book id = 1
UPDATE books SET available = FALSE WHERE id = 1;

-- 6. Add a new genre to an existing book (append to array)
UPDATE books SET genres = array_append(genres, 'Political Satire') WHERE id = 1;

-- 7. Add a borrowed book to a patron's record (append book id to patron's borrowed_books)
UPDATE patrons SET borrowed_books = array_append(borrowed_books, 1) WHERE id = 1;

-- Delete operations
-- 8. Delete a book by title
DELETE FROM books WHERE title = 'The Great Gatsby';

-- 9. Delete an author by ID
DELETE FROM authors WHERE id = 10; -- be careful: existing books referencing this author will have author_id set to NULL (ON DELETE SET NULL)

-- Advanced queries
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

 