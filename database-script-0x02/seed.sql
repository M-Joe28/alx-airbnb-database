-- =====================================================
-- SEED DATA FOR PROPERTY BOOKING SYSTEM
-- =====================================================

-- ========== USERS ==========
INSERT INTO User (name, email, phone, role, password) VALUES
('Alice Johnson', 'alice@example.com', '+250788111111', 'guest', 'hashed_password1'),
('Bob Smith', 'bob@example.com', '+250788222222', 'host', 'hashed_password2'),
('Charlie Brown', 'charlie@example.com', '+250788333333', 'host', 'hashed_password3'),
('Diana Prince', 'diana@example.com', '+250788444444', 'guest', 'hashed_password4'),
('Admin User', 'admin@example.com', '+250788555555', 'admin', 'hashed_password5');

-- ========== PROPERTIES ==========
INSERT INTO Property (user_id, title, description, location, price_per_night, status) VALUES
(2, 'Modern Apartment in Kigali City Center', 'A fully furnished 2-bedroom apartment with a great view.', 'Kigali - Nyarutarama', 80.00, 'available'),
(3, 'Cozy Guesthouse near Nyungwe Forest', 'Peaceful guesthouse surrounded by nature.', 'Nyamagabe - Nyungwe', 45.00, 'available'),
(3, 'Luxury Villa with Pool', 'Spacious villa with private pool and garden.', 'Kigali - Kacyiru', 200.00, 'unavailable');

-- ========== BOOKINGS ==========
INSERT INTO Booking (user_id, property_id, start_date, end_date, status) VALUES
(1, 1, '2025-09-10', '2025-09-15', 'confirmed'),
(4, 2, '2025-10-01', '2025-10-05', 'pending'),
(1, 3, '2025-11-20', '2025-11-25', 'cancelled');

-- ========== REVIEWS ==========
INSERT INTO Review (booking_id, user_id, rating, comment) VALUES
(1, 1, 5, 'Amazing stay! The apartment was clean and comfortable.'),
(3, 1, 3, 'Villa was beautiful but booking got cancelled last minute.');

-- ========== PAYMENTS ==========
INSERT INTO Payment (booking_id, amount, payment_method, status) VALUES
(1, 400.00, 'credit_card', 'successful'),  -- for Alice’s booking
(2, 180.00, 'paypal', 'pending'),          -- for Diana’s booking
(3, 1000.00, 'bank_transfer', 'failed');   -- for cancelled villa booking
