SELECT student_no "학번", student_name "이름", TO_CHAR(entrance_date,'YYYY-MM-DD') "입학년도"
FROM tb_student
WHERE department_no = 002 ORDER BY 입학년도;

SELECT professor_name, professor_ssn
FROM tb_professor
WHERE LENGTH(professor_name) != 3;
--WHERE LENGTH(professor_name) NOT LIKE '___'; --전체출력
--WHERE LENGTH(professor_name) <= 2 OR LENGTH(professor_name) >= 4; 

SELECT professor_name "교수이름", EXTRACT(YEAR FROM SYSDATE) - (19 || SUBSTR(professor_ssn,1,2)) "나이"
FROM tb_professor
WHERE SUBSTR(professor_ssn,8,1) = 1 
ORDER BY 나이;

--현재 연도 구하기
EXTRACT(YEAR FROM SYSDATE);
--교수이름, 나이 출력
SELECT professor_name AS "교수이름", EXTRACT(YEAR FROM SYSDATE) - (19 || SUBSTR(professor_ssn,1,2)) "나이"
FROM tb_professor; 

SELECT SUBSTR(professor_name,2) 이름
FROM tb_professor;

SELECT student_no, student_name
FROM tb_student
WHERE EXTRACT(YEAR FROM entrance_date) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(student_ssn, 1, 6))) > 19;

SELECT TO_CHAR(TO_DATE('20201225'), 'DAY')
FROM DUAL;

SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'YYYY-MM-DD'), TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'YYYY'),
        TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'YYYY'), TO_CHAR(TO_DATE('49/10/11','RR-MM-DD'),'YYYY')
FROM DUAL;

SELECT student_no, student_name
FROM tb_student
WHERE student_no LIKE '9%';

SELECT ROUND(AVG(point),1) AS 평점
FROM tb_grade
WHERE student_no = 'A517178';

SELECT department_no, COUNT(*)
FROM tb_student
GROUP BY department_no
ORDER BY 1;

SELECT COUNT(*)
FROM tb_student
WHERE coach_professor_no IS NULL;

SELECT SUBSTR(term_no,1,4) 년도, ROUND(AVG(point),1) "년도 별 평점"
FROM tb_grade
WHERE student_no = 'A112113'
GROUP BY SUBSTR(term_no,1,4)
ORDER BY 1;

SELECT department_no "학과코드명", COUNT(DECODE(absence_yn,'Y',1)) "휴학생 수"
FROM tb_student
GROUP BY department_no
ORDER BY 1;

SELECT student_name 동일이름, COUNT(*) "동명인 수"
FROM tb_student
GROUP BY student_name
HAVING COUNT(*) > 1
ORDER BY 1;

SELECT SUBSTR(term_no,1,4) 년도, SUBSTR(term_no,5,2) 학기, ROUND(AVG(point),1) "평점"
FROM tb_grade
WHERE student_no = 'A112113'
GROUP BY ROLLUP(SUBSTR(term_no,1,4), SUBSTR(term_no,5,2))
ORDER BY 1;

/*ROLLUP : 소계, 합계를 자동으로 뽑을 때 사용하는데
GROUP BY 후 기준으로 사용할 컬럼을 
ROLLUP(컬럼)으로 묶어주는 식으로 쓰인다*/
