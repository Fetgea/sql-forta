
/*
ON DELETE CASCADE у внешнего ключа Products в таблице OrderItems
*/

SELECT OrderItems.*
FROM OrderItems;

DELETE FROM Products
WHERE prod_id = 3;

SELECT OrderItems.*
FROM OrderItems;