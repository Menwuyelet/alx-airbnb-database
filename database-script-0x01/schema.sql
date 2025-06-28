CREATE TABLE User (
    user_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE Table Property (
    property_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    host_id CHAR(36) NOT NULL,
    name VARCHAR(20) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(20) NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Foreign Key (host_id) REFERENCES User (user_id)
);

CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM(
        'pending',
        'confirmed',
        'canceled'
    ) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (property_id) REFERENCES Property (property_id),
    Foreign Key (user_id) REFERENCES User (user_id)
);

CREATE TABLE Payment (
    payment_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM(
        'credit_card',
        'paypal',
        'stripe'
    ) NOT NULL,
    Foreign Key (booking_id) REFERENCES Booking (booking_id)
);

CREATE Table Review (
    review_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER CHECK (
        rating >= 1
        AND rating <= 5
    ) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (property_id) REFERENCES Property (property_id),
    Foreign Key (user_id) REFERENCES User (user_id)
);

CREATE TABLE Message (
    message_id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (sender_id) REFERENCES User (user_id),
    Foreign Key (recipient_id) REFERENCES User (user_id)
);