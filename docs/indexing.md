# Indexing Documentation

```
SELECT * FROM Users WHERE Name LIKE 'J%';
```

- Showing rows 0 - 0 (1 total, Query took 0.0002 seconds.)
- MySQL returned 1 row (StudentID 6: Amihan).

```
CREATE INDEX idx_name ON Users(Name);
```

```
SELECT * FROM Users WHERE Name LIKE 'J%';
```
- Showing rows 0 - 0 (1 total, Query took 0.0002 seconds.)

## What Changed?
The query result remained the same (1 row), the query time remained the same (0.0002 seconds), but the difference is that before indexing no index was used, while after indexing MySQL used the `idx_firstname` index to execute the query.

## Why Faster?
The index on FirstName allows MySQL to quickly locate matching rows without scanning the entire table. Instead of scanning all rows one by one, the database performs an index range scan using the B-tree structure of the index. This reduces disk I/O and CPU work, especially as the table size grows. Even though the current dataset is small, the index setup is crucial for scaling.

## Why Indexing is Important?
Indexing is important because it improves query efficiency for WHERE clauses, scales well with larger data by using logarithmic time instead of linear time, optimizes filtering and sorting operations, reduces server load and query response time in production environments. However, there are trade-offs because indexes use extra storage and can slow down write operations like INSERT, UPDATE, and DELETE, so they should be used wisely.