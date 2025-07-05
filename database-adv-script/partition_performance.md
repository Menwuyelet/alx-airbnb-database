# 🚀 Partitioning Performance Report on Booking Table

I created **four different partitioning tables** to partition the `Booking` table based on the `start_date` of the bookings, using the following queries:

```sql
CREATE TABLE booking_2023 PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF Booking
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE booking_max PARTITION OF Booking
FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

```

This partitioning made the **fetching queries much faster**, because when looking for a specific booking using queries like:

```sql
SELECT *
FROM Booking
WHERE
    start_date = '2023-05-01';
```

the database only searches the partition corresponding to the specified `start_date`.

As a result, this significantly reduces the effort and resources used to search in a large database and improves overall query performance.
