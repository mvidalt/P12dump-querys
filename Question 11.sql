--Query Function 
CREATE or replace FUNCTION show_prod_cat2_plpgsql(catid integer) RETURNS TABLE(
prod_id integer,
category integer,
title character varying(50),
actor character varying(50),
price numeric(12,2),
special smallint,
common_prod_id integer
) AS $$
BEGIN
    RETURN QUERY
        SELECT *
        FROM products
        WHERE category = $1;
END;
$$ LANGUAGE plpgsql;

--Query Verification
SELECT COUNT(*) FROM show_prod_cat2_plpgsql(1);