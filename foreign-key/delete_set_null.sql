/*ON DELETE SET NULL у ключа Customers в таблице Orders*/

SELECT Orders.* FROM Orders
;

DELETE FROM Customers WHERE cust_id = 1
;

SELECT Orders.* FROM Orders
;