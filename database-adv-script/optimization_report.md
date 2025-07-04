<!-- # initial query
on the first query the exution plan was already optimied to some extent using indexes. the indexes are implemented using CREATE INDEX idx_property_name ON Property (name);

CREATE INDEX idx_property_location ON Property (location);

CREATE INDEX idx_booking_start_date ON Booking (start_date);
on database_index.sql file.

# optimized query

- after analyzing the initial query, i optimized the query by adding where clause to filter rows based on status listing only rows with status "complete". and additionaly we can add additional indexes at Booking.user_id and Booking.property_id since they are used on the left join if they are not automaticaly created.

query example:
- initial query:
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
LEFT JOIN Property ON Booking.property_id = Property.property_id;

- adding where to filter by status:
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
WHERE Booking.status = 'confirmed';

- creating indexes on Booking.user_id, Booking.property_id

 CREATE INDEX idx_booking_user_id ON Booking(user_id);
 CREATE INDEX idx_booking_property_id ON Booking(property_id);

all the above optimizations improves the excution plan. -->

# 📄 Query Optimization Report

## 🚀 Initial Query

on the first query the execution plan was already optimized to some extent using indexes. the indexes are implemented using CREATE INDEX idx_property_name ON Property (name);

```sql
CREATE INDEX idx\_property\_location ON Property (location);
CREATE INDEX idx\_booking\_start\_date ON Booking (start\_date);
```

in database_index.sql file.

## 💡 optimized query

After analyzing the initial query, i optimized the query by adding where clause to filter rows based on status listing only rows with status "confirmed". and additionally we can add additional indexes at Booking. user_id and Booking.property_id since they are used on the left join if they are not automatically created.

### initial query

```sql
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
LEFT JOIN Property ON Booking.property_id = Property.property_id;
```

### adding where to filter by status

```sql
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
WHERE Booking.status = 'confirmed';
```

### creating indexes on Booking.user_id, Booking.property_id

```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
```

all the above optimizations improves the execution plan.
