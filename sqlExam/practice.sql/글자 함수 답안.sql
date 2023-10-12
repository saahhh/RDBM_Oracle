
-- REPLACE 함수: 문자열에서 특정 문자를 다른 문자로 대체
SELECT REPLACE('Hello, World!', 'Hello', 'Hi') AS replaced_text FROM DUAL;

-- CONCAT 함수: 문자열을 연결
SELECT 'Hello ' || 'World!' AS concatenated_text FROM DUAL;

-- LOWER 함수: 문자열을 소문자로 변환
SELECT LOWER('Hello World') AS lower_text FROM DUAL;

-- UPPER 함수: 문자열을 대문자로 변환
SELECT UPPER('Hello World') AS upper_text FROM DUAL;

-- INITCAP 함수: 각 단어의 첫 글자를 대문자로 변환
SELECT INITCAP('hello world') AS initcap_text FROM DUAL;

-- SUBSTR 함수: 문자열의 일부분 추출
SELECT SUBSTR('Hello, World!', 1, 5) AS substring_text FROM DUAL;

-- TRIM 함수: 문자열의 양쪽 공백 제거
SELECT TRIM(' ' FROM '   Hello, World!   ') AS trimmed_text FROM DUAL;

-- LTRIM 함수: 문자열의 왼쪽 공백 제거
SELECT LTRIM('   Hello, World!   ') AS left_trimmed_text FROM DUAL;

-- RTRIM 함수: 문자열의 오른쪽 공백 제거
SELECT RTRIM('   Hello, World!   ') AS right_trimmed_text FROM DUAL;

-- INSTR 함수: 문자열에서 특정 문자열의 위치 찾기
SELECT INSTR('Hello, World!', 'World') AS position FROM DUAL;

-- LENGTHB 함수: 문자열의 바이트 수 구하기
SELECT LENGTHB('헬로우 월드!') AS byte_length FROM DUAL;

-- LENGTH 함수: 문자열의 문자 수 구하기
SELECT LENGTH('Hello, World!') AS char_length FROM DUAL;

-- LPAD 함수: 문자열을 왼쪽으로 패딩
SELECT LPAD('5', 4, '0') AS left_padded_text FROM DUAL;

-- RPAD 함수: 문자열을 오른쪽으로 패딩
SELECT RPAD('5', 4, '0') AS right_padded_text FROM DUAL;





/****** 함수 *******/

--문자열에서 특정 문자 또는 문자열을 다른 문자열로 대체
SELECT REPLACE (description, '풍미', '맛') FROM menu;

SELECT product_name, REPLACE(product_name, '스마트', '똑똑한')
FROM products;

--CONCAT 두 문자열을 결합
SELECT product_name || '가격 : $' || TO_CHAR(price, '999.99')
FROM products;

--SUBSTR (SubString) 문자열의 일부를 추출
SELECT product_name, SUBSTR(product_name,1,3)
FROM products;


INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES (5, '후드 집업', '의류', 20.99, 33);

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES (6, '원 피 스', '의류', 10.99, 2);

--공백 제거
--TRIM, LTRIM, RTRIM 문자열에서 ' '안의 내용을 제거하는데 사용
--TRIM : 양쪽 끝에 있는 ' '(=공백)을 제거
--LTRIM : 문자열에서 왼쪽(시작부분)의 ' '(=공백)을 제거
--RTRIM : 문자열 오른쪽(끝부분)의 ' '(=공백)을 제거
SELECT product_name, TRIM(' '), LTRIM(product_name, '노트'),
        RTRIM(product_name, '폰')
FROM products;

SELECT LTRIM(product_name)
FROM products;

SELECT LTRIM(category, '제품') FROM products; --LTRIM이라 아무런 변화 없음

SELECT LTRIM(category, '전자') FROM products;
--전자제품에서 제품을 제거하고 출력 SELECT와 RTRIM을 활용
SELECT RTRIM(category, '제품') FROM products;

--INSTR 문자열에서 특정 문자 위치 찾기
SELECT product_name, INSTR(category, '품') --카테고리 전자제품에서 품의 위치
FROM products;

--LENGTHB, LENGTH : 바이트 문자열 길이, 문자열 단위로 문자열 길이
SELECT product_name, LENGTHB(product_name), LENGTH(product_name)
FROM products;

--가장 긴 제품 이름 찾기
SELECT product_name 
FROM products 
WHERE LENGTH(product_name) = (SELECT MAX(LENGTH(product_name)) FROM products);

--제품 가격 반올림 (round)
SELECT price, ROUND(price) FROM products;

--제품 이름에 폰이 들어가는 제품 찾기 (INSTR활용)
SELECT product_name 
FROM products
WHERE INSTR(product_name, '폰') >0;
