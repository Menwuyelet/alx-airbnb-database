ALTER TABLE Booking
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION g2023 VALUES LESS THAN (2024),
    PARTITION g2024 VALUES LESS THAN (2025),
    PARTITION g2025 VALUES LESS THAN (2026),
    PARTITION gmax VALUES LESS THAN MAXVALUE
);

-- the above script does not work on mysql since there are foreign keys on the booking table, and my sql
-- doesn`t support partitioning on tables containing foreign keys. so i also added the below script which works fine on PostgreSQL.

CREATE TABLE booking_2023 PARTITION OF Booking FOR
VALUES
FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking FOR
VALUES
FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF Booking FOR
VALUES
FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE booking_max PARTITION OF Booking FOR
VALUES
FROM ('2026-01-01') TO (MAXVALUE);

EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE
    start_date = '2023-05-01';