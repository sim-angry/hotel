--1. 호텔 회원테이블 생성
CREATE TABLE "MUSTHAVE"."HOTEL_MEMBER_TBL_02" 
   (   "CUSTNO" NUMBER(6,0) PRIMARY KEY, 
   "CUSTID" VARCHAR2(20 BYTE), 
   "CUSTPW" VARCHAR2(30 BYTE), 
   "CUSTNAME" VARCHAR2(20 BYTE), 
   "PHONE" VARCHAR2(13 BYTE), 
   "ADDRESS" VARCHAR2(60 BYTE), 
   "JOINDATE" DATE DEFAULT sysdate, 
   "GRADE" CHAR(1 BYTE));
   
--2. 호텔예약테이블 생성   
CREATE TABLE "MUSTHAVE"."HOTEL_RESERVATION_TBL_02" 
   ("RESEGB" CHAR(02),
   "CUSTNO" NUMBER(6,0), 
   "RESENO" VARCHAR2(22 BYTE), 
   "IN_DATE" DATE DEFAULT sysdate, 
   "OUT_DATE" DATE DEFAULT sysdate, 
   "AREA_CODE" CHAR(2 BYTE), 
   "KIND_CODE" CHAR(2 BYTE), 
   "PRICE" NUMBER(10,0), 
   "CANYN" CHAR(1 BYTE) DEFAULT 'N' NOT NULL ENABLE, 
    CONSTRAINT "HOTEL_RESERVATION_TBL_02_PK" PRIMARY KEY ("RESEGB","CUSTNO", "RESENO"))
;   

--3. 호텔 문의테이블 생성
 CREATE TABLE HOTEL_BOARD_TBL_02(
NUM NUMBER PRIMARY KEY,
TITLE VARCHAR2(200) NOT NULL, 
CONTENT VARCHAR2(2000) NOT NULL,
CUSTNO NUMBER(6,0) NOT NULL, 
POSTDATE DATE DEFAULT SYSDATE NOT NULL,
VISITCOUNT NUMBER(6,0),
type char(02) NOT NULL
);

select * from HOTEL_BOARD_TBL_02;
ALTER TABLE HOTEL_BOARD_TBL_02 ADD CONSTRAINT HOTEL_BOARD_TBL_02_FK FOREIGN KEY (CUSTNO) REFERENCES HOTEL_MEMBER_TBL_02(CUSTNO);

--4. 단가테이블 생성
CREATE TABLE HOTEL_UnitPricInfo_TBL_02(
reser_type char(02) not null,  --(01)호텔 (02)렌터카
reser_area char(02) not null,
reser_kind char(02) not null,
reser_area_name varchar2(100) not null,
reser_kind_name varchar2(100) not null,
unitprice number(8,0) not null,
CONSTRAINT HOTEL_UnitPricInfo_TBL_02_PK PRIMARY KEY (reser_type, reser_area, reser_kind));

--호텔 insert문
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','01','01','홀리데이인 광주호텔','1인실',300000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','01','02','홀리데이인 광주호텔','2인실',350000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','02','01','롯데호텔 부산','1인실',300000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','02','02','롯데호텔 부산','2인실',350000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','03','01','호텔인터불고 대구','1인실',200000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','03','02','호텔인터불고 대구','2인실',250000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','04','01','롯데시티호텔 대전','1인실',250000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','04','02','롯데시티호텔 대전','2인실',300000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','05','01','신라스테이 천안','1인실',300000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','05','02','신라스테이 천안','2인실',350000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','06','01','롯데호텔 울산','1인실',100000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','06','02','롯데호텔 울산','2인실',150000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','07','01','강릉 씨마크호텔','1인실',550000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','07','02','강릉 씨마크호텔','2인실',600000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','08','01','제주신라호텔','1인실',600000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('01','08','02','제주신라호텔','2인실',650000);


--렌터카 insert문
insert into HOTEL_UnitPricInfo_TBL_02 values ('02','00','01','전국','아반테',60000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('02','00','02','전국','소나타',80000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('02','00','03','전국','그렌져',100000);
insert into HOTEL_UnitPricInfo_TBL_02 values ('02','00','04','전국','산타페',90000);

--5. 결제테이블 생성
CREATE TABLE HOTEL_payment_TBL_02 (
   RESEGB CHAR(2),
   CUSTNO NUMBER(6,0), 
   RESENO VARCHAR2(22 BYTE),
   PAYMENTNO VARCHAR2(22 BYTE),
   PAYMENT_DATE DATE DEFAULT SYSDATE, 
   PRICE NUMBER(10,0),
   PAYMENT_PRICE NUMBER(10,0),
   CONSTRAINT "HOTEL_payment_TBL_02_PK" PRIMARY KEY (RESEGB, CUSTNO, RESENO, PAYMENTNO)
);

commit;

--6. 할인테이블 생성
create table HOTEL_sale_TBL_02 (
RESEGB CHAR(02) not null,
start_date date default sysdate,
end_date date default sysdate,
discount_type char(02), 
discount_rate number(3,0),
CONSTRAINT "HOTEL_sale_TBL_02_PK" PRIMARY KEY (RESEGB, start_date, end_date, discount_type)
);

-- 국내호텔(할인) insert문
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '06', 20); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '01', 20); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '05', 20);
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '02', 10); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '03', 10); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '04', 10);
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '07', 10); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('01', '2024-10-01', '2030-12-31', '08', 10); 

-- 렌터카(할인) insert문
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('02','2024-10-01', '2030-12-31', '02', 30); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('02','2024-10-01', '2030-12-31', '01', 10); 
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('02', '2024-10-01', '2030-12-31', '03', 20);
INSERT INTO HOTEL_sale_TBL_02 (RESEGB, start_date, end_date, discount_type, discount_rate) VALUES ('02', '2024-10-01', '2030-12-31', '04', 20);
     
commit;