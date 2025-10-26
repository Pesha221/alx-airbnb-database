# Database Normalization to 3NF – ALX Airbnb Database

## Users
user_id (PK)
first_name
last_name
email (UNIQUE)
password_hash
phone_number
role
created_at

## Properties
property_id (PK)
host_id (FK → User.user_id)
name
description
location
price_per_night
created_at
updated_at

## Bookings
booking_id (PK)
property_id (FK → Property.property_id)
user_id (FK → User.user_id)
start_date
end_date
total_price
status
created_at

## Payments
payment_id (PK)
booking_id (FK → Booking.booking_id)
amount
payment_date
payment_method

## Reviews
review_id (PK)
property_id (FK → Property.property_id)
user_id (FK → User.user_id)
rating
comment
created_at

## Messages
message_id (PK)
sender_id (FK → User.user_id)
recipient_id (FK → User.user_id)
message_body
sent_at

## Indexes
- User (email)
- Property (name)
- Booking (property_id, start_date, end_date)
- Payment (booking_id)
- Review (property_id, user_id)
- Message (sender_id, recipient_id)