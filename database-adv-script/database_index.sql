CREATE INDEX idx_property_name ON Property (name);

CREATE INDEX idx_property_location ON Property (location);

CREATE INDEX idx_booking_start_date ON Booking (start_date);

EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Lake View';

EXPLAIN ANALYZE SELECT * FROM Booking WHERE start_date >= '2025-07-01';
