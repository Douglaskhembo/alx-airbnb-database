# Entity Relationship Diagram (ERD)

## Objective

This document presents the Entity-Relationship Diagram (ERD) for the **ALX Airbnb Database** project.

The ERD outlines the core entities involved in the system and the relationships between them, such as users, properties, bookings, and reviews.

---

## ER Diagram

The diagram below visually represents the database structure:

![Airbnb ERD](./airbnb-erd.png)

> *Note: This diagram was generated using DBeaver and exported as a PNG file.*

---

## Entities and Their Attributes

###  User
- id (PK)
- email
- password
- first_name
- last_name
- created_at
- updated_at

###  Property
- id (PK)
- name
- description
- location
- price_per_night
- host_id (FK to User.id)
- created_at
- updated_at

### Booking
- id (PK)
- user_id (FK to User.id)
- property_id (FK to Property.id)
- start_date
- end_date
- total_price
- created_at
- updated_at

###  Review
- id (PK)
- user_id (FK to User.id)
- property_id (FK to Property.id)
- rating
- comment
- created_at

---

## Relationships

- A **User** can book multiple **Properties** (1-to-many).
- A **Property** can be booked many times (1-to-many with Booking).
- A **User** can leave many **Reviews**.
- A **Property** can have many **Reviews** from different Users.

---

## Tools Used

- ERD created using: **DBeaver**
- Diagram exported as: **PNG**
- Markdown written for GitHub documentation

