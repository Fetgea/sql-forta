/*
Самообъединение
*/
SELECT cust_id, cust_name, cust_contact
FROM Customers
WHERE cust_name = (SELECT cust_name
                   FROM Customers
                   WHERE cust_contact = 'Jim Jones');

/*
Самообъединение с исп. AS
*/
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1, Customers AS c2
WHERE c1.cust_name = c2.cust_name
AND c2.cust_contact = 'Jim Jones';

/*
Предыдущий пример с использ. INNER JOIN
*/
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1 INNER JOIN Customers AS c2 ON c1.cust_name = c2.cust_name
WHERE c2.cust_contact = 'Jim Jones';
