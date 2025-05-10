# ALX Airbnb Clone - Database Seeding

This directory contains the SQL scripts for seeding the database with sample data for the ALX Airbnb Clone project. The seed data includes users, properties, bookings, payments, reviews, and messages, reflecting common usage scenarios for testing and development purposes.

## Files

- **`README.md`**  
  This file provides an overview of the seed script and usage instructions.

- **`seed.sql`**  
  Contains the `INSERT` statements to populate the following tables:
  - `User`: Guests, hosts, and admins
  - `Property`: Listings created by hosts
  - `Booking`: Booking entries made by users
  - `Payment`: Payment records for bookings with valid payment methods
  - `Review`: Guest reviews for properties
  - `Message`: Conversations between users

## Prerequisites

- PostgreSQL 13+
- UUID extension enabled (`uuid-ossp`)

## Database Schema Setup

Ensure the following before running the `seed.sql` script:

1. The database schema is already created, as outlined in the `CREATE TABLE` scripts.
2. The UUID extension is enabled with the following command:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


# setting payment constrains run below sql
ALTER TABLE payment
ADD CONSTRAINT payment_payment_method_check
CHECK (payment_method IN ('credit_card', 'paypal', 'stripe'));

#Run the seed.sql

