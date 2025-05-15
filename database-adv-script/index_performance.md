# Index Performance Report

## Queries Tested
### 1. Booking lookup by user_id

SELECT * 
FROM booking 
WHERE user_id = '22222222-2222-2222-2222-222222222222';


# Before Index
## Execution Plan: Seq Scan

    Cost: 0.00..35.00

    Time: 2.1 ms

# After Index (idx_booking_user_id)
## Execution Plan: Index Scan

    Cost: 0.00..12.00

    Time: 0.8 ms
