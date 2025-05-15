# Booking Table Partitioning Performance Report

## Objective
Improve query performance on the `booking` table by partitioning it based on `start_date`.

## Implementation
- Renamed the existing `booking` table to `booking_01`.
- Created a new partitioned `booking` table using `PARTITION BY RANGE (start_date)`.
- Created two partitions: `booking_2025_1` and `booking_2025_2`.
- Migrated data from the original table to the partitioned one.

## Performance Test
Query:
```sql
SELECT * FROM booking WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

