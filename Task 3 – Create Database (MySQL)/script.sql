-- CREATE DATABASE food_delivery;
-- USE food_delivery;

-- CREATE TABLE Customer (
--     customer_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     phone VARCHAR(20) UNIQUE,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE Address (
--     address_id INT PRIMARY KEY AUTO_INCREMENT,
--     customer_id INT NOT NULL,
--     postal_code VARCHAR(20) NOT NULL,
--     city VARCHAR(100) NOT NULL,
--     street VARCHAR(100) NOT NULL,
--     house_number VARCHAR(20) NOT NULL,

--     FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
-- );

-- CREATE TABLE Restaurant (
--     restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL,
--     phone VARCHAR(20) UNIQUE,
--     rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
--     city VARCHAR(100) NOT NULL,
--     is_active BOOLEAN DEFAULT TRUE
-- );

-- CREATE TABLE MenuItem (
--     menu_item_id INT PRIMARY KEY AUTO_INCREMENT,
--     restaurant_id INT NOT NULL,
--     name VARCHAR(100) NOT NULL,
--     price DECIMAL(10,2) NOT NULL CHECK (price > 0),
--     is_available BOOLEAN DEFAULT TRUE,

--     FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
-- );

-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY AUTO_INCREMENT,
--     customer_id INT,
--     restaurant_id INT,
--     order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--     status VARCHAR(20) NOT NULL,
--     total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),

--     FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
--     FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
-- );
-- CREATE TABLE OrderItem (
--     order_item_id INT PRIMARY KEY AUTO_INCREMENT,
--     order_id INT NOT NULL,
--     menu_item_id INT NOT NULL,
--     quantity INT NOT NULL CHECK (quantity > 0),
--     price DECIMAL(10,2) NOT NULL,

--     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
--     FOREIGN KEY (menu_item_id) REFERENCES MenuItem(menu_item_id)
-- );
-- CREATE TABLE Delivery (
--     delivery_id INT PRIMARY KEY AUTO_INCREMENT,
--     order_id INT NOT NULL UNIQUE,
--     courier_name VARCHAR(100) NOT NULL,
--     delivery_status VARCHAR(20) DEFAULT 'pending',
--     delivery_time DATETIME,

--     FOREIGN KEY (order_id) REFERENCES Orders(order_id)
-- );
-- CREATE TABLE Payment (
--     payment_id INT PRIMARY KEY AUTO_INCREMENT,
--     order_id INT NOT NULL UNIQUE,
--     payment_method VARCHAR(20) NOT NULL,
--     payment_status VARCHAR(20) DEFAULT 'pending',
--     paid_at DATETIME,

--     FOREIGN KEY (order_id) REFERENCES Orders(order_id)
-- );
-- ALTER TABLE Customer
-- ADD age INT CHECK (age >= 18);

-- ALTER TABLE Restaurant
-- MODIFY name VARCHAR(150);

-- ALTER TABLE Delivery
-- RENAME COLUMN courier_name TO courier;


-- INSERT INTO Customer (first_name, last_name, email, phone, age) VALUES
-- ('Aruzhan', 'Kairat', 'aru@mail.com', '87011111111', 20),
-- ('Dias', 'Nur', 'dias@mail.com', '87022222222', 25),
-- ('Alina', 'Serik', 'alina@mail.com', '87033333333', 22),
-- ('Timur', 'Khan', 'timur@mail.com', '87044444444', 30),
-- ('Dana', 'Bek', 'dana@mail.com', '87055555555', 19);

-- INSERT INTO Restaurant (name, phone, rating, city) VALUES
-- ('Burger House', '111111', 4.5, 'Atyrau'),
-- ('Pizza Place', '222222', 4.2, 'Atyrau'),
-- ('Sushi Bar', '333333', 4.8, 'Almaty'),
-- ('Cafe Central', '444444', 4.0, 'Astana'),
-- ('Fast Food', '555555', 3.9, 'Atyrau');

-- INSERT INTO MenuItem (restaurant_id, name, price) VALUES
-- (1, 'Burger', 2000),
-- (2, 'Pizza', 3500),
-- (3, 'Sushi', 5000),
-- (4, 'Coffee', 1000),
-- (5, 'Fries', 800);

-- INSERT INTO Orders (customer_id, restaurant_id, status, total_amount) VALUES
-- (1, 1, 'delivered', 2000),
-- (2, 2, 'pending', 3500),
-- (3, 3, 'delivered', 5000),
-- (4, 4, 'cancelled', 1000),
-- (5, 5, 'pending', 800);

-- INSERT INTO OrderItem (order_id, menu_item_id, quantity, price) VALUES
-- (1, 1, 1, 2000),
-- (2, 2, 1, 3500),
-- (3, 3, 1, 5000),
-- (4, 4, 1, 1000);

-- SELECT * FROM Customer;
-- SELECT * FROM Restaurant;
-- SELECT * FROM Orders;
SELECT  
    c.first_name,
    r.name AS restaurant,
    o.status,
    o.total_amount
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id;