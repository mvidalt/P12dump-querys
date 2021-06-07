--Query Function sql
CREATE FUNCTION increase_price_sql(prod products) RETURNS numeric AS $$
    UPDATE products SET price = price + 0.05 * price
    WHERE prod.prod_id = prod_id
    RETURNING price;
    $$ language sql;

--Query Verification
SELECT common_prod_id, increase_price_sql(products.*)
FROM products
WHERE title=’ACADEMY ADAPTATION’;


--Query Function psql
CREATE OR REPLACE FUNCTION increase_price_plpgsql(prod products) RETURNS numeric AS $$
    BEGIN
    	UPDATE products SET price = price + 0.05 * price
    	WHERE prod.prod_id = prod_id;
    	RETURN  ( SELECT price FROM products WHERE prod.prod_id = prod_id);
    END;
    $$ language plpgsql;

--Query Verification 
SELECT common_prod_id, increase_price_plpgsql(products.*)
FROM products
WHERE  title=’ACADEMY ADAPTATION’;
