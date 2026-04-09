USE LibrarySystem;

-- =====================================================
-- SELECT Queries
-- =====================================================

-- 1. List all members
SELECT * FROM Members;

-- 2. List available books
SELECT Title, AvailableCopies FROM Books WHERE AvailableCopies > 0;

-- 3. Active borrowings
SELECT b.Title, CONCAT(m.FirstName, ' ', m.LastName) AS Member, br.DueDate
FROM BorrowRecords br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE br.Status = 'Borrowed';

-- =====================================================
-- INSERT Query
-- =====================================================
INSERT INTO Members (FirstName, LastName, Email, Phone, MembershipDate, MemberType)
VALUES ('New', 'Member', 'new.member@email.com', '09999999999', CURDATE(), 'Student');

-- =====================================================
-- UPDATE Query
-- =====================================================
UPDATE Members SET Phone = '09876543210' WHERE MemberID = 1;

-- =====================================================
-- DELETE Query
-- =====================================================
DELETE FROM BorrowRecords WHERE BorrowID = 99; -- Use appropriate ID

-- =====================================================
-- JOIN Query (Multiple Tables)
-- =====================================================
SELECT 
    CONCAT(m.FirstName, ' ', m.LastName) AS MemberName,
    b.Title AS BookTitle,
    br.BorrowDate,
    br.DueDate,
    br.Status
FROM BorrowRecords br
INNER JOIN Members m ON br.MemberID = m.MemberID
INNER JOIN Books b ON br.BookID = b.BookID
ORDER BY br.BorrowDate DESC;

-- =====================================================
-- SUBQUERY Query
-- =====================================================
-- Find members who borrowed more than 2 books
SELECT CONCAT(FirstName, ' ', LastName) AS MemberName
FROM Members
WHERE MemberID IN (
    SELECT MemberID 
    FROM BorrowRecords 
    GROUP BY MemberID 
    HAVING COUNT(*) > 2
);

-- =====================================================
-- AGGREGATION with GROUP BY
-- =====================================================
SELECT 
    b.Title,
    COUNT(br.BorrowID) AS TimesBorrowed
FROM Books b
LEFT JOIN BorrowRecords br ON b.BookID = br.BookID
GROUP BY b.BookID
ORDER BY TimesBorrowed DESC;