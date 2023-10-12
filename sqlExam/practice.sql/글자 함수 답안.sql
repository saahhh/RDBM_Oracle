
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





--테이블이 없어도 볼 수 있음
SELECT REPLACE ('Hello World!', 'Hello', 'Hi') FROM DUAL;

SELECT 'Hello' || 'World!' AS textSum FROM DUAL;

/**
    Hello World FROM DUAL
    --LOWER 문자열을 소문자로 변환
    --UPPER 문자열을 대문자로 변환
    --INITCAP 각 단어의 첫 글자를 대문자로 변환
    --SUBSTR 문자열의 (1~5)일부분 추출
    --TRIM '   Hello, World   ' 양쪽 공백 제거
    --LTRIM '   Hello, World   ' 왼쪽 공백 제거
    --RTRIM '   Hello, World   ' 오른쪽 공백 제거
    --INSTR 문자열에서 World  문자열의 위치 찾기
    --LENGTHB(여기서는 헬로우 월드! 활용)
    --LENGTH 활용하기
    --왼쪽에 문자열을 채우고 싶다 -> LPAD 활용
    SELECT LPAD('5',4,'0') FROM DUAL;
**/
SELECT 'Hello World', LOWER('Hello World') FROM DUAL;
SELECT 'Hello World', UPPER('Hello World') FROM DUAL;
SELECT 'Hello World', INITCAP('Hello World') FROM DUAL;
SELECT 'Hello World', SUBSTR('Hello World',1,5) FROM DUAL;
SELECT 'Hello World', TRIM('   Hello, World   ') FROM DUAL;
SELECT 'Hello World', LTRIM('   Hello, World   ') FROM DUAL;
SELECT 'Hello World', RTRIM('   Hello, World   ') FROM DUAL;
SELECT 'Hello World', LENGTHB('Hello World!') FROM DUAL;
SELECT 'Hello World', LENGTH('Hello World!') FROM DUAL;
SELECT LPAD('Hello World',20,'*') FROM DUAL;


--서브쿼리를 활용해서 가장 비싼책의 정보
SELECT * FROM book
WHERE price =(SELECT MAX(price) FROM book);

--윈도우 함수 RNAK 활용해서 각 장르별로 가장 비싼 두번째 책 가져오기
SELECT * FROM (
SELECT B.*,
RANK() OVER(PARTITION BY genre ORDER BY price DESC) AS rnk
FROM Book b
)
WHERE rnk = 1;

--윈도우 함수 ROW_NUMBER 활용 해서 가장 비싼책 가져오기 장르별로
SELECT * FROM (
SELECT B.*,
ROW_NUMBER() OVER(ORDER BY price DESC) AS rank
FROM Book b
)
WHERE rank = 1;

--ROW_NUMBER() OVER(~~~쿼리(=내용) 넣기);
SELECT * FROM (
        SELECT B.*,
        ROW_NUMBER() OVER(PARTITION BY genre ORDER BY price DESC) AS rn
        -- genre열을 기준으로 데이터를 분할하고
        -- price열을 기준으로 내림차순으로 정렬하여 각 분할된 그룹 내에서 순위 할당
        FROM BOOK b 
)
WHERE rn = 1;
-- rn = 행 번호가 순서 번호를 나타내는 별칭 (rn = row number)

--각 저자가 쓴 책 수가 2권 이상인 저자 찾기
SELECT * FROM (
    SELECT ROWNUM AS authors, b.*
    FROM BOOK b
    )
WHERE authors >= 2;

    
--각 장르별로 판매된 가장 비싼 책을 가져오기


--상위 5권의 책 가져오기
SELECT * FROM (
    SELECT ROWNUM AS rn, b.*
    FROM book b
    )
WHERE rn <= 5;

--각 장르별로 평균 가격과 최고 가격 가져오기
SELECT * FROM (
    SELECT genre, price, AVG(price) OVER(PARTITION BY genre) AS 
    FROM book
    )
PIVOT (
    MAX(price), AVG(avg_price)
    FOR genre IN ('Fiction', 'Historlcal Fiction, 'Short Story'
);


--'Romance' 장르의 책 중에서 제일 비싼 책 찾기

--가격대 별로 책의 판매량(CASE와 JOIN)

--(price < 10  '상대적으로 구매할 수 있는 책' 10 AND price < 20 THEN '보통 책')

--'소설' 장르의 책과 'Novel' 장르의 책 합치기 (UNION)

--상위 5권의 책 가져오기 (ROWNUM)
SELECT * FROM (
    SELECT ROWNUM AS rn, b.*
    FROM book b
    )
WHERE rn <= 5;

--책의 출판 년도와 그 해에 출판된 책 수

