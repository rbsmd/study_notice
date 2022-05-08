DROP TABLE board;
DROP TABLE board CASCADE CONSTRAINTS; 

CREATE TABLE board(
    board_idx   number(4)   primary key,
    board_name varchar2(200),
    board_title     varchar2(300),
    board_content   varchar(300),
    board_date  date default sysdate,
    board_hit   number(4)   default 0
);

COMMENT ON TABLE board is '게시판';
COMMENT ON COLUMN board.board_idx is '번호';
COMMENT ON COLUMN board.board_name is '글쓴이';
COMMENT ON COLUMN board.board_title is '제목';
COMMENT ON COLUMN board.board_content is '내용';
COMMENT ON COLUMN board.board_date is '날짜';
COMMENT ON COLUMN board.board_hit is '조회수';

DROP SEQUENCE board_seq;
CREATE SEQUENCE board_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO board(board_idx, board_name, board_title, board_content, board_date)
VALUES(board_seq.nextval,  '작성자', '공지사항', '공지사항이 내용.', sysdate)
    
commit;
-- 조회
SELECT board_idx, board_name, board_title, board_content, board_date
FROM board
WHERE board_idx = 1;

SELECT * from board;


commit;