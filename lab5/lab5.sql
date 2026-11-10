SELECT 
    o.orders_id AS 'Orders ID',
    p.product_name AS 'Product name',
    p.category AS 'Product category',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction moment',
    c.last_name AS 'Customer last name',
    c.first_name AS 'Customer first name'
FROM orders AS o
INNER JOIN product AS p ON o.product_id = p.product_id
INNER JOIN invoice AS i ON o.invoice_id = i.invoice_id
INNER JOIN customer AS c ON i.customer_id = c.customer_id
ORDER BY o.orders_id;

SELECT 
    o.orders_id AS 'Orders ID',
    p.product_name AS 'Product name',
    p.category AS 'Product category',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction moment',
    e.last_name AS 'Employee last name',
    e.first_name AS 'Employee first name'
FROM orders AS o
JOIN product AS p ON o.product_id = p.product_id
JOIN invoice AS i ON o.invoice_id = i.invoice_id
JOIN employee AS e ON i.employee_id = e.employee_id
JOIN department AS d ON e.department_id = d.department_id
WHERE d.department_name = 'Mercury'
  AND i.transaction_moment BETWEEN '2023-07-01 00:00:00' AND '2023-10-01 23:59:59'
ORDER BY o.orders_id;

SELECT 
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM customer AS c
LEFT JOIN invoice AS i ON c.customer_id = i.customer_id

UNION

SELECT 
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM customer AS c
RIGHT JOIN invoice AS i ON c.customer_id = i.customer_id
ORDER BY 'Invoice ID';
