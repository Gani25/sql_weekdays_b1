-- task
use sprk_weekdays;
select * from orders;
select * from customers;
select * from products;
select * from order_items;

-- Q1. How many total customers are there from each city?
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Q2. What is the total number of orders placed per month?
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Q3. List top 5 customers who spent the most
SELECT c.customer_id, c.name, SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;

-- Q4. Which product category generated the highest revenue?
SELECT p.category, SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Q5. Find orders with total quantity more than 10
SELECT order_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY order_id
HAVING total_quantity > 10
ORDER BY total_quantity DESC;

-- Q6. Which customers have not placed any order in the last 6 months?
SELECT name, email
FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE order_date > CURDATE() - INTERVAL 6 MONTH
);

-- Q7. What is the average order value?
SELECT AVG(order_total) AS avg_order_value
FROM (
  SELECT o.order_id, SUM(p.price * oi.quantity) AS order_total
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY o.order_id
) AS sub;

-- Q8. Update all ‘Pending’ orders older than 30 days to ‘Delayed’
UPDATE orders
SET status = 'Delayed'
WHERE status = 'Pending'
  AND order_date < CURDATE() - INTERVAL 30 DAY;

-- Q9. Delete all orders marked as ‘Returned’
DELETE FROM order_items
WHERE order_id IN (
  SELECT order_id FROM orders WHERE status = 'Returned'
);

DELETE FROM orders
WHERE status = 'Returned';

-- Q10. Insert a new customer and place an order with 2 items
INSERT INTO customers (customer_id, name, email, city, signup_date)
VALUES (999, 'John Doe', 'john@example.com', 'Delhi', CURDATE());

INSERT INTO orders (order_id, customer_id, order_date, status)
VALUES (9999, 999, CURDATE(), 'Pending');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(99901, 9999, 5, 2),
(99902, 9999, 8, 1);