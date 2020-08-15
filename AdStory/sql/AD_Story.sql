--======================================
-- 일단 관리자계정으로 접속하세요
--======================================
--ADSTORY계정 생성 
--CREATE USER adstory 
--IDENTIFIED BY adstory 
--DEFAULT TABLESPACE USERS;

--권한부여
--GRANT CONNECT, RESOURCE TO adstory;

--======================================
-- ADSTORY 계정 에서 테이블 생성하세요
--======================================
-- 테이블 생성
CREATE TABLE "MEMBER" (
	"KEY"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(15)		NOT NULL,
	"PASSWORD"	VARCHAR2(300)		NOT NULL,
	"MEMBER_ROLE"	CHAR(1)	DEFAULT 'U'	NOT NULL,
	"POINT"	NUMBER	DEFAULT 0	NOT NULL,
	"PHONE_NUM"	CHAR(11)		NOT NULL,
	"ACCOUNT_NAME"	VARCHAR2(20)		NOT NULL,
	"ACCOUNT_NUM"	CHAR(30)		NOT NULL,
	"BUSINESS_NUM"	CHAR(10)		NULL,
	"NAME"	VARCHAR2(30)		NOT NULL,
	"EMAIL"	VARCHAR2(100)		NOT NULL,
	"ADDRESS"	VARCHAR2(300)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "AD_POST_CATEG" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(30)		NOT NULL
);

CREATE TABLE "AD_POST" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NOT NULL,
	"CONTENT"	VARCHAR2(2000)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL,
	"CLICK_PRICE"	NUMBER		NOT NULL,
	"POINT"	NUMBER		NOT NULL,
	"URL"	VARCHAR2(100)		NOT NULL,
	"ORIGINAL_FILE_NAME"	VARCHAR2(200)		NULL,
	"RENAMED_FILE_NAME"	VARCHAR2(200)		NULL,
	"APPLY_NUM"	NUMBER	DEFAULT 0	NOT NULL,
	"MAIN_IMAGE"	VARCHAR2(200)		NULL
);

CREATE TABLE "PNT_EX_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"WITHDRAW"	NUMBER		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL,
	"APPLY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REQUIREMENTS"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "WISH_LIST" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"C_USER_KEY"	NUMBER		NOT NULL
);

CREATE TABLE "ENQUIRY" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"ENQUIRY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CONTENT"	VARCHAR2(2000)		NOT NULL,
	"ANSWER"	VARCHAR2(2000)		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL
);

CREATE TABLE "M_POST" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_KEY"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(50)		NULL,
	"CONTENT"	VARCHAR2(2000)		NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "M_POST_CATEG" (
	"KEY"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "AD_LIST" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"POST_KEY"	NUMBER		NOT NULL,
	"REVENUE"	NUMBER	DEFAULT 0	NOT NULL
);

CREATE TABLE "IP_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"AD_LIST_KEY"	NUMBER		NOT NULL,
	"IP"	VARCHAR2(30)		NOT NULL
);

CREATE TABLE "PNT_LOG" (
	"KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"POST_KEY"	NUMBER		NULL,
	"LOG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"POINT"	NUMBER		NOT NULL,
	"STATUS"	CHAR(1)		NOT NULL,
	"REMAIN_POINT"	NUMBER		NOT NULL
);

CREATE TABLE "AD_POST_COMM" (
	"KEY"	NUMBER		NOT NULL,
	"POST_KEY"	NUMBER		NOT NULL,
	"USER_KEY"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(2000)		NOT NULL,
	"DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"LEVEL"	NUMBER	DEFAULT 1	NOT NULL,
	"COMMENT_REF"	NUMBER		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'F'	NOT NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST_CATEG" ADD CONSTRAINT "PK_AD_POST_CATEG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST" ADD CONSTRAINT "PK_AD_POST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "PNT_EX_LOG" ADD CONSTRAINT "PK_PNT_EX_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "WISH_LIST" ADD CONSTRAINT "PK_WISH_LIST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "ENQUIRY" ADD CONSTRAINT "PK_ENQUIRY" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "M_POST" ADD CONSTRAINT "PK_M_POST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "M_POST_CATEG" ADD CONSTRAINT "PK_M_POST_CATEG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_LIST" ADD CONSTRAINT "PK_AD_LIST" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "IP_LOG" ADD CONSTRAINT "PK_IP_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "PNT_LOG" ADD CONSTRAINT "PK_PNT_LOG" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST_COMM" ADD CONSTRAINT "PK_AD_POST_COMM" PRIMARY KEY (
	"KEY"
);

ALTER TABLE "AD_POST" ADD CONSTRAINT "FK_AD_POST_CATEG_TO_AD_POST_1" FOREIGN KEY (
	"CATEGORY_KEY"
)
REFERENCES "AD_POST_CATEG" (
	"KEY"
);

ALTER TABLE "AD_POST" ADD CONSTRAINT "FK_MEMBER_TO_AD_POST_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "PNT_EX_LOG" ADD CONSTRAINT "FK_MEMBER_TO_PNT_EX_LOG_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "WISH_LIST" ADD CONSTRAINT "FK_MEMBER_TO_WISH_LIST_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "ENQUIRY" ADD CONSTRAINT "FK_MEMBER_TO_ENQUIRY_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "M_POST" ADD CONSTRAINT "FK_M_POST_CATEG_TO_M_POST_1" FOREIGN KEY (
	"CATEGORY_KEY"
)
REFERENCES "M_POST_CATEG" (
	"KEY"
);

ALTER TABLE "AD_LIST" ADD CONSTRAINT "FK_MEMBER_TO_AD_LIST_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "AD_LIST" ADD CONSTRAINT "FK_AD_POST_TO_AD_LIST_1" FOREIGN KEY (
	"POST_KEY"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "IP_LOG" ADD CONSTRAINT "FK_AD_LIST_TO_IP_LOG_1" FOREIGN KEY (
	"AD_LIST_KEY"
)
REFERENCES "AD_LIST" (
	"KEY"
);

ALTER TABLE "PNT_LOG" ADD CONSTRAINT "FK_MEMBER_TO_PNT_LOG_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);

ALTER TABLE "PNT_LOG" ADD CONSTRAINT "FK_AD_POST_TO_PNT_LOG_1" FOREIGN KEY (
	"POST_KEY"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "AD_POST_COMM" ADD CONSTRAINT "FK_AD_POST_TO_AD_POST_COMM_1" FOREIGN KEY (
	"POST_KEY"
)
REFERENCES "AD_POST" (
	"KEY"
);

ALTER TABLE "AD_POST_COMM" ADD CONSTRAINT "FK_MEMBER_TO_AD_POST_COMM_1" FOREIGN KEY (
	"USER_KEY"
)
REFERENCES "MEMBER" (
	"KEY"
);











ALTER TABLE "MEMBER" ADD CONSTRAINT "CK_MEMBER_ROLE" CHECK (MEMBER_ROLE IN ('A', 'U', 'C'));

ALTER TABLE "MEMBER" ADD CONSTRAINT "UQ_MEMBER_ID" UNIQUE (MEMBER_ID);

ALTER TABLE "PNT_LOG" ADD CONSTRAINT "CK_STATUS" CHECK (STATUS IN ('I', 'O', 'E', 'C', 'A'));

--====================================
-- SEQUENCE 생성
--====================================
-- 모든 테이블의 기본키 SEQUENCE 
-- SEQUENCE, SEQ_테이블명 으로 통일한 것으로 사용


--시퀀스 일괄 삭제
DROP SEQUENCE SEQ_AD_POST;
DROP SEQUENCE SEQ_AD_POST_CATEG;
DROP SEQUENCE SEQ_AD_POST_COMM;
DROP SEQUENCE SEQ_FIXED_URL;
DROP SEQUENCE SEQ_IP_LOG;
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_M_POST;
DROP SEQUENCE SEQ_M_POST_CATEG;
DROP SEQUENCE SEQ_PNT_EX_LOG;
DROP SEQUENCE SEQ_PNT_LOG;
DROP SEQUENCE SEQ_ENQUIRY;
DROP SEQUENCE SEQ_WISH_LIST;
DROP SEQUENCE SEQ_AD_LIST;

--시퀀스 일괄 생성
CREATE SEQUENCE SEQ_MEMBER;
CREATE SEQUENCE SEQ_AD_POST_CATEG;
CREATE SEQUENCE SEQ_AD_POST;
CREATE SEQUENCE SEQ_PNT_EX_LOG;
CREATE SEQUENCE SEQ_WISH_LIST;
CREATE SEQUENCE SEQ_ENQUIRY;
CREATE SEQUENCE SEQ_M_POST;
CREATE SEQUENCE SEQ_M_POST_CATEG;
CREATE SEQUENCE SEQ_AD_LIST;
CREATE SEQUENCE SEQ_IP_LOG;
CREATE SEQUENCE SEQ_PNT_LOG;
CREATE SEQUENCE SEQ_AD_POST_COMM;

--시퀀스 일괄 조회
SELECT * FROM USER_SEQUENCES;


-- ======================================
--  회원 추가
-- ======================================
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'kimdh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','A',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김관리자','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'honggd','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'홍지디','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'sinsa','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','C',1000000,'01000000000','신한은행','123-123-123123',NULL,'신사','kimdh@naver.com','서울시 강남',DEFAULT );

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test1','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트1','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test2','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트2','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test3','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트3','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test4','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트4','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test5','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트5','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test6','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트6','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test7','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트7','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test8','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트8','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test9','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트9','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test10','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트10','kimdh@naver.com','서울시 강남',DEFAULT );
INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'test11','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김테스트11','kimdh@naver.com','서울시 강남',DEFAULT );

INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'blank','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','U',DEFAULT,'01000000000','신한은행','123-123-123123',NULL,'김블랭','kimdh@naver.com','서울시 강남',DEFAULT );

--DELETE FROM MEMBER WHERE MEMBER_ID = 'sinsa';

SELECT*FROM MEMBER;

-- ======================================
--  게시글 카테고리 추가
-- ======================================
INSERT INTO AD_POST_CATEG VALUES(SEQ_AD_POST_CATEG.NEXTVAL, '식품');
INSERT INTO AD_POST_CATEG VALUES(SEQ_AD_POST_CATEG.NEXTVAL, '교육');


SELECT * FROM AD_POST_CATEG;

-- ======================================
--  게시글 추가
-- ======================================

INSERT INTO AD_POST VALUES (SEQ_AD_POST.NEXTVAL, 1, 1, '오렌지 상품 홍보','오렌지 어쩌구저쩌구 ㅁㄴㅇㄹ',SYSDATE, DEFAULT, 500, 1000000, 'https://kr.sunkist.com/', NULL, NULL, DEFAULT, 'test_img.jpg');
INSERT INTO AD_POST VALUES (SEQ_AD_POST.NEXTVAL, 2, 2, '강아지 훈련 사이트','강아지 훈련 잘해요 저희사이트 좋아요',SYSDATE, DEFAULT, 300, 2000000, 'https://www.bodeum.co.kr/html/edu_movie/', NULL, NULL, DEFAULT, 'puppy.png');
INSERT INTO AD_POST VALUES (SEQ_AD_POST.NEXTVAL, 2, 2, 'KH정보교육원','공부 잘되는곳임',SYSDATE, DEFAULT, 400, 3000000, 'https://www.iei.or.kr/main/main.kh', NULL, NULL, DEFAULT, 'kh.png');
INSERT INTO AD_POST VALUES (SEQ_AD_POST.NEXTVAL, 2, 2, '테스트','테스트',SYSDATE, DEFAULT, 123, 44000, '#', NULL, NULL, DEFAULT, NULL);



SELECT * FROM AD_POST;

DELETE FROM AD_POST ;

--================
-- 포인트 로그 추가
--================

INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 1, NULL, SYSDATE, 10000, 'A', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 1, 1, SYSDATE, 200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 2, 1, SYSDATE, -400, 'O', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 3, 1, SYSDATE, 400, 'E', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 2, 1, SYSDATE, 400, 'I', 0);

INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 4, 1, SYSDATE, 1200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 5, 1, SYSDATE, 2200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 6, 1, SYSDATE, 3200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 7, 1, SYSDATE, 4200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 8, 1, SYSDATE, 5200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 9, 1, SYSDATE, 6200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 10, 1, SYSDATE, 7200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 11, 1, SYSDATE, 8200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 12, 1, SYSDATE, 9200, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 13, 1, SYSDATE, 222, 'C', 0);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, 14, 1, SYSDATE, 11, 'C', 0);


SELECT * FROM PNT_LOG;









--========================= 
-- 필요한 애들
--=========================

--모든 행의 비밀번호를 암호화 처리 (1234)
--update member 
--set password = '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==';
--commit;

COMMIT;
--COMMIT 꼭하자 ㅠ


--테이블 싹다 초기화 (결과 긁어서 실행)
--1. 일단 조회
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';

--2. 일괄삭제
DROP TABLE AD_POST_CATEG CASCADE CONSTRAINTS;
DROP TABLE AD_POST CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE PNT_EX_LOG CASCADE CONSTRAINTS;
DROP TABLE WISH_LIST CASCADE CONSTRAINTS;
DROP TABLE ENQUIRY CASCADE CONSTRAINTS;
DROP TABLE M_POST CASCADE CONSTRAINTS;
DROP TABLE M_POST_CATEG CASCADE CONSTRAINTS;
DROP TABLE FIXED_URL CASCADE CONSTRAINTS;
DROP TABLE IP_LOG CASCADE CONSTRAINTS;
DROP TABLE PNT_LOG CASCADE CONSTRAINTS;
DROP TABLE AD_POST_COMM CASCADE CONSTRAINTS;
DROP TABLE AD_LIST CASCADE CONSTRAINTS;

--테이블 조회
SELECT * FROM ALL_OBJECTS WHERE OBJECT_TYPE = 'TABLE';
SELECT * FROM tabs;

--=================================
-- 시퀀스 일괄 삭제
--=================================
--Begin
--for c in (SELECT * FROM all_sequences WHERE SEQUENCE_OWNER='ADSTORY') loop
--  execute immediate 'drop SEQUENCE '||c.sequence_name;
--end loop;
--End;





--====================================================================================================================================================== 
-- 연습장
--======================================================================================================================================================
select * from ( select rownum as rnum, v.* from( select * from board order by date desc) v ) v where rnum between ? and ?;


SELECT * FROM AD_POST WHERE KEY = 2;

SELECT * 
FROM ( 
    select rownum as rnum, 
        v.* from( 
            select * 
            from AD_POST 
            order by ENROLL_DATE desc
            ) v 
        ) v 
where rnum between 1 and 12;


select count(*) as "cnt" from AD_POST;


UPDATE MEMBER SET POINT = POINT +(3000) WHERE MEMBER_ID = 'sinsa';

SELECT * FROM MEMBER;



SELECT *
FROM (
SELECT P.*,
              C.CATEGORY_NAME
FROM(
SELECT P.*,
              M.NAME 
FROM AD_POST P
LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY)P
LEFT OUTER JOIN AD_POST_CATEG C ON P.CATEGORY_KEY = C.KEY)
WHERE KEY = 1;

--SELECT * FROM ( SELECT P.*, C.CATEGORY_NAME FROM( SELECT P.*, M.NAME FROM AD_POST P LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY)P LEFT OUTER JOIN AD_POST_CATEG C ON P.CATEGORY_KEY = C.KEY) WHERE KEY = ?

select * 
    from ( select rownum as rnum, v.* 
            from( SELECT * FROM ( SELECT P.*, C.CATEGORY_NAME FROM( SELECT P.*, M.NAME FROM AD_POST P LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY)P LEFT OUTER JOIN AD_POST_CATEG C ON P.CATEGORY_KEY = C.KEY) 
                        order by ENROLL_DATE desc
                        ) v 
            ) v 
where rnum between 1 and 10;

--select * from ( select rownum as rnum, v.* from( SELECT * FROM ( SELECT P.*, C.CATEGORY_NAME FROM( SELECT P.*, M.NAME FROM AD_POST P LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY)P LEFT OUTER JOIN AD_POST_CATEG C ON P.CATEGORY_KEY = C.KEY) order by ENROLL_DATE desc) v ) v where rnum between ? and ?


-- 일단 로그 + 로그에 해당하는 제목 + 멤버 ID 까지 전체 조회 (관리자 시점 로그 전체조회)
SELECT L.*,
              M.MEMBER_ID
        FROM(SELECT P.*,A.TITLE
                    FROM PNT_LOG P
                    LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L
        LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY;


--==============
-- 랭킹으로 가보자
--==============
-- 일단 오늘날짜 목록
SELECT V.MEMBER_ID, POINT, LOG_DATE
FROM(SELECT L.*,
              M.MEMBER_ID
        FROM(SELECT P.*,A.TITLE
                    FROM PNT_LOG P
                    LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L
        LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY) V
WHERE STATUS='C' AND TO_CHAR(LOG_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD');

-- 합산 랭크 
SELECT V.MEMBER_ID, SUM(POINT)
FROM(SELECT L.*,
              M.MEMBER_ID
        FROM(SELECT P.*,A.TITLE
                    FROM PNT_LOG P
                    LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L
        LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY) V
WHERE (STATUS='C' AND TO_CHAR(LOG_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD'))
GROUP BY (MEMBER_ID)
ORDER BY 2 DESC;

-- 10위까지 자르기
SELECT *
FROM(SELECT V.MEMBER_ID, SUM(POINT)"SUM_POINT"
FROM(SELECT L.*,
              M.MEMBER_ID
        FROM(SELECT P.*,A.TITLE
                    FROM PNT_LOG P
                    LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L
        LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY) V
WHERE (STATUS='C' AND TO_CHAR(LOG_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD'))
GROUP BY (MEMBER_ID)
ORDER BY 2 DESC)
WHERE ROWNUM <= 10;

--SELECT * FROM(SELECT V.MEMBER_ID, SUM(POINT)"SUM_POINT" FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY) V WHERE (STATUS='C' AND TO_CHAR(LOG_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')) GROUP BY (MEMBER_ID) ORDER BY 2 DESC) WHERE ROWNUM <= 10;









--로그 리스트 뷰로 뒤집기
SELECT * FROM(SELECT ROWNUM AS RNUM, V.*
                            FROM(SELECT L.*,
                                                      M.MEMBER_ID
                                         FROM(SELECT P.*,A.TITLE
                                                      FROM PNT_LOG P
                                                      LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L
                                         LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY
                                        ORDER BY L.KEY DESC)V
                                        )V
WHERE RNUM BETWEEN 1 AND 10;                 

-- SELECT * FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V WHERE RNUM BETWEEN ? AND ?

-- 시간표시 컬럼 추가

SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME"
FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V 
WHERE RNUM BETWEEN 1 AND 10;

-- SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME" FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V WHERE RNUM BETWEEN ? AND ?


--SELECT COUNT(*) "cnt" FROM PNT_LOG



SELECT TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') FROM PNT_LOG;



INSERT INTO PNT_LOG VALUES(
    SEQ_PNT_LOG.NEXTVAL, 
    2, 
    1, 
    SYSDATE, 
    400, 
    'I', 
    2200);

INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, (SELECT KEY FROM MEMBER WHERE MEMBER_ID ='sinsa'), NULL, SYSDATE, 10000, 'A', 10000);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, (SELECT KEY FROM MEMBER WHERE MEMBER_ID ='sinsa'), 1, SYSDATE, 7777, 'C', 10000);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, (SELECT KEY FROM MEMBER WHERE MEMBER_ID ='honggd'), 1, SYSDATE, 10000, 'C', 10000);
INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, (SELECT KEY FROM MEMBER WHERE MEMBER_ID ='kimdh'), 1, SYSDATE, 1231, 'C', 10000);
SELECT * FROM PNT_LOG;
SELECT * FROM MEMBER WHERE MEMBER_ID ='sinsa';

--INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, (SELECT KEY FROM MEMBER WHERE MEMBER_ID ='?'), NULL, SYSDATE, ?, 'A', (SELECT POINT FROM MEMBER WHERE MEMBER_ID ='?')+(?))

SELECT KEY FROM MEMBER WHERE MEMBER_ID ='kimdh';

SELECT POINT FROM MEMBER WHERE MEMBER_ID ='kimdh';

INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, (SELECT KEY FROM MEMBER WHERE MEMBER_ID = ?), NULL, SYSDATE, ?, 'A', (SELECT POINT FROM MEMBER WHERE MEMBER_ID = ?));

SELECT * FROM  PNT_LOG;

SELECT * FROM(SELECT V.MEMBER_ID, SUM(POINT)"SUM_POINT" FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY) V WHERE (STATUS='C' AND TO_CHAR(LOG_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')) GROUP BY (MEMBER_ID) ORDER BY 2 DESC) 
WHERE ROWNUM <= 10;

SELECT * FROM(SELECT V.MEMBER_ID, SUM(POINT)"SUM_POINT" FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY) V WHERE (STATUS='C' AND TO_CHAR(LOG_DATE, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')) GROUP BY (MEMBER_ID) ORDER BY 2 DESC) WHERE ROWNUM <= 10;




SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME" FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V WHERE RNUM BETWEEN 1 AND 100;

-- SELECT * FROM(SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME" FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V WHERE MEMBER_ID = ?)WHERE RNUM BETWEEN ? AND ?
SELECT COUNT(*) "cnt" FROM PNT_LOG;
SELECT COUNT(*) "cnt" FROM PNT_LOG WHERE MEMBER_ID = 'sinsa';
SELECT COUNT(*) "cnt" FROM
(SELECT * FROM PNT_LOG WHERE MEMBER_ID = 'sinsa');

--SELECT COUNT(*) "cnt" FROM(SELECT * FROM(SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME" FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V) WHERE MEMBER_ID = ?)


--SELECT * FROM(SELECT ROWNUM AS RNUM ,V.* FROM( SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME" FROM(SELECT V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V WHERE MEMBER_ID = ?)V) WHERE RNUM BETWEEN ? AND ?



SELECT V.*,TO_CHAR(LOG_DATE,'YYYY-MM-DD HH24:Mi:SS') AS "LOG_DATE_TIME" FROM(SELECT ROWNUM AS RNUM, V.* FROM(SELECT L.*, M.MEMBER_ID FROM(SELECT P.*,A.TITLE FROM PNT_LOG P LEFT OUTER JOIN AD_POST A ON P.POST_KEY = A.KEY)L LEFT OUTER JOIN MEMBER M ON L.USER_KEY = M.KEY ORDER BY L.KEY DESC)V )V WHERE RNUM BETWEEN 1 AND 10;

-- 광고 신청 목록
SELECT * FROM(
SELECT ROWNUM AS RNUM, V.*
FROM(SELECT V.*, M.NAME
FROM(SELECT V.* ,P.TITLE,P.STATUS,P.USER_KEY "POST_USER_KEY",P.POINT
FROM(SELECT P.*,M.MEMBER_ID
FROM AD_LIST P
LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY
WHERE MEMBER_ID = 'honggd') V
LEFT OUTER JOIN AD_POST P ON V.POST_KEY = P.KEY) V
LEFT OUTER JOIN MEMBER M ON V.POST_USER_KEY = M.KEY
ORDER BY V.KEY DESC)V)
WHERE RNUM BETWEEN 1 AND 20;
--SELECT * FROM( SELECT ROWNUM AS RNUM, V.* FROM(SELECT V.*, M.NAME FROM(SELECT V.* ,P.TITLE,P.STATUS,P.USER_KEY "POST_USER_KEY",P.POINT FROM(SELECT P.*,M.MEMBER_ID FROM AD_LIST P LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY WHERE MEMBER_ID = ?) V LEFT OUTER JOIN AD_POST P ON V.POST_KEY = P.KEY) V LEFT OUTER JOIN MEMBER M ON V.POST_USER_KEY = M.KEY ORDER BY V.KEY DESC)V) WHERE RNUM BETWEEN ? AND ?

--갯수 세기
--SELECT COUNT(*) "cnt" FROM( SELECT ROWNUM AS RNUM, V.* FROM(SELECT V.*, M.NAME FROM(SELECT V.* ,P.TITLE,P.STATUS,P.USER_KEY "POST_USER_KEY",P.POINT FROM(SELECT P.*,M.MEMBER_ID FROM AD_LIST P LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY WHERE MEMBER_ID = ?) V LEFT OUTER JOIN AD_POST P ON V.POST_KEY = P.KEY) V LEFT OUTER JOIN MEMBER M ON V.POST_USER_KEY = M.KEY ORDER BY V.KEY DESC)V)


SELECT *
FROM (
SELECT P.*,
              C.CATEGORY_NAME
FROM(
SELECT P.*,
              M.NAME 
FROM AD_POST P
LEFT OUTER JOIN MEMBER M ON P.USER_KEY = M.KEY)P
LEFT OUTER JOIN AD_POST_CATEG C ON P.CATEGORY_KEY = C.KEY)
WHERE KEY = 1;


-- 신청목록 가져오기
SELECT V.*
FROM (SELECT V.*,P.STATUS, P.URL,P.CLICK_PRICE 
FROM(SELECT * FROM AD_LIST WHERE KEY = 1)V
LEFT OUTER JOIN AD_POST P ON V.POST_KEY = P.KEY)V;

-- SELECT V.* FROM (SELECT V.*,P.STATUS, P.URL,P.CLICK_PRICE FROM(SELECT * FROM AD_LIST WHERE KEY = ?)V LEFT OUTER JOIN AD_POST P ON V.POST_KEY = P.KEY)V



SELECT * FROM AD_LIST;

SELECT * FROM IP_LOG;

DELETE FROM IP_LOG;

INSERT INTO IP_LOG VALUES (SEQ_IP_LOG.NEXTVAL, 1 ,'127.0.0.1');
INSERT INTO IP_LOG VALUES (SEQ_IP_LOG.NEXTVAL, 1 ,'127.0.123.1');
INSERT INTO IP_LOG VALUES (SEQ_IP_LOG.NEXTVAL, 2 ,'127.0.0.1');
INSERT INTO IP_LOG VALUES (SEQ_IP_LOG.NEXTVAL, 2 ,'127.0.123.1');
INSERT INTO IP_LOG VALUES (SEQ_IP_LOG.NEXTVAL, 2 ,'127.444.123.1');

SELECT COUNT (*) "CHECK" FROM IP_LOG
WHERE AD_LIST_KEY = 2 AND IP= '127.444.123.1';

--SELECT COUNT (*) "CHECK" FROM IP_LOG WHERE AD_LIST_KEY = ? AND IP= ?;

SELECT COUNT (*) "CHECK" FROM IP_LOG
WHERE AD_LIST_KEY = 1 AND IP= '127.0.123.1';

INSERT INTO IP_LOG VALUES (SEQ_IP_LOG.NEXTVAL, ? , ?);

SELECT * FROM AD_LIST;


SELECT * FROM MEMBER;

UPDATE MEMBER SET POINT = POINT + (?) WHERE KEY = ?;

SELECT * FROM AD_POST;

UPDATE AD_POST SET POINT = POINT - (537) WHERE KEY = 5;
--UPDATE AD_POST SET POINT = POINT - (?) WHERE KEY = ?

SELECT * FROM PNT_LOG;

--INSERT INTO PNT_LOG VALUES(SEQ_PNT_LOG.NEXTVAL, ?, ?, SYSDATE, ?, 'C', (SELECT POINT FROM MEMBER WHERE KEY = ?))
-- USER_KEY / POST/KEY/ 단가 / 다시 USER_KEY

SELECT * FROM MEMBER WHERE KEY = 5;
SELECT POINT FROM MEMBER WHERE KEY = 5;


SELECT * FROM AD_LIST;

--UPDATE AD_LIST SET REVENUE = REVENUE + (?) WHERE (USER_KEY = ? AND POST_KEY = ?)
-- 단가 / 유저키 / 포스트키

SELECT * FROM PNT_LOG;

-- SELECT POINT FROM AD_POST WHERE KEY = ?

SELECT * FROM AD_POST;

UPDATE AD_POST SET STATUS = 'T' WHERE KEY = 1;



