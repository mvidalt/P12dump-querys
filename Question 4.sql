--Query Function sql 
CREATE FUNCTION show_name_sql(id integer, OUT first varchar, OUT last varchar) AS
$$
SELECT firstname, lastname from customers where customerid = id;
$$ LANGUAGE sql;

--Query Verification
SELECT show_name_sql(2);
SELECT first,last FROM show_name_sql(2);


--Query Function psql
CREATE OR REPLACE FUNCTION  show_name_plpgsql(id integer, OUT first varchar, OUT last varchar) AS $$
BEGIN
SELECT firstname, lastname INTO first, last FROM customers
WHERE customerid = id;
END;
$$ LANGUAGE PLPGSQL;

--Query Verification
SELECT show_name_plpgssql(2);
SELECT first,last FROM show_name_plpgsql(2);