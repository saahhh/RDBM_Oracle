CREATE TABLE products (
    product_id NUMBER(5) PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10,2),
    stock_quantity NUMBER(5)
);

--인덱스 생성 : 제품 이름으로 검색을 최적화
CREATE INDEX idx_product_name ON products(product_name);

--인덱스 생성 : 카테고리로 검색을 최적화
CREATE INDEX idx_category ON products(category);

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES (1, '노트북', '전자제품', 899.99, 10);

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES (2, '스마트폰', '전자제품', 499.99, 20);

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES (3, '커피머신', '가전제품', 599.99, 5);

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES (4, '운동화', '신발', 79.99, 30);

--제품 이름으로 검색(인덱스 활용)
SELECT * FROM products
WHERE product_name = '노트북';

--주문 ID 주문 검색
SELECT * FROM orders WHERE order_id = 7;

--cafe_id가 6인 카페에서 주문 검색 (인덱스 활용)
SELECT * FROM orders WHERE cafe_id = 6; 
--10.00~15.00 가격 범위로 주문 검색 (인덱스 활용)
SELECT * FROM orders WHERE total_price >= 10.00 AND total_price <= 15.00;
--2023-10-11 14:00:00 ~ 2023-10-11 15:00:00 범위로 주문 검색 (인덱스 활용)
SELECT * FROM orders WHERE order_date >= TIMESTAMP '2023-10-11 14:00:00'
AND order_date < TIMESTAMP '2023-10-11 15:00:00';
