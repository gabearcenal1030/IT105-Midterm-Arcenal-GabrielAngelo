# IT 105 - Midterm Laboratory Requirement
## Library Management System Database

**Student:** Gabriel Angelo B. Arcenal
**Course:** IT 105 - Information Management | 2nd Sem 25-26  

## System Description

A complete relational database for a **Library System** that manages:
- Members (students, teachers, regular patrons)
- Books with author relationships
- Borrowing and return transactions
- Real-time book availability tracking

## Tables Structure

| Table | Description | Records |
|-------|-------------|---------|
| Members | Library patrons | 10+ |
| Books | Book inventory | 10+ |
| Authors | Book authors | 7 |
| BookAuthors | Junction table (many-to-many) | 10 |
| BorrowRecords | Borrowing transactions | 12 |

**Relationships:**
- Members ↔ BorrowRecords (One-to-Many)
- Books ↔ BorrowRecords (One-to-Many)
- Books ↔ Authors (Many-to-Many via BookAuthors)

## Features Implemented

✅ **Database Schema** - 5 normalized tables with proper keys  
✅ **Normalization** - UNF → 1NF → 2NF → 3NF transformation  
✅ **Sample Data** - 10+ records per main table  
✅ **SQL Operations** - SELECT, INSERT, UPDATE, DELETE, JOIN, SUBQUERY  
✅ **Indexing** - Performance comparison with EXPLAIN  
✅ **GitHub** - Multiple commits with meaningful messages  

## How to Run

1. Start XAMPP → MySQL service
2. Open phpMyAdmin: http://localhost/phpmyadmin
3. Create database: `CREATE DATABASE LibrarySystem;`
4. Run `/sql/schema.sql` first
5. Run `/sql/data.sql` second
6. Run `/sql/queries.sql` to test

## Reflection

### What I Learned

1. **Database normalization** is crucial - it prevents data anomalies and redundancy. My initial design had repeated member info, but 3NF eliminated this.

2. **Indexing dramatically improves performance** - my test showed full table scan vs direct lookup (1 row vs 10+ rows). I now understand why large applications need proper indexing.

3. **GitHub is essential for version control** - multiple commits helped me track changes and roll back when needed.

4. **Foreign keys maintain data integrity** - they prevent orphan records in BorrowRecords.

5. **Real-world application** - This library system could actually work with a frontend. The JOIN queries produce meaningful reports.

### Challenges Faced
- Understanding many-to-many relationships (solved with junction table)
- Index placement decisions (learned to index foreign keys and WHERE columns)

### Future Improvements
- Add stored procedures for automated overdue fines
- Create views for common reports
- Implement triggers for availability updates

