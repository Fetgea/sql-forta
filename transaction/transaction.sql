/*Order cannot be empty, so order must be created and filled with items*/
START TRANSACTION;
/* Creating new order */
INSERT INTO Orders(order_date, cust_id)
    VALUES ('19.05.2021', 4)
;
/* Getting ID*/
SELECT Orders.order_num
FROM Orders
    WHERE order_date = '19.05.2021' 
        AND cust_id = 4
;

/* or like this */
SELECT LAST_INSERT_ID()
;

/*Insert this id in new insert statement in code*/

INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
    VALUES (6, 1, 1, 100, 5.49),
           (6, 2, 3, 100, 10.99)
;
/* If error when executing one of this 2 statements need to ROLLBACK from code*/
COMMIT;

