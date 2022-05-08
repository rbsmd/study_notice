package dev.mvc.board;

//    board_idx   number(4)   primary key,
//            board_name varchar2(20),
//            board_title     varchar2(100),
//            board_content   varchar(300),
//            board_date  date default sysdate,
//        board_hit   number(4)   default 0

import lombok.Data;

import java.util.Date;

@Data
public class BoardDTO {

    private int board_idx;
    private String board_name;
    private String board_title;
    private String board_content;
    private Date board_date;
    private int board_hit;


//필드가있는 생성자
    public BoardDTO(int board_idx, String board_name, String board_title, String board_content, Date board_date, int board_hit) {
        super();
        this.board_idx = board_idx;
        this.board_name = board_name;
        this.board_title = board_title;
        this.board_content = board_content;
        this.board_date = board_date;
        this.board_hit = board_hit;
    }
}
