-- Top 5 Best Selling Products Based On Quantity 
SELECT p.product_name,
COUNT(f.sale_id) AS order_count
FROM fact_sales f 
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY order_count DESC
LIMIT 5;




-- Total Revenue per Product Category
SELECT p.category,
SUM(f.total_amount) AS total_revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;




-- Highest Number of Customers 
SELECT s.state_name, 
COUNT(c.customer_id) AS num_customers
FROM dim_customers c
JOIN dim_state s ON c.state_id = s.state_id
GROUP BY s.state_name 
ORDER BY num_customers DESC
LIMIT 1;




-- Most Preferred Delivery Method Based on order_count
SELECT d.method_name,
COUNT(f.sale_id) AS order_count
FROM fact_sales f 
JOIN dim_delivery_method d ON f.delivery_id = d.delivery_id
GROUP BY d.method_name
ORDER BY order_count DESC
LIMIT 1;




-- AOV per Order
SELECT sale_id, total_amount 
FROM fact_sales;

-- overall AOV 
SELECT AVG(total_amount) AS aov
FROM fact_sales;



-- Monthly Revenue Trend for Previous 12 months


-- Most Commonly used Payment Method 
SELECT month, method_name, order_count
FROM(
	SELECT DATE_FORMAT(f.sale_date, '%Y-%M') AS month,
			pm.method_name,
            COUNT(f.sale_id) AS order_count,
            RANK() OVER (PARTITION BY DATE_FORMAT(f.sale_date, '%Y-%M')
						ORDER BY COUNT(f.sale_id) DESC) AS rnk
	FROM fact_sales f
    JOIN dim_payment_method pm ON f.payment_id = pm.payment_id
    GROUP BY DATE_FORMAT(f.sale_date, '%Y-%M'), pm.method_name
) x
WHERE rnk = 1;




-- Number of Repeat Customers 
SELECT COUNT(*) AS repeat_customers
FROM (
	SELECT customer_id
    FROM fact_sales
    GROUP BY customer_id
    HAVING COUNT(sale_id) > 1
) t;




-- Distribution of Sales among Employees 
SELECT e.full_name, 
		COUNT(f.sale_id) AS order_count, 
        SUM(f.total_amount) AS total_sales
FROM fact_sales f
JOIN dim_employees e ON f.employee_id = e.employee_id
GROUP BY e.full_name 
ORDER BY total_sales DESC;




-- Gender Distribuion of Customers and Impact on Purchasing Behavior  
SELECT g.gender_name, 
	COUNT(DISTINCT c.customer_id) AS num_customers, 
    SUM(f.total_amount) AS total_revenue, 
    SUM(f.total_amount) / COUNT(DISTINCT c.customer_id) AS avg_revenue_per_customer, 
    AVG(f.total_amount) AS avg_transaction_value
FROM fact_sales f
JOIN dim_customers c ON f.customer_id = c.customer_id
JOIN dim_gender g ON c.gender_id = g.gender_id
GROUP BY g.gender_name;




-- Top 5 Customers by Total Spending 
SELECT c.full_name, 
SUM(f.total_amount) AS total_spent
FROM fact_sales f
JOIN dim_customers c ON  f.customer_id = c.customer_id
GROUP BY c.full_name
ORDER BY total_spent DESC 
LIMIT 5;




-- MOST POPULAR PRODUCT CATEGORY PER STATE
SELECT state_name, category, order_count 
FROM (
	SELECT s.state_name, p.category,
		COUNT(f.sale_id) AS order_count,
        RANK() OVER (PARTITION BY s.state_name
					ORDER BY COUNT(f.sale_id) DESC) AS rnk
	FROM fact_sales f 
    JOIN dim_customers c ON f.customer_id = c.customer_id
    JOIN dim_state s ON c.state_id = s.state_id
    JOIN dim_products p ON f.product_id = p.product_id
    GROUP BY s.state_name, p.category
) x
WHERE rnk = 1;




-- PERCENTAGE TOTAL REVENUE BY PAYMENT METHOD
SELECT pm.method_name,
	SUM(f.total_amount) AS revenue,
    ROUND(100.0 * SUM(f.total_amount) / (SELECT SUM(total_amount) FROM fact_sales), 2) AS pct_of_total
FROM fact_sales f
JOIN dim_payment_method pm ON f.payment_id = pm.payment_id
GROUP BY pm.method_name;




-- AVERAGE NUMBER OF ITEMS PER ORDER 
SELECT AVG(quantity) AS avg_items_per_order
FROM fact_sales;   




-- REVENUE CONTRIBUTION: NEW vs. EXISTING CUSTOMERS
WITH customer_orders AS (
	SELECT f.*,
		MIN(sale_date) OVER (PARTITION BY customer_id) AS first_order_date
	FROM fact_sales f
)
SELECT CASE WHEN sale_date = first_order_date THEN 'New' ELSE 'Existing' END AS customer_type, 
	SUM(total_amount) AS revenue,
    ROUND(100.0 * SUM(total_amount) / SUM(SUM(total_amount)) OVER (), 2) AS pct_of_total
FROM customer_orders
GROUP BY CASE WHEN sale_date = first_order_date THEN 'New' ELSE 'Existing' END;












