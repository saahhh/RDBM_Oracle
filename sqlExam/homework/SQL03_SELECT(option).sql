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


SELECT class_name, department_name
FROM tb_class
JOIN tb_department USING(department_no);

SELECT class_name, professor_name
FROM tb_class
JOIN tb_class_professor USING(class_no)
JOIN tb_professor USING(professor_no);

SELECT class_name, professor_name
FROM tb_class
JOIN tb_class_professor USING(class_no)
JOIN tb_professor p USING(professor_no)
JOIN tb_department d ON (p.department_no = d.department_no)
WHERE category = '인문사회';

--10. '음악학과' 학생들의 평점을 구하려고 한다. 음악학과 학생들의 "학번","학생이름","전체평점"을 출력하는 SQL문장을 작성하시오
--(단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)
SELECT g.student_no 학번, student_name "학생 이름", ROUND(AVG(point),1) "전체 평점"
FROM tb_grade g
JOIN tb_student s ON (g.student_no = s.student_no)
JOIN tb_department d ON(s.department_no = d.department_no)
WHERE department_name = '음악학과'
GROUP BY g.student_no, student_name
ORDER BY 1;

--11. 학번이 
SELECT department_name 학과이름, student_name 학생이름, professor_name 지도교수이름
FROM tb_student
JOIN tb_department USING(department_no)
JOIN tb_professor ON (professor_no = coach_professor_no)
WHERE student_no = 'A313047';

SELECT student_name, term_no term_name
FROM tb_student
JOIN tb_grade USING(student_no)
JOIN tb_class USING(class_no)
WHERE term_no LIKE '2007%' AND class_name = '인간관계론';

SELECT class_name, department_name
FROM tb_class
LEFT JOIN tb_class_professor USING(class_no)
LEFT JOIN tb_department USING(department_no)
WHERE category = '예체능' AND professor_no IS NULL;

SELECT student_name 학생이름, NVL(professor_name,'지도교수 미지정') 지도교수
FROM tb_student s
LEFT JOIN tb_professor ON (professor_no = coach_professor_no)
JOIN tb_department D ON (s.department_no = d.department_no)
WHERE department_name = '서반아어학과'
ORDER BY student_no;
