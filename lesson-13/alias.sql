/*
MYSQL не поддерживает синтаксис "+"

SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors
ORDER BY vend_name
*/
SELECT CONCAT(RTRIM(vend_name), " (", RTRIM(vend_country), ")") AS vend_title
FROM Vendors
ORDER BY vend_name;

SELECT cust_name, cust_contact
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
AND OI.order_num = O.order_num
AND prod_id = 7;

/*
Переписан с исп INNER JOIN
*/
SELECT cust_name, cust_contact
FROM Customers AS C INNER JOIN Orders AS O ON C.cust_id = O.cust_id
INNER JOIN OrderItems AS OI ON OI.order_num = O.order_num
WHERE prod_id = 7;
