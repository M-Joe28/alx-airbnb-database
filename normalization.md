# Database Normalization

## Objective
Ensure the database design follows normalization rules up to the Third Normal Form (3NF).

## Steps of Normalization

### First Normal Form (1NF)
- Each table has a primary key.
- All attributes contain atomic values (no repeating groups or arrays).
- Example: `User.email` is a single value, not a list of emails.

### Second Normal Form (2NF)
- Database is already in 1NF.
- All non-key attributes depend on the entire primary key.
- Example: In `Booking`, attributes (`start_date`, `end_date`, `status`) depend only on `booking_id`.

### Third Normal Form (3NF)
- Database is already in 2NF.
- No transitive dependencies exist (non-key attributes depend only on the primary key).
- Example: In `Payment`, `amount` depends only on `payment_id` (through `booking_id`) and not on another non-key attribute.

## Conclusion
- All tables (`User`, `Property`, `Booking`, `Review`, `Payment`) are in **Third Normal Form (3NF)**.
- The schema avoids redundancy and ensures data integrity.
- Additional constraints (unique emails, enum values for status, foreign key cascades) should be enforced at the database level.
