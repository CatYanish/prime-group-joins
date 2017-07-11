--Get all customers and their address
SELECT * FROM "customers" JOIN "addresses" ON
"customers"."id" = "addresses"."customer_id";


--Get all orders and their line items
SELECT * FROM "orders" JOIN "line_items" ON
"orders"."id" = "line_items"."order_id";

--Which warehouses have cheetos?
SELECT * FROM "warehouse" JOIN "warehouse_product" ON
"warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'cheetos';

 
SELECT * FROM "warehouse" JOIN "warehouse_product" ON
"warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi'; 

--Get the number of orders for each customer.
SELECT "customers"."first_name", "customers"."last_name", count("orders"."address_id") FROM "orders" JOIN "addresses" ON
"addresses"."id" = "orders"."address_id" 
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."id";

--How many customers do we have?
SELECT count(*) FROM "customers";

--How many products do we carry?
SELECT count(*) FROM "products";

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product" JOIN "products" 
ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi'; 

