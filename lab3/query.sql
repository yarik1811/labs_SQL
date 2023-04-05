SELECT p.barcode, p.group, p.name, p.weight, p.price, p.type, p.date, c.count
	FROM product p
	JOIN countproducts c ON p.barcode = c.idProduct
    JOIN store s ON s.idStore = c.idStore
    WHERE s.idStore = 1;
    
SELECT s.idStore, s.name, c.count
	FROM product p
    JOIN countproducts c ON p.barcode = c.idProduct
    JOIN Store s ON c.idStore = s.idStore
    WHERE p.barcode = 101 AND c.count > 0;
    
SELECT s.name, p.group, AVG(p.price) as mean
	FROM product p
	JOIN countproducts c ON p.barcode = c.idProduct
	JOIN store s ON c.idStore = s.idStore
	GROUP BY s.name, p.group;
    
SELECT c.namecustomer, SUM(p.price) AS total_sum
	FROM customer c
	JOIN sale s ON c.idCustomer = s.idCustomer
	JOIN product p ON p.barcode = s.idProduct
	GROUP BY c.namecustomer
	ORDER BY total_sum DESC
	LIMIT 5;
    
SELECT p.*, s.idStore, s.name
	FROM product p
	JOIN countproducts c ON p.barcode = c.idProduct
	JOIN store s ON c.idStore = s.idStore
	WHERE p.date < NOW();
    
    
SELECT s.idStore, SUM(p.price) AS Total_Sales
	FROM sale s
	JOIN product p ON s.idProduct = p.barcode
	WHERE DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW()
	GROUP BY s.idStore
	HAVING SUM(p.price) > 20
