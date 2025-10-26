# Entity-Relationship Diagram: ALX Airbnb Database

## Entities
- User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
- Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
- Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
- Payment (payment_id, booking_id, amount, payment_date, payment_method)
- Review (review_id, property_id, user_id, rating, comment, created_at)
- Message (message_id, sender_id, recipient_id, message_body, sent_at)

## Relationships
- User (1) → (M) Property
- User (1) → (M) Booking
- Property (1) → (M) Booking
- Booking (1) → (M) Payment
- User (1) → (M) Review
- Property (1) → (M) Review
- User (1) → (M) Message (sender)
- User (1) → (M) Message (recipient)
