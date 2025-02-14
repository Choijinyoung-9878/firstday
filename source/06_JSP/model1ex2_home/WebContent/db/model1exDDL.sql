-- 테이블 및 시퀀스 drop 및 create
DROP TABLE CUSTOMER;

CREATE TABLE CUSTOMER(    -- 회원 테이블 
    CID VARCHAR2(50) PRIMARY KEY,   -- 아이디
    CPW VARCHAR2(50) NOT NULL,  -- 비밀번호 
    CNAME VARCHAR2(50) NOT NULL,  -- 이름
    CTEL VARCHAR2(50) NOT NULL,  -- 전화번호 
    CEMAIL VARCHAR2(50),  -- 이메일
    CADDRESS VARCHAR2(250),  -- 주소
    CGENDER VARCHAR2(10) NOT NULL,  -- 성별
    CBIRTH DATE NOT NULL,  -- 생년월일
    CRDATE DATE DEFAULT SYSDATE    -- 가입일
);

DROP SEQUENCE BOOK_SEQ;
DROP TABLE BOOK;

CREATE SEQUENCE BOOK_SEQ
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;
    
CREATE TABLE BOOK(   -- 책 테이블 
    BID NUMBER(5) PRIMARY KEY, -- 책번호
    BTITLE VARCHAR2(100) NOT NULL, -- 책 제목
    BPRICE NUMBER(7) NOT NULL,  --  책 가격
    BIMAGE1   VARCHAR2(30) NOT NULL,  -- 책 대표 이미지(파일이름만 저장할거임)(첨부 안할경우 : noImg.png )
    BIMAGE2   VARCHAR2(30) NOT NULL,  -- 책 부가 이미지(첨부 안할경우 : NOTHING.JPG )
    BCONTENT  VARCHAR2(4000),    -- 책 설명 ( 한글 1,333 글자 이내 )
    BDISCOUNT NUMBER(3) NOT NULL,   -- 할인율(0~100% 이내)
    BRDATE DATE DEFAULT SYSDATE  -- 책 등록일   
);

DROP SEQUENCE FILEBOARD_SEQ;
DROP TABLE FILEBOARD;

CREATE SEQUENCE FILEBOARD_SEQ
    MAXVALUE 9999999
    NOCACHE
    NOCYCLE;
    
CREATE TABLE FILEBOARD(  -- 파일 첨부 게시판 테이블
    FNUM NUMBER(7) PRIMARY KEY,  -- 글번호 
    CID VARCHAR2(50) REFERENCES CUSTOMER(CID),  -- 아이디 CUSTOMER 참조키
    FSUBJECT VARCHAR2(250) NOT NULL, -- 글제목
    FCONTENT VARCHAR2(4000),  -- 글내용
    FFILENAME VARCHAR2(50), -- 첨부파일이름
    FPW VARCHAR2(50) NOT NULL,  -- 삭제용 비밀번호
    FHIT NUMBER(7) DEFAULT 0 NOT NULL,  -- 글 조회수
    FREF NUMBER(7) NOT NULL,  -- 글 그룹
    FRE_STEP NUMBER(7) NOT NULL,  -- 그룹내 출력순서
    FRE_LEVEL NUMBER(7) NOT NULL,  -- 들여쓰기 정도
    FIP VARCHAR2(50) NOT NULL,  -- 글쓴이의 IP주소
    FRDATE DATE DEFAULT SYSDATE NOT NULL -- 글등록 시점 
);

