--Query Function
CREATE or replace FUNCTION show_prod_cat_plpgsql3(catid integer) RETURNS SETOF products AS
$$
DECLARE
    sm_products products;
BEGIN
    for sm_products in
        SELECT * FROM products WHERE category = catid
        loop
            return next sm_products;
        end loop;
END;
$$ LANGUAGE plpgsql;

--Query Verification 
SELECT COUNT(*) FROM show_prod_cat_plpgsql3(1);