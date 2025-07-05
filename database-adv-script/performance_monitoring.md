# 📈 Database Optimization Recommendations

Since we have already added indexes to our most used columns and implemented partitioning on the `Booking` table, the queries are mostly optimized and efficient.

However, to prepare for future growth and further improve performance, I recommend:

- Adding **partitioning** on the `User`, `Property`, `Review`, and `Payment` tables.  
  As the database grows larger, searching entire tables can cause performance issues.

- Adding **indexes** on the `Payment` and `Review` tables to speed up frequent queries.

---

## Suggested Partitioning Queries

-- Partitioning User table by user creation date:

```sql
CREATE TABLE user_2023 PARTITION OF User
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE user_2024 PARTITION OF User
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE user_max PARTITION OF User
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);
```

-- Partitioning Property table by creation date column:

```sql
CREATE TABLE property_2023 PARTITION OF Property
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE property_2024 PARTITION OF Property
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE property_max PARTITION OF Property
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);
```

-- Partitioning Review table by creation date:

```sql
CREATE TABLE review_2023 PARTITION OF Review
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE review_2024 PARTITION OF Review
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE review_max PARTITION OF Review
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);

```

-- Partitioning Payment table by payment date:

```sql
CREATE TABLE payment_2023 PARTITION OF Payment
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE payment_2024 PARTITION OF Payment
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE payment_max PARTITION OF Payment
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);
```

-- Add index on Payment table for frequently queried columns such as booking id

```sql
CREATE INDEX idx_payment_booking ON Payment(booking_id);
```

-- Add index on Review table for frequently queried columns such as property id:

```sql
CREATE INDEX idx_review_property ON Review(property_id);
```
