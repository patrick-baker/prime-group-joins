-- 1. Get all customers and their addresses.
    SELECT * FROM "customers"
    JOIN "addresses" ON "addresses".customer_id="customers".id;

--2. Get all orders and their line items (orders, quantity and product).
    SELECT "orders".id, "line_items".quantity, "products".description FROM "orders"
    JOIN "line_items" ON "orders".id = "line_items".order_id
    JOIN "products" ON "products".id = "line_items".product_id;

--3. Which warehouses have cheetos?
    SELECT "warehouse".warehouse, "products".description FROM "warehouse"
    JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id   
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".id = 5;

--4. Which warehouses have diet pepsi?
    SELECT "warehouse".warehouse, "products".description, "on_hand" FROM "warehouse"
    JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".id = 6;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
    SELECT "customers".first_name, "customers".last_name, COUNT("orders".address_id) FROM "customers"
    JOIN "addresses" ON "addresses".customer_id = "customers".id
    FULL OUTER JOIN "orders" ON "orders".address_id = "addresses".id
    GROUP BY "customers".first_name, "customers".last_name;

--6. How many customers do we have?
    SELECT COUNT(*) FROM "customers";

--7. How many products do we carry?
    SELECT COUNT(*) FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
    SELECT "products"."description", SUM("warehouse_product".on_hand) FROM "products"
    JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id
    WHERE "products".id = 6
    GROUP BY "products"."description";

```## Stretch```
--9. How much was the total cost for each order?
    SELECT "orders".id, SUM("products".unit_price*"line_items".quantity) FROM "orders"
    JOIN "line_items" ON "orders".id = "line_items".order_id
    JOIN "products" ON "products".id = "line_items".product_id
    GROUP BY "orders".id;

--10. How much has each customer spent in total?

--11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).

