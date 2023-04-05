TRUNCATE product;
TRUNCATE customer;
TRUNCATE sale;
TRUNCATE store;
TRUNCATE countproducts;

INSERT INTO `product` (`barcode`, `group`, `name`, `weight`, `price`, `type`, `date`) VALUES
	(100, 1, 'Колбаса', 0.400, 289, 0, DATE_ADD(NOW(), INTERVAL -30 DAY)),
    (101, 1, 'Сосиски', 0.500, 319, 0, DATE_ADD(NOW(), INTERVAL 30 DAY)),
    (201, 2, 'Молоко', 0.930, 89, 0, DATE_ADD(NOW(), INTERVAL 14 DAY)),
    (202, 2, 'Йогурт', 0.70, 59, 0, DATE_ADD(NOW(), INTERVAL 21 DAY)),
    (203, 2, 'Кефир', 0.300, 65, 0, DATE_ADD(NOW(), INTERVAL 14 DAY)),
    (300, 3, 'Хлеб', 0.300, 29, 0, DATE_ADD(NOW(), INTERVAL 7 DAY)),
    (301, 3, 'Сухарики', 0.50, 29, 1, DATE_ADD(NOW(), INTERVAL 60 DAY)),
    (302, 3, 'Батон', 0.300, 49, 0, DATE_ADD(NOW(), INTERVAL 14 DAY)),
    (400, 4, 'Порошок', 1.200, 399, 1, DATE_ADD(NOW(), INTERVAL 365 DAY)),
    (401, 4, 'Моющее средство', 0.300, 89, 0, DATE_ADD(NOW(), INTERVAL 365 DAY)),
    (402, 4, 'Мыло', 0.400, 119, 0, DATE_ADD(NOW(), INTERVAL 365 DAY));
    
INSERT INTO `customer` (`nameCustomer`, `cardNumber`) VALUES
	('Иван Иванов', 111111),
    ('Олег Олегов', 222222),
    ('Алексей Алексеев', 333333),
    ('Роман Романов', 444444),
    ('Даниил Даниилов', 555555),
    ('Максим Максимов', 666666),
    ('Тимур Воронцов', 777777),
    ('Никита Коротков', 888888),
    ('Вячеслав Соколов', 999999),
    ('Даниил Тарасов', 000000);
    
INSERT INTO `store` (`name`) VALUES
	('Ашан'),
    ('Пятёрочка'),
    ('Шестёрочка'),
    ('Магнит'),
    ('Лента'),
    ('Дикси'),
    ('Окей');
    
INSERT INTO `countproducts` (`idProduct`, `idStore`, `count`) VALUES
	(101, 1, 10),
    (100, 1, 10),
    (201, 1, 5),
    (302, 2, 12),
    (101, 2, 20),
    (202, 3, 15),
    (400, 3, 12),
    (401, 1, 10),
    (402, 1, 15),
    (200, 2, 18),
    (201, 3, 30),
    (202, 4, 20),
    (203, 5, 25),
    (402, 6, 15);
    
INSERT INTO `sale` (`idStore`, `idCustomer`, `idProduct`, `date`) VALUES
	(1, 1, 100,  DATE_ADD(NOW(), INTERVAL -30 DAY)),
    (1, 1, 400,  DATE_ADD(NOW(), INTERVAL -30 DAY)),
    (2, 2, 200,  DATE_ADD(NOW(), INTERVAL -14 DAY)),
    (2, 2, 300,  DATE_ADD(NOW(), INTERVAL -60 DAY)),
    (3, 3, 301,  DATE_ADD(NOW(), INTERVAL -14 DAY)),
    (3, 3, 201,  DATE_ADD(NOW(), INTERVAL -21 DAY)),
    (4, 2, 202,  DATE_ADD(NOW(), INTERVAL -22 DAY)),
    (4, 2, 101,  DATE_ADD(NOW(), INTERVAL -20 DAY)),
    (5, 1, 101,  DATE_ADD(NOW(), INTERVAL -3 DAY)),
    (5, 1, 303,  DATE_ADD(NOW(), INTERVAL -45 DAY)),
    (6, 2, 500,  DATE_ADD(NOW(), INTERVAL -30 DAY)),
    (6, 2, 301,  DATE_ADD(NOW(), INTERVAL -28 DAY)),
    (7, 5, 201,  DATE_ADD(NOW(), INTERVAL -90 DAY));
    
