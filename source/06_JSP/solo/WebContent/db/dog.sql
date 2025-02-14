-- 강아지
-- DROP & CREATE
DROP TABLE DBREED;

CREATE TABLE DBREED(    -- 강아지 종류 테이블 
    DBREEDNO NUMBER(3) PRIMARY KEY,   -- 강아지 종류 번호
    DBREEDNAME VARCHAR2(30) UNIQUE NOT NULL -- 강아지 종류 이름
);

-- DOG 테이블 
DROP SEQUENCE DOG_SEQ;

CREATE SEQUENCE DOG_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
    
DROP TABLE DOG CASCADE CONSTRAINTS;

CREATE TABLE DOG(
   DNUM NUMBER(6) PRIMARY KEY,   -- 강아지 고유번호
   DNAME VARCHAR2(30) NOT NULL,   -- 강아지 이름
   DGENDER VARCHAR2(2) NOT NULL,  -- 강아지 성별
   DBIRTH DATE NOT NULL,   -- 강아지 생년월일
   DPRICE NUMBER(8) NOT NULL,
   DBREEDNO REFERENCES DBREED(DBREEDNO) NOT NULL,  -- 강아지 종류 번호
   AID REFERENCES ADMIN(AID) NOT NULL,   -- 관리자 아이디(담당자)
   DCONTENT VARCHAR2(3000) NOT NULL,
   DIMAGE1 VARCHAR2(50) NOT NULL,
   DIMAGE2 VARCHAR2(50),
   DIMAGE3 VARCHAR2(50),
   DIMAGE4 VARCHAR2(50),
   DIMAGE5 VARCHAR2(50),
   DIP VARCHAR2(50),
   DHIT NUMBER(6) DEFAULT 0 NOT NULL,
   DR_CHECK NUMBER(1) DEFAULT 1 NOT NULL,  -- 강아지 분양 예약 여부 0은 예약중.
   DRDATE DATE DEFAULT SYSDATE NOT NULL  -- 강아지 글 등록 시점
);

-- 1. 강아지 분양 글 등록
INSERT INTO DOG (DNUM, DNAME, DGENDER, DBIRTH, DPRICE, DBREEDNO, AID, DCONTENT, DIMAGE1, DIMAGE2,DIMAGE3,DIMAGE4,DIMAGE5, DIP)
    VALUES(DOG_SEQ.NEXTVAL, '밤비', 'M', '2020-06-24', 1500000, 50 , 'happydog', '예쁘고 귀여운 밤비에요', 'bambi.jpg', null, null, null, null, '192.168.10.30' );


-- 2. 강아지 목록 출력 (startRow ~ endRow )  -- 근데 dr_check가 0이면 출력 예약중으로 뜨게하기
SELECT * FROM(SELECT ROWNUM RN, A.* FROM
                (SELECT * FROM DOG ORDER BY DRDATE DESC) A) D, DBREED DB
    WHERE D.DBREEDNO = DB.DBREEDNO
        AND RN BETWEEN 1 AND 4;

-- 3. 글 상세보기 (DNUM 으로 DTO 가져오기 )
SELECT * FROM DOG D, DBREED DB
    WHERE D.DBREEDNO = DB.DBREEDNO 
        AND DNUM=1;

-- 4. 글 조회수 올리기
UPDATE DOG SET DHIT= DHIT +1
    WHERE DNUM=1;

-- 5. 전체 글 개수 가져오기
SELECT COUNT(*) FROM DOG;

-- 6. 글수정
UPDATE DOG SET DNAME='밤빙',
                DGENDER='M',
                 DBIRTH='2020-05-24',
                  DPRICE=1600000,
                   DBREEDNO=50,
                    AID='happydog',
                     DCONTENT='정말정말 예쁜 밤빙이에요',
                      DIMAGE1='bambi1.jpg',
                       DIMAGE2='bambi2.jpg',
                        DIMAGE3='bambi3.jpg',
                         DIMAGE4='bambi4.jpg',
                          DIMAGE5='bambi5.jpg',
                           DIP ='192.162.13.01'
                    WHERE DNUM=1;

-- 7. 글 삭제하기
DELETE DOG WHERE DNUM=2;

-- 8. 예약하기
UPDATE DOG SET DR_CHECK=0
    WHERE DNUM=1;
    
-- 9. 예약 취소
UPDATE DOG SET DR_CHECK=1
    WHERE DNUM=1;
    


    

    


COMMIT;