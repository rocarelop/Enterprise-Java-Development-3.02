CREATE SCHEMA ejercicio2;
USE ejercicio2lab;
CREATE TABLE flight(
flight_number VARCHAR(7) NOT NULL,
aircraft VARCHAR(15),
aircraft_seats INT,
flight_mileage INT,
PRIMARY KEY (flight_number));

CREATE TABLE customer(
id_customer INT NOT NULL,
customer_name VARCHAR(30),
customer_mileage INT,
customer_status VARCHAR(7),
PRIMARY KEY (id_customer));

CREATE TABLE id_customer_flight(
id_flight_number VARCHAR(8) NOT NULL,
id_customer INT,
flight_number VARCHAR(7),
PRIMARY KEY (id_flight_number),
FOREIGN KEY(id_customer) REFERENCES customer(id_customer),
FOREIGN KEY(flight_number) REFERENCES flight(flight_number)
);

SHOW TABLES;

INSERT INTO flight(flight_number,aircraft,aircraft_seats,flight_mileage) VALUES
('DL143','Boeing 747','400','135'),
('DL122','Airbus A330','236','4370'),
('DL53','Boeing 777','264','2078'),
('DL222','Boeing 777','264','1765'),
('DL37','Boeing 747','400','531');

INSERT INTO customer(id_customer, customer_name, customer_mileage, customer_status) VALUES
('1','Agustine Riviera','115235','Silver'),
('2','Alaina Sepulvida','6008','None'),
('3','Tom Jones','205767','Gold'),
('4','Sam Rio','2653','None'),
('5','Jessica James','	127656','Silver'),
('6','Ana Janco','136773','Silver'),
('7','Jennifer Cortez','300582','Gold'),
('8','Christian Janco','14642','Silver');

INSERT INTO id_customer_flight(id_flight_number, id_customer, flight_number) VALUES
('DL143-1','1','DL143'),
('DL122-1','1','DL122'),
('DL122-2','2','DL122'),
('DL122-3','3','DL122'),
('DL53-3','3','DL53'),
('DL143-4','4','DL143'),
('DL222-3','3','DL222'),
('DL143-5','5','DL143'),
('DL222-6','6','DL222'),
('DL222-7','7','DL222'),
('DL122-5','5','DL122'),
('DL37-4','4','DL37'),
('DL222-8','8','DL222');

SELECT*FROM id_customer_flight;
SELECT*FROM customer;
SELECT*FROM flight;


/*3.In the Airline database write the SQL script to get the total number of flights in the database*/
SELECT COUNT(*) AS flight_number FROM id_customer_flight;

/*4.In the Airline database write the SQL script to get the average flight distance.*/
SELECT AVG(flight_mileage) FROM flight;

/*5.In the Airline database write the SQL script to get the average number of seats.*/
SELECT AVG(aircraft_seats) FROM flight;

/*6.In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.*/
SELECT customer_status, AVG(customer_mileage) FROM customer GROUP BY customer_status;

/*7.In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.*/
SELECT customer_status, MAX(customer_mileage) FROM customer GROUP BY customer_status;

/*8.In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.*/
SELECT COUNT(aircraft) FROM flight WHERE aircraft LIKE '%Boeing%';

/*9.In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.*/
SELECT*FROM flight WHERE flight_mileage BETWEEN 300 AND 2000;

/*10.In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).*/

SELECT 
	flight.flight_mileage,customer.customer_status, AVG(flight.flight_mileage)
FROM 
	flight
INNER JOIN id_customer_flight ON id_customer_flight.flight_number = flight.flight_number 
INNER JOIN customer ON id_customer_flight.id_customer = customer.id_customer
GROUP BY customer.customer_status
;

/*11.In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).*/
SELECT 
flight.aircraft, customer.customer_status, MAX(flight.aircraft)
FROM 
flight
INNER JOIN id_customer_flight ON id_customer_flight.flight_number = flight.flight_number 
INNER JOIN customer ON id_customer_flight.id_customer = customer.id_customer
WHERE customer.customer_status= 'Gold'
GROUP BY customer.customer_status 
;