SELECT department_name, category FROM tb_department;
--정답
SELECT department_name "학과명", category 계열
FROM tb_department;

SELECT department_name || '의 정원은 ' || capacity ||'명 입니다.' "학과별 정원" FROM tb_department;

--CONCAT 두 문자열을 결합
SELECT product_name || '가격 : $' || TO_CHAR(price, '999.99')
FROM products;


SELECT student_name
FROM tb_student
WHERE substr(student_ssn, 8, 1) = 2
    AND absence_yn = 'Y'
    AND department_no = (SELECT department_no FROM tb_department WHERE department_name = '국어국문학과');

--SUBSTR (SubString) 문자열의 일부를 추출
SELECT product_name, SUBSTR(product_name,1,3)
FROM products;

SELECT student_name
FROM tb_student
WHERE student_no IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY 1 DESC;

SELECT department_name, category 
FROM tb_department
WHERE capacity >= 20 AND capacity <= 30;
--정답 
SELECT department_name, category 
FROM tb_department
WHERE capacity BETWEEN 20 AND 30;

SELECT professor_name
FROM tb_professor
WHERE department_no IS null;

SELECT student_name
FROM tb_student
WHERE department_no IS null;

SELECT preattending_class_no
FROM tb_class
WHERE preattending_class_no IS NOT NULL;

SELECT DISTINCT category
FROM tb_department 
ORDER BY 1;
--DISTINCT 데이터의 중복제거 명령어

SELECT student_no, student_name, student_ssn
FROM tb_student
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) = 2002
    AND absence_yn = 'N'
    AND instr(student_address, '전주') >0;
