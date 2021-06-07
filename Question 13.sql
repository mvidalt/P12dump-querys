--Query Function
CREATE OR REPLACE FUNCTION mySum(integer, integer) RETURNS integer AS
$$
SELECT $1+$2;
$$ LANGUAGE sql;
CREATE OR REPLACE FUNCTION mySum(decimal, integer) RETURNS decimal AS
$$
SELECT $1+$2;
$$ LANGUAGE sql;
CREATE OR REPLACE FUNCTION mySum(text, text) RETURNS text AS
$$
SELECT CONCAT ($1,$2);
$$ LANGUAGE sql;

--Query Verification
SELECT mySum(1, 1), mySum(1.1,1), mySum('1','1');
