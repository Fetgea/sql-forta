SELECT COUNT(*) AS Orders
FROM Orders
WHERE cust_id = 1;

SELECT cust_name, cust_state, 
       (SELECT COUNT(*)
        FROM Orders
        WHERE Orders.cust_id = Customers.cust_id) AS orders
FROM Customers
ORDER BY cust_name;

/*
Пример запроса возвращающего неправильные данные
*/

SELECT cust_name, cust_state, 
       (SELECT COUNT(*)
        FROM Orders
        WHERE cust_id = cust_id) AS orders
FROM Customers
ORDER BY cust_name;