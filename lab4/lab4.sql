SELECT * 
FROM customer 
ORDER BY last_name ASC;

SELECT DISTINCT manufacture 
FROM product 
ORDER BY manufacture ASC;

SELECT product_name, manufacture, category, product_type, price 
FROM product 
WHERE manufacture = 'DELL' 
ORDER BY product_name ASC;

SELECT first_name, last_name, gender, birth_date, phone_number 
FROM customer 
WHERE gender = 'F' 
  AND birth_date BETWEEN '1990-01-01' AND '2000-12-31' 
ORDER BY last_name ASC;

SELECT * 
FROM product 
WHERE category = 'NOTEBOOK' 
  AND product_description LIKE '%512%GB%';

SELECT * 
FROM product 
WHERE category IN ('NOTEBOOK', 'Desktops') 
  AND (product_description LIKE '%512%GB%' OR product_description LIKE '%1%TB%');
  
SELECT * 
FROM invoice 
WHERE customer_id IS NULL;
