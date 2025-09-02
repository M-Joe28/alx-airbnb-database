-- =====================================================
-- Database Schema for Property Booking System
-- =====================================================

-- Drop tables if they exist (for re-run safety)
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS User;

-- =====================================================
-- USER TABLE
-- =====================================================
CREATE TABLE User (
    user_id         SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    phone           VARCHAR(20),
    role            VARCHAR(20) CHECK (role IN ('guest', 'host', 'admin')),
    password        VARCHAR(255) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON User(email);

-- =====================================================
-- PROPERTY TABLE
-- =====================================================
CREATE TABLE Property (
    property_id     SERIAL PRIMARY KEY,
    user_id         INT NOT NULL,
    title           VARCHAR(200) NOT NULL,
    description     TEXT,
    location        VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL CHECK (price_per_night > 0),
    status          VARCHAR(20) CHECK (status IN ('available', 'unavailable')),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_property_location ON Property(location);

-- =====================================================
-- BOOKING TABLE
-- =====================================================
CREATE TABLE Booking (
    booking_id      SERIAL PRIMARY KEY,
    user_id         INT NOT NULL,
    property_id     INT NOT NULL,
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL,
    status          VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'cancelled')),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    CONSTRAINT chk_booking_dates CHECK (start_date < end_date)
);

CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);

-- =====================================================
-- REVIEW TABLE
-- =====================================================
CREATE TABLE Review (
    review_id       SERIAL PRIMARY KEY,
    booking_id      INT UNIQUE NOT NULL,
    user_id         INT NOT NULL,
    rating          INT CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    review_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_review_user ON Review(user_id);

-- =====================================================
-- PAYMENT TABLE
-- =====================================================
CREATE TABLE Payment (
    payment_id      SERIAL PRIMARY KEY,
    booking_id      INT NOT NULL,
    amount          DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method  VARCHAR(50) CHECK (payment_method IN ('credit_card', 'paypal', 'bank_transfer', 'cash')),
    status          VARCHAR(20) CHECK (status IN ('successful', 'failed', 'pending')),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);
