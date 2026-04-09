-- =====================================================
-- DATABASE: LibrarySystem
-- IT 105 Midterm Lab Requirement
-- =====================================================

CREATE DATABASE LibrarySystem;
USE LibrarySystem;

-- =====================================================
-- TABLE 1: Members (UNF → 3NF)
-- =====================================================
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    MembershipDate DATE NOT NULL,
    MemberType ENUM('Student', 'Teacher', 'Regular') DEFAULT 'Student'
);

-- =====================================================
-- TABLE 2: Books
-- =====================================================
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(13) UNIQUE,
    Publisher VARCHAR(100),
    YearPublished YEAR,
    TotalCopies INT DEFAULT 1,
    AvailableCopies INT DEFAULT 1
);

-- =====================================================
-- TABLE 3: Authors (for many-to-many relationship)
-- =====================================================
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL
);

-- =====================================================
-- TABLE 4: BookAuthors (junction table for many-to-many)
-- =====================================================
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- =====================================================
-- TABLE 5: BorrowRecords
-- =====================================================
CREATE TABLE BorrowRecords (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE NULL,
    Status ENUM('Borrowed', 'Returned', 'Overdue') DEFAULT 'Borrowed',
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- =====================================================
-- INDEXES for performance (Week 6)
-- =====================================================
CREATE INDEX idx_member_email ON Members(Email);
CREATE INDEX idx_borrow_status ON BorrowRecords(Status);
CREATE INDEX idx_borrow_dates ON BorrowRecords(BorrowDate, DueDate);