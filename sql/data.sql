USE LibrarySystem;

-- =====================================================
-- INSERT MEMBERS (10+ records)
-- =====================================================
INSERT INTO Members (FirstName, LastName, Email, Phone, MembershipDate, MemberType) VALUES
('Juan', 'Dela Cruz', 'juan.delacruz@email.com', '09123456789', '2025-01-15', 'Student'),
('Maria', 'Santos', 'maria.santos@email.com', '09234567890', '2025-01-20', 'Teacher'),
('Jose', 'Rizal', 'jose.rizal@email.com', '09345678901', '2025-02-01', 'Student'),
('Andres', 'Bonifacio', 'andres.b@email.com', '09456789012', '2025-02-10', 'Regular'),
('Gabriela', 'Silang', 'gabriela.s@email.com', '09567890123', '2025-02-15', 'Teacher'),
('Emilio', 'Aguinaldo', 'emilio.a@email.com', '09678901234', '2025-03-01', 'Student'),
('Melchora', 'Aquino', 'melchora.a@email.com', '09789012345', '2025-03-05', 'Regular'),
('Lapu-Lapu', 'Mactan', 'lapu.lapu@email.com', '09890123456', '2025-03-10', 'Student'),
('Gregoria', 'De Jesus', 'gregoria.dj@email.com', '09901234567', '2025-03-12', 'Teacher'),
('Antonio', 'Luna', 'antonio.luna@email.com', '09012345678', '2025-03-15', 'Student');

-- =====================================================
-- INSERT BOOKS (10+ records)
-- =====================================================
INSERT INTO Books (Title, ISBN, Publisher, YearPublished, TotalCopies, AvailableCopies) VALUES
('Noli Me Tangere', '9789716300001', 'Adarna House', 1887, 5, 4),
('El Filibusterismo', '9789716300002', 'Adarna House', 1891, 4, 3),
('Florante at Laura', '9789716300003', 'Vibal Publishing', 1838, 3, 3),
('Ibong Adarna', '9789716300004', 'Anvil Publishing', 1700, 6, 5),
('The Philippine Revolution', '9789716300005', 'National Historical Commission', 2010, 2, 1),
('Python Programming', '9789716300006', 'Tech Books PH', 2022, 8, 7),
('Database Systems', '9789716300007', 'Pearson', 2021, 5, 4),
('Web Development 101', '9789716300008', 'O\'Reilly', 2023, 3, 2),
('Data Structures', '9789716300009', 'MIT Press', 2020, 4, 4),
('Artificial Intelligence', '9789716300010', 'Springer', 2024, 2, 2);

-- =====================================================
-- INSERT AUTHORS
-- =====================================================
INSERT INTO Authors (AuthorName) VALUES
('Jose Rizal'),
('Francisco Balagtas'),
('Anonymous'),
('Dr. Maria Castillo'),
('John Smith'),
('Jane Doe'),
('Andres Bonifacio');

-- =====================================================
-- INSERT BOOK-AUTHOR RELATIONSHIPS
-- =====================================================
INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1), (2, 1), (3, 2), (4, 3), (5, 7), (6, 5), (7, 6), (8, 5), (9, 6), (10, 5);

-- =====================================================
-- INSERT BORROW RECORDS (10+ records)
-- =====================================================
INSERT INTO BorrowRecords (MemberID, BookID, BorrowDate, DueDate, ReturnDate, Status) VALUES
(1, 1, '2025-03-01', '2025-03-15', '2025-03-14', 'Returned'),
(2, 3, '2025-03-02', '2025-03-16', '2025-03-15', 'Returned'),
(3, 5, '2025-03-05', '2025-03-19', NULL, 'Borrowed'),
(4, 2, '2025-03-07', '2025-03-21', '2025-03-20', 'Returned'),
(5, 7, '2025-03-08', '2025-03-22', NULL, 'Borrowed'),
(1, 4, '2025-03-10', '2025-03-24', NULL, 'Borrowed'),
(6, 8, '2025-03-11', '2025-03-25', NULL, 'Borrowed'),
(7, 1, '2025-03-12', '2025-03-26', NULL, 'Borrowed'),
(8, 6, '2025-03-13', '2025-03-27', NULL, 'Borrowed'),
(9, 9, '2025-03-14', '2025-03-28', NULL, 'Borrowed'),
(10, 10, '2025-03-01', '2025-03-15', '2025-03-10', 'Returned'),
(2, 1, '2025-03-15', '2025-03-29', NULL, 'Borrowed');