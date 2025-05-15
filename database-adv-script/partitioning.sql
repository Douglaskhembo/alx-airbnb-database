-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Rename the original table
ALTER TABLE booking RENAME TO booking_01;

-- Drop the primary key constraint on the backup table

ALTER TABLE booking_01 DROP CONSTRAINT IF EXISTS booking_pkey;

-- Create partitioned booking table

CREATE TABLE booking (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT booking_pkey PRIMARY KEY (booking_id, start_date),  -- Include start_date as part of the primary key
    CONSTRAINT fk_property_booking FOREIGN KEY (property_id) REFERENCES property(property_id),
    CONSTRAINT fk_user_booking FOREIGN KEY (user_id) REFERENCES "User"(user_id)
) PARTITION BY RANGE (start_date);

-- Create partitions (e.g., 2023, 2024)

CREATE TABLE booking_2025_1 PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-12');

CREATE TABLE booking_2025_2 PARTITION OF booking
    FOR VALUES FROM ('2025-02-13') TO ('2025-05-14');;

-- Migrate data from backup to partitioned table

INSERT INTO booking (
    booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
)
SELECT
    booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM booking_backup;

-- Recreate indexes (if needed)

CREATE INDEX idx_booking_property_id ON booking (property_id);
CREATE INDEX idx_booking_id ON booking (booking_id);

-- Re-establish foreign key in payment (if applicable)
ALTER TABLE payment
    DROP CONSTRAINT IF EXISTS fk_booking_payment,
    ADD CONSTRAINT fk_booking_payment FOREIGN KEY (booking_id, start_date) REFERENCES booking (booking_id, start_date);

