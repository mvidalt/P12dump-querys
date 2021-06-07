--Inserts 
INSERT INTO data.customers VALUES (20001, 'Sergi', 'González', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20001', 'password', 17, 40000, 'F');
INSERT INTO data.customers VALUES (20002, 'Pep', 'López', '6224597470 Dell Way', NULL, 'DVCINXG', NULL, 0, 'Australia', 2, 'sg@dell.com', '6224597470', 3, '1869697669055999', '2010/07', 'user20002', 'password', 17, 40000, 'F');

--Query Function
CREATE FUNCTION del_under18()				
returns SETOF INTEGER AS $$
DELETE FROM customers WHERE age<18
RETURNING customerid;
$$ language sql

--Query Verification
SELECT del_under18();