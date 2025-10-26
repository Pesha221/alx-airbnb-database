-- ============================================================
-- ALX Airbnb Database Schema Definition
-- ============================================================

-- Enable foreign key checks and strict SQL mode for safety
SET FOREIGN_KEY_CHECKS = 0;
SET sql_mode = 'STRICT_ALL_TABLES';

-- ============================================================
-- 1. USER TABLE
-- ============================================================
CREATE TABLE User (
    user_id CHAR(36) PRIMARY KEY,                 -- UUID (PK)
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,           -- Unique email
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Index for faster lookups by email
CREATE INDEX idx_user_email ON User (email);

-- ============================================================
-- 2. PROPERTY TABLE
-- ============================================================
CREATE TABLE Property (
    property_id CHAR(36) PRIMARY KEY,             -- UUID (PK)
    host_id CHAR(36) NOT NULL,                    -- FK → User(user_id)
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_host FOREIGN KEY (host_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Index for host and location searches
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_property_location ON Property (location);

-- ============================================================
-- 3. BOOKING TABLE
-- ============================================================
CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY,              -- UUID (PK)
    property_id CHAR(36) NOT NULL,                -- FK → Property(property_id)
    user_id CHAR(36) NOT NULL,                    -- FK → User(user_id)
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Index for property lookups and user booking queries
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- ============================================================
-- 4. PAYMENT TABLE
-- ============================================================
CREATE TABLE Payment (
    payment_id CHAR(36) PRIMARY KEY,              -- UUID (PK)
    booking_id CHAR(36) NOT NULL,                 -- FK → Booking(booking_id)
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id)
        REFERENCES Booking(booking_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Index for booking payment lookups
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);

-- ============================================================
-- 5. REVIEW TABLE
-- ============================================================
CREATE TABLE Review (
    review_id CHAR(36) PRIMARY KEY,               -- UUID (PK)
    property_id CHAR(36) NOT NULL,                -- FK → Property(property_id)
    user_id CHAR(36) NOT NULL,                    -- FK → User(user_id)
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Index for property and user review queries
CREATE INDEX idx_review_property_id ON Review (property_id);
CREATE INDEX idx_review_user_id ON Review (user_id);

-- ============================================================
-- 6. MESSAGE TABLE
-- ============================================================
CREATE TABLE Message (
    message_id CHAR(36) PRIMARY KEY,              -- UUID (PK)
    sender_id CHAR(36) NOT NULL,                  -- FK → User(user_id)
    recipient_id CHAR(36) NOT NULL,               -- FK → User(user_id)
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Indexes for sender and recipient lookups
CREATE INDEX idx_message_sender_id ON Message (sender_id);
CREATE INDEX idx_message_recipient_id ON Message (recipient_id);

-- ============================================================
-- Enable foreign key checks after creation
-- ============================================================
SET FOREIGN_KEY_CHECKS = 1;
