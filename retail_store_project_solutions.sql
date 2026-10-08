# LEVEL - 1 BASIC SELECT & SIMPLE FILTERS

# Q1. Retrieve customer names and emails for email marketing?

select name, email
from customers;

# Q2. View complete product catalog with all available details?

SELECT *
FROM products;

# Q3. List all unique product categories?

SELECT distinct(category)
FROM products;

# Q4.  Show all products priced above ₹1,000?

SELECT *
FROM products
Where price > 1000;

# Q5. Display products within a mid-range price bracket (₹2,000 to ₹5,000)?

SELECT *
FROM products 
WHERE price between 2000 and 5000;

# Q6. Fetch data for specific customer IDs (e.g., from loyalty program list)?

SELECT *
FROM customers
WHERE customer_id IN (2,5,8,24,29);

# Q7. Identify customers whose names start with the letter ‘A’?

SELECT *
FROM customers
WHERE name LIKE 'A%';


# Q8. List electronics products priced under ₹3,000?

SELECT *
FROM products
WHERE category = "electronics"
and price < 3000;


# Q9. Display product names and prices in descending order of price? 

SELECT name, price
FROM products
ORDER BY price desc;


# Q10. Display product names and prices, sorted by price and then by name?

SELECT name, price
FROM products
ORDER BY price ASC, name ASC;


# LEVEL - 2. FILTERING AND FORMATTING

# Q1. Retrieve orders where customer information is missing (possibly due to data migration ordeletion)?

SELECT *
FROM orders
WHERE customer_id is null;

# Q2. Display customer names and emails using column aliases for frontend readability?

SELECT
		name AS customer_name,
		email AS customer_email
FROM customers;

# Q3. Calculate total value per item ordered by multiplying quantity and item price?

SELECT *,
		quantity * item_price AS total_value
FROM order_items;

# Q4. Combine customer name and phone number in a single column?

SELECT CONCAT(name, ' _ ' ,phone) AS customer_details
FROM customers;

# Q5. Extract only the date part from order timestamps for date-wise reporting?

SELECT order_id,
	DATE(order_date) AS order_date
FROM orders;

# Q6. List products that do not have any stock left?

SELECT *
FROM products
WHERE stock_quantity = 0;


                                               # LEVEL - 3 AGGREGATIONS

# Q1. Count the total number of orders placed?

SELECT COUNT(order_id) AS total_orders
FROM orders;

# Q2. Calculate the total revenue collected from all orders?

SELECT SUM(total_amount) AS total_revenue
FROM orders;

# Q3. Calculate the average order value?

SELECT AVG(total_amount) AS average_order_value
FROM orders;

# Q4. Count the number of customers who have placed at least one order?

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM orders;




# Q5. Find the number of orders placed by each customer?

SELECT customer_id,
		COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;



# Q6. Find total sales amount made by each customer?

SELECT customer_id,
		SUM(total_amount) AS total_sales
FROM orders
GROUP BY customer_id;



# Q7. List the number of products sold per category?

SELECT category,
		COUNT(product_id) AS total_products
from products
GROUP BY category;



# Q8. Find the average item price per category?

SELECT category,
		AVG(price) AS average_item_price
FROM products
GROUP BY category;



# Q9. Show number of orders placed per day?

SELECT DATE(order_date) AS order_day,
		COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATE(order_date);

# Q10. List total payments received per payment method?

SELECT method,
		SUM(amount_paid) AS total_payments
FROM payments
GROUP BY method;

                                     # LEVEL - 4 MUTLI-TABLE QUERIES (JOINS)
					
# Q1. Retrieve order details along with the customer name (INNER JOIN)?

SELECT orders.*, customers.name
FROM customers 
INNER JOIN orders 
ON customers.customer_id = orders.customer_id;

# Q2. Get list of products that have been sold (INNER JOIN with order_items)?

SELECT DISTINCT products.*
FROM products
INNER JOIN order_items
ON products.product_id = order_items.product_id;

# Q3. List all orders with their payment method (INNER JOIN)?

SELECT orders.*, payments.method
FROM orders 
INNER JOIN payments
ON orders.order_id = payments.order_id;

# Q4. Get list of customers and their orders (LEFT JOIN)?

SELECT customers.*, orders.*
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;


# Q5. List all products along with order item quantity (LEFT JOIN)?

SELECT products.*, order_items.quantity
FROM products
LEFT JOIN order_items
ON products.product_id = order_items.product_id;


# Q6. List all payments including those with no matching orders (RIGHT JOIN)?

SELECT orders.*, payments.*
FROM orders
RIGHT JOIN payments
ON orders.order_id = payments.order_id;

# Q7. Combine data from three tables: customer, order, and payment?

SELECT customers.*, orders.*, payments.*
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN payments
ON orders.order_id = payments.order_id;


                                            # LEVEL - 5 SUBQUERIES(INNER QUERIES)


# Q1. List all products priced above the average product price?

SELECT product_id, name, price
FROM products
WHERE price > (
		SELECT AVG(price)
        FROM products
);



# Q2. Find customers who have placed at least one order?

SELECT customer_id, name
FROM customers c
WHERE EXISTS (
		SELECT 1
        FROM orders o
        WHERE o.customer_id = c.customer_id
);
        
		



# Q3. Show orders whose total amount is above the average for that customer?

SELECT order_id, customer_id, total_amount
FROM orders o
WHERE total_amount > (
			SELECT AVG(total_amount)
            FROM orders 
            WHERE customer_id = o.customer_id
);
            



# Q4. Display customers who haven’t placed any orders?

SELECT customer_id, name
FROM customers c
WHERE NOT EXISTS (
		SELECT 1
        FROM orders o
        WHERE o.customer_id = c.customer_id
);




# Q5. Show products that were never ordered?

SELECT product_id, name
FROM products p
WHERE product_id NOT IN (
		SELECT product_id
        FROM order_items oi
        where oi.product_id = p.product_id
);


# Q6. Show highest value order per customer?

SELECT order_id, customer_id, total_amount
FROM orders o
WHERE total_amount = (
		SELECT MAX(total_amount)
        FROM orders 
        WHERE customer_id = o.customer_id
);


# Q7. Highest Order Per Customer (Including Names)?

SELECT c.customer_id, c.name, 
        o.order_id, o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.total_amount = (
		SELECT MAX(total_amount)
        FROM orders
        WHERE customer_id = c.customer_id
);



                                      # LEVEL - 6  SET OPERATIONS

# Q1. List all customers who have either placed an order or written a product review?

SELECT c.customer_id,
       c.name
FROM customers c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM orders

    UNION

    SELECT customer_id
    FROM product_reviews
);


# Q2. List all customers who have placed an order as well as reviewed a product [intersect notsupported]?

SELECT c.customer_id,
       c.name
FROM customers c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM orders
)
AND c.customer_id IN (
    SELECT customer_id
    FROM product_reviews
);