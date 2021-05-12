
/*
Вставка данных
*/
INSERT INTO Customers(cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES
    ('Village Toys', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'John Smith', 'sales@villagetoys.com'),
    ('Kids Place', '333 South Lake Drive', 'Columbus', 'OH', '43333', 'USA', 'Michelle Green', NULL),
    ('Fun4All', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'jjones@fun4all.com'),
    ('Fun4All', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Denise L. Stephens', 'dstephens@fun4all.com'),
    ('The Toy Store', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'Kim Howard', NULL);

INSERT INTO Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
VALUES
    ('BRS01','Bears R Us','123 Main Street','Bear Town','MI','44444', 'USA'),
    ('BRE02','Bear Emporium','500 Park Street','Anytown','OH','44333', 'USA'),
    ('DLL01','Doll House Inc.','555 High Street','Dollsville','CA','99999', 'USA'),
    ('FRB01','Furball Inc.','1000 5th Avenue','New York','NY','11111', 'USA'),
    ('FNG01','Fun and Games','42 Galaxy Road','London', NULL,'N16 6PS', 'England'),
    ('JTS01','Jouets et ours','1 Rue Amusement','Paris', NULL,'45678', 'France');

INSERT INTO Products(vend_id, prod_name, prod_price, prod_desc)
VALUES
    ('BRS01', '8 inch teddy bear', 5.99, '8 inch teddy bear, comes with cap and jacket'),
    ('BRS01', '12 inch teddy bear', 8.99, '12 inch teddy bear, comes with cap and jacket'),
    ('BRS01', '18 inch teddy bear', 11.99, '18 inch teddy bear, comes with cap and jacket'),
    ('DLL01', 'Fish bean bag toy', 3.49, 'Fish bean bag toy, complete with bean bag worms with which to feed it'),
    ('DLL01', 'Bird bean bag toy', 3.49, 'Bird bean bag toy, eggs are not included'),
    ('DLL01', 'Rabbit bean bag toy', 3.49, 'Rabbit bean bag toy, comes with bean bag carrots'),
    ('DLL01', 'Raggedy Ann', 4.99, '18 inch Raggedy Ann doll'),
    ('FNG01', 'King doll', 9.49, '12 inch king doll with royal garments and crown'),
    ('FNG01', 'Queen doll', 9.49, '12 inch queen doll with royal garments and crown');

INSERT INTO Orders(order_date, cust_id)
VALUES
    ('2012-05-01', 1),
    ('2012-01-12', 3),
    ('2012-01-30', 4),
    ('2012-02-03', 5),
    ('2012-02-08', 1);

INSERT INTO OrderItems(order_num, order_item, prod_id, quantity, item_price)
VALUES
    (1, 1, 1, 100, 5.49),
    (1, 2, 3, 100, 10.99),
    (2, 1, 1, 20, 5.99),
    (2, 2, 2, 10, 8.99),
    (2, 3, 3, 10, 11.99),
    (3, 1, 3, 50, 11.49),
    (3, 2, 4, 100, 2.99),
    (3, 3, 5, 100, 2.99),
    (3, 4, 6, 100, 2.99),
    (3, 5, 7, 50, 4.49),
    (4, 1, 7, 5, 4.99),
    (4, 2, 3, 5, 11.99),
    (4, 3, 4, 10, 3.49),
    (4, 4, 5, 10, 3.49),
    (4, 5, 6, 10, 3.49),
    (5, 1, 4, 250, 2.49),
    (5, 2, 5, 250, 2.49),
    (5, 3, 6, 250, 2.49);
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

/*
Естественное объединение
*/
SELECT C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
AND OI.order_num = O.order_num
AND prod_id = 7;

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
/*Заменя для MySql*/
SELECT Customers.cust_id, Orders.order_num
FROM Orders LEFT OUTER JOIN Customers
ON Orders.cust_id = Customers.cust_id
UNION
SELECT Customers.cust_id, Orders.order_num
FROM Orders RIGHT OUTER JOIN Customers
ON Orders.cust_id = Customers.cust_id;

/* Aggregate Functions */
SELECt Customers.cust_id, COUNT(Orders.order_num) AS num_ord
FROM Customers INNER JOIN Orders
ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_ord
FROM Customers LEFT OUTER JOIN Orders
ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

