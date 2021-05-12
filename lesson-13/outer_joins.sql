/*
Внешнее объединение
*/
SELECT Customers.cust_id, Orders.order_num
FROM Customers INNER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

/*
LEFT OUTER JOIN
*/
SELECT Customers.cust_id, Orders.order_num
FROM Customers LEFT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

/*
RIGHT OUTER JOIN
*/
SELECT Customers.cust_id, Orders.order_num
FROM Customers RIGHT OUTER JOIN Orders
ON Orders.cust_id = Customers.cust_id;

/*
Замена RIGHT OUTER JOIN на LEFT OUTER JOIN для SQLite
*/
SELECT Customers.cust_id, Orders.order_num
FROM Orders LEFT OUTER JOIN Customers
ON Orders.cust_id = Customers.cust_id;

/*
FULL JOIN не поддерживается MySQL

SELECT Customers.cust_id, Orders.order_num
FROM Orders FULL OUTER JOIN Customers
ON Orders.cust_id = Customers.cust_id;
*/
/*Замена для MySql*/
SELECT Customers.cust_id, Orders.order_num
FROM Orders LEFT OUTER JOIN Customers
ON Orders.cust_id = Customers.cust_id
UNION
SELECT Customers.cust_id, Orders.order_num
FROM Orders RIGHT OUTER JOIN Customers
ON Orders.cust_id = Customers.cust_id;