-- 강아지 분양 게시판 테이블
DROP SEQUENCE CBOARD_SEQ;

CREATE SEQUENCE CBOARD_SEQ
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
    
DROP TABLE CAT_BOARD;

CREATE TABLE CAT_BOARD(
    C_NUM NUMBER(6) PRIMARY KEY,
    AID REFERENCES ADMIN(AID) NOT NULL,
    CID REFERENCES CAT(CID) NOT NULL,
    C_TITLE VARCHAR2(30) NOT NULL,
    C_CONTENT VARCHAR2(3000) NOT NULL,
    C_RDATE DATE DEFAULT SYSDATE NOT NULL,
    C_HIT NUMBER(6) DEFAULT 0 NOT NULL,
    C_IP VARCHAR2(50) NOT NULL,
    C_IMAGE1 VARCHAR2(30) NOT NULL,   -- 최소 한장 첨부
    C_IMAGE2 VARCHAR2(30),
    C_IMAGE3 VARCHAR2(30),
    C_IMAGE4 VARCHAR2(30),
    C_IMAGE5 VARCHAR2(30)
);