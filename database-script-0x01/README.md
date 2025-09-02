# 🛠️ Database Schema (DDL)

## 📌 Overview
This section defines the **Database Schema** for the **Property Booking System**.  
The schema is written in SQL using `CREATE TABLE` statements with proper keys, constraints, and indexes to ensure **data integrity** and **performance**.

---

## 🗂️ Entities & Attributes
The schema includes the following tables:

1. **User**
   - Stores guest, host, and admin details.
   - Attributes: `user_id`, `name`, `email`, `phone`, `role`, `password`, `created_at`.

2. **Property**
   - Contains property listings owned by hosts.
   - Attributes: `property_id`, `user_id (FK)`, `title`, `description`, `location`, `price_per_night`, `status`, `created_at`.

3. **Booking**
   - Records guest reservations for properties.
   - Attributes: `booking_id`, `user_id (FK)`, `property_id (FK)`, `start_date`, `end_date`, `status`, `created_at`.

4. **Review**
   - Captures guest feedback after a booking.
   - Attributes: `review_id`, `booking_id (FK, unique)`, `user_id (FK)`, `rating`, `comment`, `review_date`.

5. **Payment**
   - Tracks payment transactions linked to bookings.
   - Attributes: `payment_id`, `booking_id (FK)`, `amount`, `payment_date`, `payment_method`, `status`.

---

## 🔑 Keys & Constraints
- **Primary Keys**: `SERIAL` auto-increment IDs for all tables.  
- **Foreign Keys**:
  - `Property.user_id` → `User.user_id`
  - `Booking.user_id` → `User.user_id`
  - `Booking.property_id` → `Property.property_id`
  - `Review.booking_id` → `Booking.booking_id`
  - `Payment.booking_id` → `Booking.booking_id`
- **Constraints**:
  - `CHECK` constraints on status fields (e.g., `'pending'`, `'confirmed'`, `'cancelled'`).
  - `CHECK` on booking dates (`start_date < end_date`).
  - `CHECK` on ratings (`1–5`).
  - `UNIQUE` constraint on emails.

---

## 📊 Indexes
Indexes are created for faster lookups:
- `User.email`
- `Property.location`
- `Booking.user_id`
- `Booking.property_id`
- `Review.user_id`
- `Payment.booking_id`

---

## 🚀 How to Run
1. Ensure you have a PostgreSQL database ready.
2. Run the schema script:
   ```bash
   psql -U your_username -d your_database -f schema.sql
