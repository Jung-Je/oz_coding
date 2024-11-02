USE classicmodels;

-- 새 고객 추가
INSERT INTO customers (customerNumber, customerName, contactLastName, phone, country) 
VALUES (555, '효종', '유', 01022342234, 'korea');

-- 새 제품 추가
INSERT INTO products (productCode, productName, quantityInStock, buyPrice) 
VALUES ('S777', 'candy', 9999, 234.56);

-- 새 직원 추가
INSERT INTO employees (employeeNumber, lastName, firstName, jobTitle)
VALUES (2222, 'Lee', 'JungJe', 'a world ruler');

-- 새 사무실 추가
INSERT INTO offices (officeCode, city, phone, country) 
VALUES ('9999', 'Incheon', 0909886, 'korea');

-- 새 주문을 추가
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES (10426, '2024-11-02', '2024-11-08', '2024-11-05', 'Shipped', NULL, 555);

-- 주문 상세 정보를 추가
insert  into orderdetails(orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber) 
values (10426, 'S18_1749', 30,' 136.00', 3);

-- 지불 정보를 추가
insert  into payments (customerNumber, checkNumber, paymentDate, amount)
values (555, 'p3322', '2024-11-02', 6066.6);

-- 제품 라인을 추가
insert  into productlines (productLine, htmlDescription, image)
values ('Clothing', 'NULL', 'NULL');

-- 다른 지역의 고객 추가
insert  into customers (customerNumber, customerName, contactLastName, city, phone, country)
values (556, 'Lee', 'coo', 98675766, 'Busan', 'korea');

-- 다른 카테고리의 제품 추가
insert  into products (productCode, productName, productLine, productScale, quantityInStock, buyPrice)
values ('S779', 'Shark Outfit of Purity', 'Clothing','1:10', 999, 96.50);

-- 모든 고객 정보를 조회
SELECT * FROM customers;

-- 모든 제품 목록을 조회
SELECT productName FROM products;

-- 모든 직원의 이름과 직급을 조회
SELECT firstName, lastName, jobTitle FROM employees;

-- 모든 사무실의 위치를 조회
SELECT city FROM offices;

-- 최근 10개의 주문을 조회
SELECT * FROM orders ORDER BY orderDate DESC LIMIT 10;

-- 특정 주문의 모든 상세 정보
SELECT * FROM orderdetails WHERE orderNumber;

-- 고객의 모든 지불 정보를 조회
SELECT * FROM payments WHERE amount;

-- 각 제품 라인의 설명을 조회
SELECT productLine, textDescription FROM productlines;

-- 특정 지역의 고객을 조회
SELECT * FROM customers WHERE country = 'korea';

-- 특정 가격 범위의 제품을 조회
SELECT * FROM products WHERE buyPrice BETWEEN 20 AND 50;

-- 특정 고객의 주소를 갱신
UPDATE customers 
SET addressLine1 = '주소 갱신' 
WHERE customerNumber = 557;

-- 특정 제품의 가격을 갱신
UPDATE products 
SET buyPrice = 333.00
WHERE productCode = 'S779';

-- 특정 직원의 직급을 갱신
UPDATE employees
SET jobTitle = 'lord of dimensions'
WHERE employeeNumber = 2222;

-- 특정 사무실의 전화번호를 갱신
UPDATE offices
SET phone = 0102234322
WHERE officeCode = 9999;

-- 특정 주문의 상태를 갱신
UPDATE orders
SET status = 'Shipped'
WHERE orderNumber = 10179;

-- 특정 주문 상세의 수량을 갱신
UPDATE orderdetails
SET quantityOrdered = 999
WHERE productCode = 'S24_2022';

-- 특정 지불의 금액을 갱신
UPDATE payments
SET amount = 999999.99
WHERE checkNumber = 'p3322';

-- 특정 제품 라인의 설명을 갱신
UPDATE productlines
SET textDescription = '좋은 말 할때 사서 먹어라'
WHERE productLine = 'pudeu';

-- 특정 고객의 이메일을 갱신(고객은 이메일이 없음)
-- UPDATE customers
-- SET 
-- WHERE 

-- 여러 제품의 가격을 한 번에 갱신
UPDATE products
SET buyPrice = 9999
WHERE quantityInStock >= 0;

-- 특정 고객을 삭제
DELETE FROM customers WHERE customerNumber = 556;

-- 특정 제품을 삭제
DELETE FROM products WHERE productCode = 'S778';

-- 특정 직원을 삭제
DELETE FROM employees WHERE employeeNumber = 2222;

-- 특정 사무실을 삭제
DELETE FROM offices WHERE officeCode =9999;

-- 특정 주문을 삭제
DELETE FROM orders WHERE orderNumber = 555;

-- 특정 주문 상세를 삭제
DELETE FROM orderdetails WHERE orderNumber = 10205;

-- 특정 지불 내역을 삭제
DELETE FROM payments WHERE customerNumber = 555;

-- 특정 제품 라인을 삭제
DELETE FROM productlines WHERE productLine = 'pudeu';

-- 특정 지역의 모든 고객을 삭제
DELETE FROM customers WHERE city = 'korea';

-- 특정 카테고리의 모든 제품을 삭제
DELETE FROM products WHERE productLine = 'Clothing';