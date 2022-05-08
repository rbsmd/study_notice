package dev.mvc.board;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper //MyBatis와 인터페이스 함수를 연결함
public interface BoardDAOInter {

    public List<BoardDTO> list();

    public int write(String board_name, String board_title, String board_content);

    public BoardDTO viewDto(String board_idx);

    public int deleteDto(String board_idx);

    public int updateDto(String board_idx, String board_name, String board_title, String board_content);

    public int hit(String board_idx);
}
