--Query Function 3.1
CREATE FUNCTION insert_category1_sql(pcategory integer, pname varchar) RETURNS void AS
$$
INSERT INTO categories VALUES (pcategory, pname);
$$ LANGUAGE sql;

--Query Verification
SELECT insert_category_sql(21,’category21’);


--Query Function 3.2
CREATE FUNCTION insert_category2_sql(integer, varchar) RETURNS void AS
$$
INSERT INTO categories VALUES ($1, $2);					
$$ LANGUAGE sql;

--Query Verification 
SELECT insert_category2_sql(22,’category22’);


--Query Function 3.3
CREATE FUNCTION insert_category3_sql(category integer, categoryname varchar) RETURNS void AS
$$
	INSERT INTO categories VALUES (insert_category3_sql.category,
	insert_category3_sql.categoryname);
$$ LANGUAGE sql;

--Query Verification
SELECT insert_category3_sql(‘23’,’category23’);


--Query Function 3.4
CREATE FUNCTION insert_category4_sql(pcategory categories) RETURNS void AS
$$
	INSERT INTO categories VALUES (pcategory.category,
	pcategory.categoryname);				
$$ LANGUAGE sql;

--Query Verification 
SELECT insert_category4_sql((24,’category’));