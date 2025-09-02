# 🌱 Database Seed Data

## 📌 Overview
This folder contains SQL scripts to **populate the Property Booking database** with sample data.  
The seed data is designed to reflect **real-world usage scenarios** with users, properties, bookings, reviews, and payments.

---

## 🛠️ What’s Included
The sample data covers the following entities:

- **Users**: Guests, hosts, and an admin.
- **Properties**: Listings owned by hosts, with pricing and availability.
- **Bookings**: Reservations made by guests with different statuses (confirmed, pending, cancelled).
- **Reviews**: Guest feedback on completed bookings.
- **Payments**: Transactions linked to bookings, with different outcomes.

---

## 📊 Sample Data Highlights
### Users
- 5 users: 2 guests, 2 hosts, and 1 admin.  
- Unique emails and phone numbers.  

### Properties
- Apartments, villas, and guesthouses in Rwanda (Kigali, Nyungwe).  
- Mix of available and unavailable statuses.  

### Bookings
- Covers confirmed, pending, and cancelled bookings.  
- Valid start and end dates.  

### Reviews
- Honest guest reviews tied to booking IDs.  

### Payments
- Successful, pending, and failed transactions.  
- Various payment methods (credit card, PayPal, bank transfer).  

---

## 🚀 How to Use
1. Ensure your database schema is already created (`schema.sql` must be run first).
2. Run the seed script to populate the database:
   ```bash
   psql -U your_username -d your_database -f seed.sql
