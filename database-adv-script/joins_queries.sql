SELECT Booking.booking_id, Booking.start_date, Booking.end_date, Booking.property_id, User.user_id, User.email
FROM Booking
    INNER JOIN User on Booking.user_id = User.user_id;

SELECT Property.property_id, Property.name, Review.review_id, Review.user_id, Review.rating, Review.comment
FROM Property
    LEFT JOIN Review on Property.property_id = Review.property_id;

SELECT User.user_id, User.email, Booking.booking_id, Booking.property_id, Booking.start_date, Booking.end_date
FROM User
    LEFT join Booking ON User.user_id = Booking.user_id
UNION
SELECT User.user_id, User.email, Booking.booking_id, Booking.property_id, Booking.start_date, Booking.end_date
FROM User
    RIGHT join Booking ON User.user_id = Booking.user_id;