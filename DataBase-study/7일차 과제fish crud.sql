USE fish_shaped_bun_shop;

INSERT INTO
users(
	first_name,
    last_name,
    email,
    password,
    address,
    contact,
    gender
)
VALUES(
	"BANANA",
    "MIKL",
    "banana123@banana.com",
    "ekfjabsgjb1l4",
    "oz-coding-school",
    "010-1234-1234",
    TRUE
);

SELECT * FROM users WHERE first_name="BANANA";

UPDATE users
SET address = "new-oz-coding-school"
WHERE id = 501;

SELECT * FROM users WHERE id=501;

INSERT INTO
sales_records(
	user_id
)
VALUE(
	501
);

SELECT * FROM sales_records;

INSERT INTO
sales_items(
	sales_record_id,
	product_id,
	quantity
)
VALUES(
	501,
    (SELECT id FROM products WHERE name="Red Bean Bun"),
    3
);

INSERT INTO
sales_items(
	sales_record_id,
	product_id,
	quantity
)
VALUES(
	501,
    (SELECT id FROM products WHERE name="Fish Bun"),
    2
);

INSERT INTO
sales_items(
	sales_record_id,
	product_id,
	quantity
)
VALUES(
	501,
    (SELECT id FROM products WHERE name="Beef Wellington Bun"),
    5
);

SELECT * FROM raw_materials;

INSERT INTO
order_records(
	user_id,
	raw_material_id,
    quantity
)
VALUES(
	501,
    109,
    150
);

INSERT INTO
order_records(
	user_id,
	raw_material_id,
    quantity
)
VALUES(
	501,
    110,
    150
);

INSERT INTO
order_records(
	user_id,
	raw_material_id,
    quantity
)
VALUES(
	501,
    111,
    150
);

SELECT * FROM order_records WHERE user_id=501;

SELECT * FROM stocks;

INSERT INTO
daily_records(
	stock_id,
    change_quantity,
    change_type
)
VALUES(
	115,
    (SELECT quantity FROm stocks WHERE id=115) + 150,
    "IN"
);

INSERT INTO
daily_records(
	stock_id,
    change_quantity,
    change_type
)
VALUES(
	111,
    (SELECT quantity FROm stocks WHERE id=111) - 10,
    "IN"
);

INSERT INTO
daily_records(
	stock_id,
    change_quantity,
    change_type
)
VALUES(
	116,
    (SELECT quantity FROm stocks WHERE id=116)- 150,
    "IN"
);

SELECT * FROM daily_records;

UPDATE stocks
SET quantity = quantity + 150
WHERE id = 115;

SELECT quantity FROM stocks WHERE id = 115;

SELECT 
    sr.id AS sales_record_id,
    sr.created_at,
    u.first_name,
    u.last_name,
    si.product_id,
    SUM(si.quantity) AS total_quantity,
    p.price
FROM 
    sales_items AS si
JOIN 
    sales_records AS sr ON si.sales_record_id = sr.id
JOIN 
    users AS u ON sr.user_id = u.id
JOIN 
    products AS p ON si.product_id = p.id
WHERE 
    u.id = 501
GROUP BY 
    si.product_id, sr.id, sr.created_at, u.first_name, u.last_name, p.price
ORDER BY 
    p.price DESC;