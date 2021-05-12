SELECT vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;

SELECT vend_name, prod_name, prod_price
FROM Vendors, Products;