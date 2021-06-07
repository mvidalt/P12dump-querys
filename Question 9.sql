--Query 1
SELECT * FROM avg_price_sql();

--Query 2
SELECT title,price FROM products 
WHERE price > avg_price_sql();

--Query 3
SELECT title,price FROM products
WHERE price > (SELECT avg_price_sql() * 0.2);

--Query 4
SELECT title, price
FROM products
WHERE price BETWEEN (SELECT avg_price_sql() * 0.8) AND (SELECT avg_price_sql() * 1.2);
