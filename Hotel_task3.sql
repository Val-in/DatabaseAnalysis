-- Создание таблицы Hotel
CREATE TABLE Hotel (
	ID_hotel SERIAL PRIMARY KEY,  -- Используем SERIAL для автоматической генерации идентификаторов
	name VARCHAR(255) NOT NULL,
	location VARCHAR(255) NOT NULL
);
 
-- Создание таблицы Room
CREATE TABLE Room (
	ID_room SERIAL PRIMARY KEY, 	-- Используем SERIAL для автоматической генерации идентификаторов
	ID_hotel INT,
	room_type VARCHAR(20) NOT NULL CHECK (room_type IN ('Single', 'Double', 'Suite')), -- тип номера
	price DECIMAL(10, 2) NOT NULL,
	capacity INT NOT NULL,
	FOREIGN KEY (ID_hotel) REFERENCES Hotel(ID_hotel)
);
 
-- Создание таблицы Customer
CREATE TABLE Customer (
	ID_customer SERIAL PRIMARY KEY,  -- Используем SERIAL для автоматической генерации идентификаторов
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	phone VARCHAR(20) NOT NULL
);
 
-- Создание таблицы Booking
CREATE TABLE Booking (
	ID_booking SERIAL PRIMARY KEY,   -- Используем SERIAL для автоматической генерации идентификаторов
	ID_room INT,
	ID_customer INT,
	check_in_date DATE NOT NULL,
	check_out_date DATE NOT NULL,
	FOREIGN KEY (ID_room) REFERENCES Room(ID_room),
	FOREIGN KEY (ID_customer) REFERENCES Customer(ID_customer)
);

-- Вставка данных в таблицу Hotel
INSERT INTO Hotel (ID_hotel, name, location) VALUES
(1, 'Grand Hotel', 'Paris, France'),
(2, 'Ocean View Resort', 'Miami, USA'),
(3, 'Mountain Retreat', 'Aspen, USA'),
(4, 'City Center Inn', 'New York, USA'),
(5, 'Desert Oasis', 'Las Vegas, USA'),
(6, 'Lakeside Lodge', 'Lake Tahoe, USA'),
(7, 'Historic Castle', 'Edinburgh, Scotland'),
(8, 'Tropical Paradise', 'Bali, Indonesia'),
(9, 'Business Suites', 'Tokyo, Japan'),
(10, 'Eco-Friendly Hotel', 'Copenhagen, Denmark');
-- Вставка данных в таблицу Room
INSERT INTO Room (ID_room, ID_hotel, room_type, price, capacity) VALUES
(1, 1, 'Single', 150.00, 1),
(2, 1, 'Double', 200.00, 2),
(3, 1, 'Suite', 350.00, 4),
(4, 2, 'Single', 120.00, 1),
(5, 2, 'Double', 180.00, 2),
(6, 2, 'Suite', 300.00, 4),
(7, 3, 'Double', 250.00, 2),
(8, 3, 'Suite', 400.00, 4),
(9, 4, 'Single', 100.00, 1),
(10, 4, 'Double', 150.00, 2),
(11, 5, 'Single', 90.00, 1),
(12, 5, 'Double', 140.00, 2),
(13, 6, 'Suite', 280.00, 4),
(14, 7, 'Double', 220.00, 2),
(15, 8, 'Single', 130.00, 1),
(16, 8, 'Double', 190.00, 2),
(17, 9, 'Suite', 360.00, 4),
(18, 10, 'Single', 110.00, 1),
(19, 10, 'Double', 160.00, 2);
-- Вставка данных в таблицу Customer
INSERT INTO Customer (ID_customer, name, email, phone) VALUES
(1, 'John Doe', 'john.doe@example.com', '+1234567890'),
(2, 'Jane Smith', 'jane.smith@example.com', '+0987654321'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '+1122334455'),
(4, 'Bob Brown', 'bob.brown@example.com', '+2233445566'),
(5, 'Charlie White', 'charlie.white@example.com', '+3344556677'),
(6, 'Diana Prince', 'diana.prince@example.com', '+4455667788'),
(7, 'Ethan Hunt', 'ethan.hunt@example.com', '+5566778899'),
(8, 'Fiona Apple', 'fiona.apple@example.com', '+6677889900'),
(9, 'George Washington', 'george.washington@example.com', '+7788990011'),
(10, 'Hannah Montana', 'hannah.montana@example.com', '+8899001122');
-- Вставка данных в таблицу Booking с разнообразием клиентов
INSERT INTO Booking (ID_booking, ID_room, ID_customer, check_in_date, check_out_date) VALUES
(1, 1, 1, '2025-05-01', '2025-05-05'),  -- 4 ночи, John Doe
(2, 2, 2, '2025-05-02', '2025-05-06'),  -- 4 ночи, Jane Smith
(3, 3, 3, '2025-05-03', '2025-05-07'),  -- 4 ночи, Alice Johnson
(4, 4, 4, '2025-05-04', '2025-05-08'),  -- 4 ночи, Bob Brown
(5, 5, 5, '2025-05-05', '2025-05-09'),  -- 4 ночи, Charlie White
(6, 6, 6, '2025-05-06', '2025-05-10'),  -- 4 ночи, Diana Prince
(7, 7, 7, '2025-05-07', '2025-05-11'),  -- 4 ночи, Ethan Hunt
(8, 8, 8, '2025-05-08', '2025-05-12'),  -- 4 ночи, Fiona Apple
(9, 9, 9, '2025-05-09', '2025-05-13'),  -- 4 ночи, George Washington
(10, 10, 10, '2025-05-10', '2025-05-14'),  -- 4 ночи, Hannah Montana
(11, 1, 2, '2025-05-11', '2025-05-15'),  -- 4 ночи, Jane Smith
(12, 2, 3, '2025-05-12', '2025-05-14'),  -- 2 ночи, Alice Johnson
(13, 3, 4, '2025-05-13', '2025-05-15'),  -- 2 ночи, Bob Brown
(14, 4, 5, '2025-05-14', '2025-05-16'),  -- 2 ночи, Charlie White
(15, 5, 6, '2025-05-15', '2025-05-16'),  -- 1 ночь, Diana Prince
(16, 6, 7, '2025-05-16', '2025-05-18'),  -- 2 ночи, Ethan Hunt
(17, 7, 8, '2025-05-17', '2025-05-21'),  -- 4 ночи, Fiona Apple
(18, 8, 9, '2025-05-18', '2025-05-19'),  -- 1 ночь, George Washington
(19, 9, 10, '2025-05-19', '2025-05-22'),  -- 3 ночи, Hannah Montana
(20, 10, 1, '2025-05-20', '2025-05-22'), -- 2 ночи, John Doe
(21, 1, 2, '2025-05-21', '2025-05-23'),  -- 2 ночи, Jane Smith
(22, 2, 3, '2025-05-22', '2025-05-25'),  -- 3 ночи, Alice Johnson
(23, 3, 4, '2025-05-23', '2025-05-26'),  -- 3 ночи, Bob Brown
(24, 4, 5, '2025-05-24', '2025-05-25'),  -- 1 ночь, Charlie White
(25, 5, 6, '2025-05-25', '2025-05-27'),  -- 2 ночи, Diana Prince
(26, 6, 7, '2025-05-26', '2025-05-29');  -- 3 ночи, Ethan Hunt

-- Задача 1

WITH CustomerBookings AS (
    SELECT 
        c.ID_customer,
        c.name,
        c.email,
        c.phone,
        COUNT(b.ID_booking) AS total_bookings,
        STRING_AGG(DISTINCT h.name, ', ') AS hotels_visited,
        AVG(b.check_out_date - b.check_in_date)::numeric(10,4) AS avg_stay
    FROM Customer c
    JOIN Booking b ON c.ID_customer = b.ID_customer
    JOIN Room r ON b.ID_room = r.ID_room
    JOIN Hotel h ON r.ID_hotel = h.ID_hotel
    GROUP BY c.ID_customer, c.name, c.email, c.phone
    HAVING COUNT(DISTINCT r.ID_hotel) > 1 AND COUNT(b.ID_booking) > 2
)
SELECT name, email, phone, total_bookings, hotels_visited, avg_stay
FROM CustomerBookings
ORDER BY total_bookings DESC;

-- Задача 2

WITH CustomerStats AS (
    SELECT 
        c.ID_customer,
        c.name,
        COUNT(b.ID_booking) AS total_bookings,
        COUNT(DISTINCT r.ID_hotel) AS unique_hotels,
        SUM(r.price * (b.check_out_date - b.check_in_date)) AS total_spent
    FROM Customer c
    JOIN Booking b ON c.ID_customer = b.ID_customer
    JOIN Room r ON b.ID_room = r.ID_room
    GROUP BY c.ID_customer, c.name
),
QualifiedCustomers AS (
    SELECT *
    FROM CustomerStats
    WHERE total_bookings > 2 
      AND unique_hotels > 1
      AND total_spent > 500
)
SELECT ID_customer, name, total_bookings, total_spent, unique_hotels
FROM QualifiedCustomers
ORDER BY total_spent ASC;

-- Задача 3

WITH HotelCategory AS (
    SELECT 
        h.ID_hotel,
        h.name,
        CASE 
            WHEN AVG(r.price) < 175 THEN 'Дешевый'
            WHEN AVG(r.price) BETWEEN 175 AND 300 THEN 'Средний'
            ELSE 'Дорогой'
        END AS category
    FROM Hotel h
    JOIN Room r ON h.ID_hotel = r.ID_hotel
    GROUP BY h.ID_hotel, h.name
),
CustomerPreferences AS (
    SELECT 
        c.ID_customer,
        c.name,
        STRING_AGG(DISTINCT h.name, ', ') AS visited_hotels,
        CASE 
            WHEN BOOL_OR(h.category = 'Дорогой') THEN 'Дорогой'
            WHEN BOOL_OR(h.category = 'Средний') THEN 'Средний'
            ELSE 'Дешевый'
        END AS preferred_hotel_type
    FROM Customer c
    JOIN Booking b ON c.ID_customer = b.ID_customer
    JOIN Room r ON b.ID_room = r.ID_room
    JOIN HotelCategory h ON r.ID_hotel = h.ID_hotel
    GROUP BY c.ID_customer, c.name
)
SELECT ID_customer, name, preferred_hotel_type, visited_hotels
FROM CustomerPreferences
ORDER BY CASE preferred_hotel_type
             WHEN 'Дешевый' THEN 1
             WHEN 'Средний' THEN 2
             WHEN 'Дорогой' THEN 3
         END;
