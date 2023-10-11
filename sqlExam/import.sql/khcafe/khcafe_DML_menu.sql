INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (1, 1, '에스프레소', 3.50, '강렬한 에스프레소 커피');
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (2, 1, '아메리카노', 4.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (3, 1, '카페라떼', 5.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (4, 1, '카페모카', 5.80);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (5, 1, '바닐라라떼', 6.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (6, 1, '연유라떼', 6.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (7, 1, '녹차라떼', 7.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (8, 1, '초코라떼', 5.60);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (9, 1, '토피넛라떼', 7.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (10, 1, '크림라떼', 8.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (11, 1, '쿨라임피지오', 15.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (12, 1, '자몽허니블랙티', 13.80);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (13, 1, '바닐라크림콜드브루', 20.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (14, 1, '바닐라더블샷', 17.80);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (15, 1, '카라멜마끼아또', 6.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (16, 1, '콜드브루', 10.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (17, 1, '콜드브루라떼', 11.00);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (18, 1, '생크림라떼', 13.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (19, 1, '그린티프라페', 20.50);
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (20, 1, '피치프라페', 25.80);




##### MENU DML #####
-- menu 1
INSERT INTO menu (menu_id, cafe_id, menu_name, price)
VALUES (1, 1, '에스프레소', 3.50);

UPDATE menu
SET description = '강렬한 에스프레소 커피 영국을 느낄 수 있음'
WHERE menu_id = 1 AND cafe_id = 1;

-- menu 2
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (2, 1, '아메리카노', 4.00, '매끈한 아메리카노 커피');

-- menu 3
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (3, 2, '카페 라떼', 4.50, '부드러운 카페 라떼');

-- menu 4
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (4, 2, '카푸치노', 4.50, '크림이 올라간 카푸치노');

-- menu 5
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (5, 3, '아이스 커피', 3.75, '시원한 아이스 커피');

-- menu 6
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (6, 3, '모카라떼', 5.00, '초콜릿 풍미의 모카라떼');

-- menu 7
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (7, 4, '핫 초코렛', 4.25, '따뜻한 핫 초콜릿');

-- menu 8
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (8, 4, '카페 아메리카노', 3.75, '매쁜한 카페 아메리카노');

-- menu 9
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (9, 5, '카페 모카', 4.50, '모카풍미의 카페 모카');

-- menu 10
INSERT INTO menu (menu_id, cafe_id, menu_name, price, description)
VALUES (10, 5, '바닐라 라떼', 4.25, '바닐라 향의 라떼');
