-- ============================================================
-- ALX Airbnb Database Seed Data
-- ============================================================

USE alx_airbnb_database;

SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- 1. USER DATA
-- ============================================================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hash1', '+254700111111', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Omondi', 'bob@example.com', 'hash2', '+254700222222', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Kimani', 'charlie@example.com', 'hash3', '+254700333333', 'host'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Mutua', 'diana@example.com', 'hash4', '+254700444444', 'guest'),
('55555555-5555-5555-5555-555555555555', 'Admin', 'User', 'admin@airbnb.com', 'hash5', NULL, 'admin');

-- ============================================================
-- 2. PROPERTY DATA
-- ============================================================
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Seaside Villa', 'A cozy villa overlooking the ocean in Lamu.', 'Lamu, Kenya', 150.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 'Nairobi Loft', 'Modern apartment in the heart of Nairobi.', 'Nairobi, Kenya', 100.00),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '11111111-1111-1111-1111-111111111111', 'Tsavo Safari Lodge', 'Experience wildlife in luxury near Tsavo National Park.', 'Voi, Kenya', 250.00);

-- ============================================================
-- 3. BOOKING DATA
-- ============================================================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', '2025-10-01', '2025-10-05', 600.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2025-11-10', '2025-11-13', 300.00, 'pending'),
('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '22222222-2222-2222-2222-222222222222', '2025-12-20', '2025-12-25', 1250.00, 'confirmed');

-- ============================================================
-- 4. PAYMENT DATA
-- ============================================================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 600.00, 'credit_card'),
('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3', 1250.00, 'paypal');

-- ============================================================
-- 5. REVIEW DATA
-- ============================================================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 5, 'Amazing stay! The ocean view was breathtaking.'),
('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 4, 'Comfortable apartment, great location.'),
('ddddddd3-dddd-dddd-dddd-ddddddddddd3', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '22222222-2222-2222-2222-222222222222', 5, 'Loved the wildlife and the luxury lodge!');

-- ============================================================
-- 6. MESSAGE DATA
-- ============================================================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, is your villa available in December?'),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, yes it’s available from Dec 20th to 25th.');

SET FOREIGN_KEY_CHECKS = 1;
