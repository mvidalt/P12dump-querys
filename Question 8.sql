--Query Function sql
CREATE or replace FUNCTION avg_price_sql() RETURNS numeric AS $$
    SELECT avg(price) FROM products;
    $$ LANGUAGE sql;

--Query Vertification 
SELECT avg_price_sql();


--Query Function psql
create or replace function avg_price_plpgsql() returns numeric AS
$$
    DECLARE avg_price numeric;
    BEGIN
    SELECT avg(price) INTO avg_price FROM products;
    RETURN avg_price;
    END;
$$ LANGUAGE plpgsql;

--Query Verification
SELECT avg_price_plpgsql();


--Query Function no avg
create or replace function avg_price_noavg() returns numeric AS
$$
DECLARE
    count_price numeric;
    sum_price numeric;
    avg_price numeric;
BEGIN
    SELECT count(price) INTO count_price FROM products;
    SELECT sum(price) INTO sum_price FROM products;
    SELECT (sum_price/count_price) INTO avg_price;
    RETURN avg_price;
END;
$$ LANGUAGE plpgsql;


--Query Verification
SELECT avg_price_noavg();