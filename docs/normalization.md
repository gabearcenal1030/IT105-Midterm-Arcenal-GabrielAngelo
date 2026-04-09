# Normalization Process: Library System

## UNF (Unnormalized Form)
A single table with repeating groups:

| MemberID | Name | Email | BooksBorrowed | BorrowDates |
|----------|------|-------|---------------|-------------|
| 1 | Juan Dela Cruz | juan@email.com | Noli, El Fili | 2025-03-01, 2025-03-15 |
| 2 | Maria Santos | maria@email.com | Florante | 2025-03-02 |

**Problems:** 
- Multiple values in one cell
- Difficult to search
- Wasted space

## 1NF (First Normal Form)
Remove repeating groups - each cell has single value:

| MemberID | Name | Email | BookTitle | BorrowDate |
|----------|------|-------|-----------|------------|
| 1 | Juan Dela Cruz | juan@email.com | Noli | 2025-03-01 |
| 1 | Juan Dela Cruz | juan@email.com | El Fili | 2025-03-15 |
| 2 | Maria Santos | maria@email.com | Florante | 2025-03-02 |

**Still has problems:** Data redundancy (member info repeated)

## 2NF (Second Normal Form)
Remove partial dependencies. Separate into:

**Members Table:**
| MemberID | Name | Email |

**BorrowRecords Table:**
| BorrowID | MemberID | BookTitle | BorrowDate |

**Books Table:**
| BookID | BookTitle |

## 3NF (Third Normal Form)
Remove transitive dependencies. Final structure:

**Members** - MemberID(PK), FirstName, LastName, Email, Phone, MembershipDate, MemberType

**Books** - BookID(PK), Title, ISBN, Publisher, YearPublished, TotalCopies, AvailableCopies

**Authors** - AuthorID(PK), AuthorName

**BookAuthors** - BookID(FK), AuthorID(FK) [Junction table]

**BorrowRecords** - BorrowID(PK), MemberID(FK), BookID(FK), BorrowDate, DueDate, ReturnDate, Status

## Benefits Achieved
- No data redundancy
- Easy updates without anomalies
- Efficient queries
- Flexible many-to-many relationships (Books ↔ Authors)