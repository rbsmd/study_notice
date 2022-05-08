package dev.mvc.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardDAOInter boardDAOInter;


    public BoardController() {
        System.out.println("-> BoardController created.");
    }

    @RequestMapping("/board/study")
    //@ResponseBody
    public String root(){
        //return "root()함수 호출됨";
        return "redirect:/board/list";                      //study 경로를 거쳤다가 /board/list로 리다이렉트됨
    }


        @RequestMapping("/board/list")                        //URL에서 포트번호 뒤 경로
        public String list(Model model){

        List<BoardDTO> list = boardDAOInter.list();             //list 함수를 이용해서 list가져오기
        model.addAttribute("list", list);           //model에 데이터 넣어주기

        System.out.println(list);
            return "/board/list";           //view밑에 파일 경로                  //list.jsp로 리다이렉트됨
        }


        @RequestMapping("/board/createForm")
        public String createForm(){
            return "/board/createForm";                                        //create.jsp로 리다이렉트됨
        }


        @RequestMapping("/board/createAction")
        @ResponseBody
        public String createAction( @RequestParam("board_name") String board_name,
                                    @RequestParam("board_title") String board_title,
                                    @RequestParam("board_content") String board_content,
                                    HttpServletRequest request
                               ){
        int result = boardDAOInter.write(board_name, board_title, board_content);
        if (result == 1){
            System.out.println("글쓰기 성공");

            //return "redirect:/board/list";                      //list.jsp로 리다이렉트됨
            return "<script> alert('글쓰기 성공'); location.href='/board/list';               </script>";
        }else {
            System.out.println("글쓰기 실패");

            //return "redirect:/board/createForm";
            return "<script> alert('글쓰기 실패');  location.href='/board/createForm'; </script>";
        }
        }


        @RequestMapping("/board/readForm")
        public String readForm( @RequestParam("board_idx") String board_idx,
                                Model model,
                                HttpServletRequest request) {
            //조회수 증가
            boardDAOInter.hit(board_idx);

            BoardDTO dto = boardDAOInter.viewDto( board_idx );
            System.out.println( dto );

            model.addAttribute("dto", dto);

            return "/board/readForm";                           //readForm.jsp로 리다이렉트됨
        }

    @RequestMapping("/board/updateAction")
    @ResponseBody
    public String updateAction(@RequestParam("board_idx") String board_idx,
                               @RequestParam("board_name") String board_name,
                               @RequestParam("board_title") String board_title,
                               @RequestParam("board_content") String board_content,
                               HttpServletRequest request){

        int result = boardDAOInter.updateDto(board_idx, board_name, board_title, board_content);
        if (result == 1){
            System.out.println("글수정 성공");
            //.getSession().setAttribute("alert_message", "글수정 성공");

            //return "redirect:/board/list";
            return "<script> alert('글수정 성공'); location.href='/board/list';               </script>";
        }else {
            System.out.println("글수정 실패");
            //request.getSession().setAttribute("alert_message", "글수정 실패");

            //return "redirect:updateForm?board_idx=" + board_idx;
            return "<script> alert('글수정 실패'); location.href='/board/list';               </script>";
        }

    }


    @RequestMapping("/board/deleteAction")
    @ResponseBody
    public String deleteAction(@RequestParam("board_idx") String board_idx,
                               HttpServletRequest request){

        int result = boardDAOInter.deleteDto(board_idx);
        if (result == 1){
            System.out.println("글삭제 성공");
            //.getSession().setAttribute("alert_message", "글삭제 성공");
            //return "redirect:/board/list";
            return "<script> alert('글삭제 성공'); location.href='/board/list';               </script>";
        }else {
            System.out.println("글삭제 실패");
            //request.getSession().setAttribute("alert_message", "글삭제 실패");
            //return "redirect:updateForm?board_idx=" + board_idx;
            return "<script> alert('글삭제 실패'); location.href='/board/list';               </script>";
        }

    }
}


