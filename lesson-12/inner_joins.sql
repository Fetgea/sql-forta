
SELECT vend_name, prod_name, prod_price
FROM Vendors INNER JOIN Products
ON Vendors.vend_id = Products.vend_id;
/*
Объединение нескольких таблиц
*/
SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems, Products, Vendors
WHERE Products.vend_id = Vendors.vend_id
AND OrderItems.prod_id = Products.prod_id
AND order_num = 3;
/*
Объединение нескольких таблиц с INNER JOIN
*/
SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems INNER JOIN Products ON OrderItems.prod_id = Products.prod_id
INNER JOIN Vendors ON Products.vend_id = Vendors.vend_id
WHERE order_num = 3;

/*
Пример из урока 11
*/
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
AND OrderItems.order_num = Orders.order_num
AND prod_id = 7;
/*
Пример из урока 11 с INNER JOIN
*/
SELECT cust_name, cust_contact
FROM Customers INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
INNER JOIN OrderItems ON OrderItems.order_num = Orders.order_num
WHERE prod_id = 7;
