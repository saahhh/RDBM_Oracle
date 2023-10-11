### DDL ###
sqlplus sys/oracle as sysdba
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER khcafe IDENTIFIED BY kh1234;
GRANT CREATE SESSION TO khcafe;
GRANT CREATE ANY TABLE TO khcafe;
GRANT connect, resource, dba to khcafe;
conn khcafe/kh1234;

--카페 테이블
CREATE TABLE cafes (
    cafe_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(15),
    operating_hours VARCHAR(255)
);

--시퀀스
CREATE SEQUENCE cafe_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--트리거
CREATE OR REPLACE TRIGGER cafe_trigger
BEFORE INSERT ON cafes
FOR EACH ROW
BEGIN
  SELECT cafe_seq.NEXTVAL
  INTO :NEW.cafe_id
  FROM dual;
END;
/

--메뉴 테이블
CREATE TABLE menu (
    menu_id INT PRIMARY KEY,
    cafe_id INT,
    menu_name VARCHAR2(255) NOT NULL,
    price NUMBER(8, 2) NOT NULL,
    CONSTRAINT fk_cafe
        FOREIGN KEY (cafe_id)
        REFERENCES cafes(cafe_id)
);

-- menu 테이블에 description 열 추가
ALTER TABLE menu
ADD description VARCHAR2(500);

--orders 테이블
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    cafe_id NUMBER,
    menu_id NUMBER,
    order_date TIMESTAMP,
    quantity NUMBER,
    total_price NUMBER
);

--외래 키 제약 조건 추가

ALTER TABLE orders
ADD CONSTRAINT fk_orders_cafe
FOREIGN KEY (cafe_id)
REFERENCES cafes(cafe_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_menu
FOREIGN KEY (menu_id)
REFERENCES menu(menu_id);

-- 테이블 코멘트 추가
COMMENT ON TABLE orders IS '주문 정보를 저장하는 테이블';

-- 열 코멘트 추가
COMMENT ON COLUMN orders.order_id IS '주문을 고유하게 식별하는 번호';
COMMENT ON COLUMN orders.cafe_id IS '주문이 발생한 카페의 ID';
COMMENT ON COLUMN orders.menu_id IS '주문한 메뉴 항목의 ID';
COMMENT ON COLUMN orders.order_date IS '주문이 발생한 날짜와 시간';
COMMENT ON COLUMN orders.quantity IS '주문한 메뉴 항목의 수량';
COMMENT ON COLUMN orders.total_price IS '주문에 대한 총 금액';




DROP : 데이터베이스에서 객체(테이블, 뷰, 인덱스, 사용자 등)를 삭제하는데 사용되는 SQL 명령어
       이 명령어는 영구 삭제 되는 것이다.
       DROP TABLE 테이블이름;
       DROP VIEW 뷰이름;
       DROP INDEX 인덱스이름;
       DROP USER 사용자이름;

CASCADE : 해당 명령이 연결된 객체 또는 데이터 영향 주는 방식 지정
          주로 삭제 명령으로 사용이 되고,
          삭제 명령이 관련된 모든 객체나 데이터를 삭제
          DROP TABLE 부모테이블 CASCADE CONSTRAINTS;


cf) cmd창에서 메뉴보기
1. sqlplus sys/oracle as sysdba
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
conn khcafe/kh1234
select * from menu;

2. 
exit
sqlplus khcafe/kh1234 as sysdba;
select * from menu;
