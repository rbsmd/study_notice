<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
  <title>글 내용</title>

  <link href="/css/style.css" rel="Stylesheet" type="text/css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <script type="text/javascript">

  </script>

</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='title_line'>
  게시판 >  글 내용
</DIV>

<DIV class='content_body'>
  <form action="updateAction" method="post">

    <input type="hidden" name="board_idx" value="${ dto.board_idx }"/>
    <input type="hidden" name="board_name" value="${ dto.board_name }"/>
    <input  type="hidden"name="board_content" value="${ dto.board_content }"/>

<%--    <tr>
      <td>번호</td>
      <td>${ dto.board_idx }</td>
    </tr>

    <tr>
      <td>조회수</td>
      <td>${ dto.board_hit }</td>
    </tr>--%>



    <div class="form-group">
      <label class="control-label col-md-2">이름</label>
      <div class="col-md-10">
        <input type='text' name='board_name' value='${ dto.board_name }' required="required"
               autofocus="autofocus" class="form-control" style='width: 50%;'>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-md-2">제목</label>
      <div class="col-md-10">
        <input type='text' name='board_title' value='${ dto.board_title }' required="required" class="form-control" style='width: 100%;'>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-2">내용</label>
      <div class="col-md-10">
        <textarea name='board_content' required="required" class="form-control" rows="12" style='width: 100%;'>${dto.board_content }</textarea>
      </div>
    </div>

    <tr>
      <td colspan="2">
        <input type = "submit" value="수정하기">
        <a href="list"><input type = "button" value="목록보기"></a>
        <a href="deleteAction?board_idx=${ dto.board_idx }"><input type = "button" value="삭제하기"></a>
      </td>

    </tr>

    </table>

  </form>
</DIV>
</body>
</html>
