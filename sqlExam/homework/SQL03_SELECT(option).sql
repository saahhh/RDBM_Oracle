----------------------03 select(option)------------------------
SELECT student_name 학생이름, student_address 주소지
FROM tb_student
ORDER BY 1;

SELECT student_name, student_ssn
FROM tb_student
WHERE absence_yn = 'Y'
ORDER BY SUBSTR(student_ssn,1,6) DESC;

SELECT student_name 학생이름, student_no 학번, student_address "거주지 주소"
FROM tb_student
WHERE student_no LIKE '9%' AND student_address LIKE '경기도%' OR student_address LIKE '강원도%'
ORDER BY 1;

SELECT professor_name, professor_ssn
FROM tb_professor
WHERE department_no = (SELECT department_no FROM tb_department WHERE department_name = '법학과')
ORDER BY 2;

SELECT student_no, TO_CHAR(point, 9.99) AS POINT
FROM tb_grade
WHERE term_no = '200402' AND class_no = 'C3118100'
ORDER BY point DESC, student_no;

SELECT student_no, student_name, department_name
FROM tb_student 
JOIN tb_department USING(department_no)
ORDER BY 2;
