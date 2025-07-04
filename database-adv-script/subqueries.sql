SELECT *
FROM Property
WHERE
    property_id IN (
        SELECT property_id
        From Review
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );

SELECT *
FROM User
WHERE (
        SELECT COUNT(*)
        FROM Booking
        WHERE
            Booking.user_id = User.user_id
    ) > 3;