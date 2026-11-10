SELECT 
    LPAD(product_id, 4, '0') AS 'Product ID',
    CONCAT(manufacture, ' :: ', SUBSTRING_INDEX(product_name, '/', 1)) AS 'Product Name',
    UPPER(CONCAT(product_type, ' - ', category)) AS 'Category'
FROM 
    product
ORDER BY 
    manufacture ASC;
    
SELECT 
    LPAD(MONTH(i.transaction_moment), 2, '0') AS `Month`,
    FORMAT(SUM(p.price * o.quantity), 2) AS `Total revenue`,
    CONCAT('Quater ', QUARTER(i.transaction_moment), '-', YEAR(i.transaction_moment)) AS `Sales Period`
FROM 
    invoice i
JOIN 
    orders o ON i.invoice_id = o.invoice_id
JOIN 
    product p ON o.product_id = p.product_id
GROUP BY 
    `Sales Period`,
    `Month`
ORDER BY 
    MIN(i.transaction_moment) ASC;
    
SELECT 
    p.product_id AS 'Product ID',
    p.product_name AS 'Product name',
    p.price AS 'Product Price',
    SUM(o.quantity) AS 'Product Quantity',
    ROUND(SUM(p.price * o.quantity), 2) AS 'Total Amount'
FROM 
    product p
JOIN 
    orders o ON p.product_id = o.product_id
GROUP BY 
    p.product_id, 
    p.product_name, 
    p.price
HAVING 
    SUM(p.price * o.quantity) > 50000
ORDER BY 
    `Total Amount` DESC;
    
SELECT 
    LPAD(c.customer_id, 3, '0') AS 'Customer ID',
    c.last_name AS 'Customer last name',
    c.first_name AS 'Customer first name',
    ROUND(SUM(p.price * o.quantity), 2) AS 'Total Amount'
FROM 
    customer c
JOIN 
    invoice i ON c.customer_id = i.customer_id
JOIN 
    orders o ON i.invoice_id = o.invoice_id
JOIN 
    product p ON o.product_id = p.product_id
GROUP BY 
    c.customer_id, 
    c.last_name, 
    c.first_name
ORDER BY 
    `Total Amount` DESC
LIMIT 10;
