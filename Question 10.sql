--Query Function sql
CREATE OR REPLACE FUNCTION show_prod_cat_sql(pcategory integer) RETURNS SETOF products AS
$$
SELECT *
FROM products
WHERE category = $1;
$$ LANGUAGE sql;

--Query Verification
SELECT COUNT(*) FROM show_prod_cat_sql(1);


--Query Function psql
CREATE OR REPLACE FUNCTION show_prod_cat_plpgsql(pcategory integer) RETURNS SETOF products AS
$$
BEGIN
    RETURN QUERY
    SELECT *
    FROM products
    WHERE category = $1;
END;
$$ LANGUAGE plpgsql;

--Query Verification
SELECT COUNT(*) FROM show_prod_cat_plpgsql(1);