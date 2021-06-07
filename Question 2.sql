--Insert
INSERT INTO data.customers VALUES (20001, 'Sergi', 'González', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20001', 'password', 17, 40000, 'F');
INSERT INTO data.customers VALUES (20002, 'Pep', 'López', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20002', 'password', 17, 40000, 'F');

--Query Function
CREATE TYPE return_before_after AS (before int, after int);
CREATE or replace FUNCTION del_under18_2() RETURNS return_before_after AS
$$
DECLARE
	before integer;
	after integer;
BEGIN
SELECT count(*) INTO before FROM customers;
DELETE FROM customers WHERE age < 18;
SELECT count(*) INTO after FROM customers;
RETURN (before, after);
END;
$$ LANGUAGE plpgsql;

--Query Verification:
SELECT del_under18_2();
SELECT * FROM del_under_18_2();
