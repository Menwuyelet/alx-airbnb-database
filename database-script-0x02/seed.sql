INSERT INTO
    User (
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role
    )
VALUES (
        'John',
        'Doe',
        'johndoe@example.com',
        'hashed_password_1',
        '+251900000001',
        'guest'
    ),
    (
        'Nafiad',
        'Temesgen',
        'nafiad@example.com',
        'hashed_password_2',
        '+251900000002',
        'host'
    );

INSERT INTO
    Property (
        host_id,
        name,
        description,
        location,
        pricepernight
    )
VALUES (
        (
            SELECT user_id
            FROM User
            WHERE
                email = 'nafiad@example.com'
        ),
        'Nafiad Cozy Home',
        'A cozy home in Addis perfect for travelers.',
        'Addis Ababa',
        200.00
    );

INSERT INTO
    Booking (
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status
    )
VALUES (
        (
            SELECT property_id
            FROM Property
            WHERE
                name = 'Nafiad Cozy Home'
        ),
        (
            SELECT user_id
            FROM User
            WHERE
                email = 'johndoe@example.com'
        ),
        '2025-07-01',
        '2025-07-05',
        1000.00,
        'confirmed'
    );

INSERT INTO
    Payment (
        booking_id,
        amount,
        payment_method
    )
VALUES (
        (
            SELECT booking_id
            FROM Booking
            WHERE
                user_id = (
                    SELECT user_id
                    FROM User
                    WHERE
                        email = 'johndoe@example.com'
                )
            LIMIT 1
        ),
        1000.00,
        'credit_card'
    );

INSERT INTO
    Review (
        property_id,
        user_id,
        rating,
        comment
    )
VALUES (
        (
            SELECT property_id
            FROM Property
            WHERE
                name = 'Nafiad Cozy Home'
        ),
        (
            SELECT user_id
            FROM User
            WHERE
                email = 'johndoe@example.com'
        ),
        5,
        'Great experience! i loved the place, it was clean and comfortable'
    );

INSERT INTO
    Message (
        sender_id,
        recipient_id,
        message_body
    )
VALUES (
        (
            SELECT user_id
            FROM User
            WHERE
                email = 'johndoe@example.com'
        ),
        (
            SELECT user_id
            FROM User
            WHERE
                email = 'nafiad@example.com'
        ),
        'Hi Nafiad! Thank you for hosting me, I really enjoyed my time.'
    );