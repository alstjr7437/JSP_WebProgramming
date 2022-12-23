USE alstjrdb;

CREATE TABLE tbl_board(
bno INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(200),
content TEXT,
writer VARCHAR(50),
regdate DATE DEFAULT NOW(),
updatedate DATE DEFAULT NOW()
TYPE INT(10)
);

INSERT INTO tbl_board(title, content, writer) VALUES('테스트1','테스트내용1', '홍길동', 1);
INSERT INTO tbl_board(title, content, writer) VALUES('테스트2','테스트내용2', '홍길동', 1);
INSERT INTO tbl_board(title, content, writer) VALUES('테스트3','테스트내용3', '홍길동', 1);
INSERT INTO tbl_board(title, content, writer) VALUES('공지사항','공지사항입니다.', '김민석', 1);
INSERT INTO tbl_board(title, content, writer) VALUES('업데이트','업데이트입니다.', '김민석', 1);
INSERT INTO tbl_board(title, content, writer) VALUES('질문있습니다','질문입니다.', '김민석', 2);
INSERT INTO tbl_board(title, content, writer) VALUES('자유게시판이다!','자유입니다.', '홍길동', 3);

SELECT * FROM tbl_board;

SELECT * FROM tbl_board WHERE title LIKE '%테스트%'

SELECT COUNT(*) FROM tbl_board WHERE TYPE = 1
SELECT COUNT(*) FROM tbl_board