SELECT user_id, COUNT(*) AS bookings_count
FROM Bookings
GROUP BY
    user_id;

SELECT
    property_id,
    booking_count,
    ROW_NUMBER() OVER (
        ORDER BY booking_count DESC
    ) AS row_order,
    RANK() OVER (
        ORDER BY booking_count DESC
    ) AS property_rank
FROM (
        SELECT property_id, COUNT(*) AS booking_count
        FROM Booking
        GROUP BY
            property_id
    ) AS property_bookings;