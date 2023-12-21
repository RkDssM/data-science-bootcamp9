-- Problems: Create data base and finding 3 insight

-- Create Table customer

CREATE TABLE customers (
  customerid int PRIMARY KEY,
  name text,
  city text,
  phone int,
  ordersid int);

-- Create Table orders

CREATE TABLE orders (
  ordersid int PRIMARY KEY,
  menuid int,
  quantity int);

-- Create Table menus

CREATE TABLE menus (
  menuid int PRIMARY KEY,
  type text,
  list text,
  price real);

-----------------------------------------------------

-- Insert customer table

INSERT INTO customers values
  (1, 'David', 'Manchester', 5579, 1),
  (2, 'Steven', 'Liverpool', 7412, 4),
  (3, 'Steven', 'Liverpool', 7412, 6),
  (4, 'Alan', 'Newcastle', 8426, 3),
  (5, 'Alan', 'Newcastle', 8426, 5),
  (6, 'Henry', 'North London', 3215, 3),
  (7, 'Henry', 'North London', 3215, 7),
  (8, 'Frank', 'London', 4123, 2),
  (9, 'Frank', 'London', 4123, 4),
  (10, 'Frank', 'London', 4123, 5),
  (11, 'Frank', 'London', 4123, 6),
  (12, 'David', 'Manchester', 7412, 5),
  (13, 'Steven', 'Liverpool', 7412, 3),
  (14, 'David', 'Manchester', 7412, 1),
  (15, 'Steven', 'Liverpool', 7412, 3),
  (16, 'Alan', 'Newcastle', 7412, 7),
  (17, 'Henry', 'North London', 3215, 3);

-- Insert orders table
INSERT INTO orders values
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 1),
  (4, 4, 2),
  (5, 5, 2),
  (6, 6, 2),
  (7, 7, 2);

-- Insert menus table
INSERT INTO menus VALUES
  (1, 'PIZZA', 'Pepperoni', 259),
  (2, 'PIZZA', 'Hawaiian', 279),
  (3, 'PIZZA', 'classic cheese', 239),
  (4, 'APPETIZERS', 'Nuggets', 99),
  (5, 'APPETIZERS', 'French fries', 89),
  (6, 'DRINK', 'COCA-COLA', 45),
  (7, 'DRINK', 'WATER', 10);

--------------------------------------------------------


-- SELECT Querry customers
.mode box
--SELECT * FROM customers;

-- SELECT Querry orders
--SELECT * FROM orders;

-- SELECT Querry menus
--SELECT * FROM menus;

-- All order 
SELECT 
  customers.name,
  menus.type,
  menus.list,
  menus.price,
  orders.quantity,
  menus.price * orders.quantity AS total
FROM customers
JOIN orders ON orders.ordersid = customers.ordersid
JOIN menus ON orders.menuid = menus.menuid
ORDER BY name, type desc, price desc;

--------------------------------------------------------

-- Top menu

SELECT 
  menus.type,
  SUM(orders.quantity) AS total_order,
  SUM(menus.price * orders.quantity) AS total_price
FROM customers
JOIN orders ON orders.ordersid = customers.ordersid
JOIN menus ON orders.menuid = menus.menuid
GROUP BY menus.type
ORDER BY total_price DESC;

--------------------------------------------------------

-- Averrage spending per customers
SELECT 
customers.name,
ROUND(AVG(menus.price * orders.quantity),2) AS Average_price
FROM customers, orders, menus
WHERE customers.ordersid = orders.ordersid
  AND orders.menuid = menus.menuid
GROUP BY customers.name
ORDER BY Average_price DESC;


 
------------------------------------------------------- 

-- Top spending customers
WITH sub_customers AS
(SELECT 
  customers.name,
  menus.price,
  orders.quantity,
  menus.price * orders.quantity AS total
FROM customers
JOIN orders ON orders.ordersid = customers.ordersid
JOIN menus ON orders.menuid = menus.menuid)
SELECT 
  name,
  SUM (total) AS SUM_Total
FROM sub_customers
GROUP BY name
ORDER BY SUM_Total DESC;
