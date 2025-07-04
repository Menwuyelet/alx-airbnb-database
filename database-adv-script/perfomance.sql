CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

SELECT 
    Booking.booking_id, 
    Booking.start_date,  
    Booking.end_date,  
    Booking.total_price, 
    Booking.status,
    User.user_id, 
    User.first_name, 
    User.last_name, 
    User.email, 
    User.phone_number,
    Property.property_id, 
    Property.name, 
    Property.location, 
    Property.description
FROM Booking
LEFT JOIN User ON Booking.user_id = User.user_id
LEFT JOIN Property ON Booking.property_id = Property.property_id
WHERE Booking.status = 'confirmed' AND Property.location = 'Addis Ababa';
EXPLAIN ANALYZE SELECT Booking.booking_id, Booking.start_date,  Booking.end_date,  Booking.total_price, User.user_id, User.first_name, User.last_name, User.email, User.phone_number,Property.property_id, Property.name, Property.location, Property.description
FROM Booking
LEFT JOIN User ON Booking.user_id = User.user_id
LEFT JOIN Property ON Booking.property_id = Property.property_id;
