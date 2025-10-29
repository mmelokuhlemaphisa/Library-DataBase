INSERT INTO authors (authorName, nationality, birth_year, death_year) 
VALUES ('George Orwell', 'British', 1903, 1950),
('Harper Lee', 'American', 1926, 2016),
('F. Scott Fitzgerald', 'American', 1896, 1940),
('Aldous Huxley', 'British', 1894, 1963),
('J.D. Salinger', 'American', 1919, 2010),
('Herman Melville', 'American', 1819, 1891),
('Jane Austen', 'British', 1775, 1817),
('Leo Tolstoy', 'Russian', 1828, 1910),
('Fyodor Dostoevsky', 'Russian', 1821, 1881),
('J.R.R. Tolkien', 'British', 1892, 1973);


INSERT INTO books (title, authorId, genres, published_year, available) 
VALUES ('1984', 1, ARRAY['Dystopian','Political Fiction'], 1949, TRUE),
('To Kill a Mockingbird', 2, ARRAY['Southern Gothic','Bildungsroman'], 1960, TRUE),
('The Great Gatsby', 3, ARRAY['Tragedy'], 1925, TRUE),
('Brave New World', 4, ARRAY['Dystopian','Science Fiction'], 1932, TRUE),
('The Catcher in the Rye', 5, ARRAY['Realist Novel','Bildungsroman'], 1951, TRUE),
('Moby-Dick', 6, ARRAY['Adventure Fiction'], 1851, TRUE),
('Pride and Prejudice', 7, ARRAY['Romantic Novel'], 1813, TRUE),
('War and Peace', 8, ARRAY['Historical Novel'], 1869, TRUE),
('Crime and Punishment', 9, ARRAY['Philosophical Novel'], 1866, TRUE),
('The Hobbit', 10, ARRAY['Fantasy'], 1937, TRUE);


INSERT INTO patrons (name, email, borrowed_books)
 VALUES ('Alice Johnson', 'alice@example.com', ARRAY[]::INT[]),
('Bob Smith', 'bob@example.com', ARRAY[1,2]),
('Carol White', 'carol@example.com', ARRAY[]::INT[]),
('David Brown', 'david@example.com', ARRAY[3]),
('Eve Davis', 'eve@example.com', ARRAY[]::INT[]),
('Frank Moore', 'frank@example.com', ARRAY[4,5]),
('Grace Miller', 'grace@example.com', ARRAY[]::INT[]),
('Hank Wilson', 'hank@example.com', ARRAY[6]),
('Ivy Taylor', 'ivy@example.com', ARRAY[]::INT[]),