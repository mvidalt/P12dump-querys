--Query Function sql
CREATE or replace FUNCTION show_prod_sql(INOUT prod_id integer, OUT title varchar(50), OUT price numeric) AS
    $$
    SELECT prod_id, title, price FROM products
    WHERE prod_id = $1;
    $$ LANGUAGE sql;

--Query Verification
SELECT * FROM show_prod_sql(2);


--Query Function psql 
CREATE or replace FUNCTION show_prod_plpgsql(INOUT prod_id integer, OUT title varchar(50), OUT price numeric) RETURNS RECORD AS
$$
BEGIN
	SELECT p.prod_id,p.title,p.price INTO
		show_prod_plpgsql.prod_id,
		show_prod_plpgsql.title,
		show_prod_plpgsql.price
	FROM products p WHERE p.prod_id = $1;
END;
$$ LANGUAGE plpgsql;

--Query Verification 
SELECT * FROM show_prod_plpgsql(2);