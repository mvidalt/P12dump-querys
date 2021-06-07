--Query Function sql 
CREATE FUNCTION show_cust_sql(id integer) RETURNS customers AS $$
SELECT * FROM customers
WHERE customerid = $1;
$$ LANGUAGE sql;

--Query Verification
SELECT * FROM show_cust_sql(2);
SELECT (show_cust_sql(2)).firstname;


--Query Function psql
CREATE or replace FUNCTION show_cust_plpgsql(id integer) RETURNS customers AS $$
    DECLARE vcustomers customers;
    BEGIN
    SELECT * INTO vcustomers FROM customers
    WHERE customerid = $1;
    RETURN vcustomers;
    END;
$$ LANGUAGE plpgsql;

--Query Verification 
SELECT * FROM show_cust_plpgsql(2);
SELECT (show_cust_plpgsql(2)).firstname;
