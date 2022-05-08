<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
    <title>글쓰기</title>

    <link href="/css/style.css" rel="Stylesheet" type="text/css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script type="text/javascript">

    </script>

</head>
<body>

<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'>
    게시판 >  글 등록
</DIV>

<DIV class='content_body'>
<form action="createAction" method="post">




        <div class="form-group">
            <label class="control-label col-md-2">이름</label>
            <div class="col-md-10">
                <input type='text' name='board_name' value='' required="required" class="form-control" style='width: 50%;'>
            </div>
        </div>



        <div class="form-group">
            <label class="control-label col-md-2">제목</label>
            <div class="col-md-10">
                <input type='text' name='board_title' value='' required="required"
                       autofocus="autofocus" class="form-control" style='width: 100%;'>
            </div>
        </div>



        <div class="form-group">
            <label class="control-label col-md-2">내용</label>
            <div class="col-md-10">
                <textarea name='board_content' value='' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
            </div>
        </div>




    <div class="content_body_bottom">
        <button type="submit" class="btn btn-sm" style="background-color: #202052;color: white;">등록</button>
        <button type="button" onclick="location.href='./list'" class="btn btn-sm" style="background-color: #202052;color: white;">목록</button>
    </div>


</form>
</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />

</body>
</html>
