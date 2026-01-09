DROP TABLE transactions;
CREATE TABLE transactions (
    transaction_id INTEGER,
    user_name TEXT,
    age INTEGER,
    country TEXT,
    product_category TEXT,
    purchase_amount NUMERIC,
    payment_method TEXT,
    transaction_date TEXT
);

\copy transactions(transaction_id,user_name,age,country,product_category,purchase_amount,payment_method,transaction_date) FROM 'C:/Users/Sahib Alizada/Desktop/h/ecommerce.csv' DELIMITER ',' CSV HEADER;

SELECT COUNT(*) FROM transactions;

SELECT * FROM transactions LIMIT 5;

ALTER TABLE transactions
ADD COLUMN transaction_date_dt DATE;

UPDATE transactions
SET transaction_date_dt = TO_DATE(transaction_date, 'MM/DD/YYYY');

SELECT transaction_date, transaction_date_dt
FROM transactions
LIMIT 5;

SELECT SUM(purchase_amount) AS total_revenue
FROM transactions;

SELECT AVG(purchase_amount) AS avg_purchase
FROM transactions;

SELECT COUNT(DISTINCT user_name) AS unique_customers
FROM transactions;

SELECT country,
       SUM(purchase_amount) AS total_revenue
FROM transactions
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 5;


SELECT country,
       AVG(purchase_amount) AS avg_purchase
FROM transactions
GROUP BY country
ORDER BY avg_purchase DESC
LIMIT 5;

SELECT product_category,
       SUM(purchase_amount) AS total_revenue
FROM transactions
GROUP BY product_category
ORDER BY total_revenue DESC;

SELECT DATE_TRUNC('month', transaction_date_dt) AS month,
       SUM(purchase_amount) AS total_revenue
FROM transactions
GROUP BY month
ORDER BY month;

SELECT payment_method,
       COUNT(*) AS transaction_count,
       SUM(purchase_amount) AS total_revenue
FROM transactions
GROUP BY payment_method
ORDER BY total_revenue DESC;
