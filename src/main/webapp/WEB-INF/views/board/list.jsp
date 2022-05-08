<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
    <title>게시판 연습</title>

    <link href="/css/style.css" rel="Stylesheet" type="text/css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script type="text/javascript">
        //뒤로가기 누르면 자동으로 새로고침
window.onpageshow = function (event){
    if (event.persisted){
        document.location.reload();
    }
}
    </script>

</head>

<body>
<jsp:include page="../menu/top.jsp" />

<DIV class='title_line'>게시판 > 목록</DIV>

<DIV class='content_body'>


    <DIV class='content_body'>
        <ASIDE class="aside_right">
            <button type='button' id='create' onclick="location.href='./createForm'" style='padding: 0; border: none; background: none;'>등록</button>
        </ASIDE>



    <DIV class='menu_line'></DIV>

            <h2>게시판 글 목록</h2>

<TABLE class='table table-striped'>
    <colgroup>
        <col style='width: 10%;'/>
        <col style='width: 35%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 20%;'/>
    </colgroup>



    <tr>
        <th>번호</th>
        <th>이름</th>
        <th>제목</th>
        <th>날짜</th>
        <th>조회수</th>
    </tr>

<c:forEach var="dto" items="${list}">                                   <!--list만큼 순환하여 출력 -->

    <tr>
        <td>${dto.board_idx}</td>
        <td>
            <a href = "readForm?board_idx=${dto.board_idx}"> ${dto.board_name}</a>
        </td>
        <td>
            <a href = "readForm?board_idx=${dto.board_idx}"> ${dto.board_title}</a>
        </td>
        <td>
        <c:set var= "dateVar" value= "${dto.board_date}" />             <!--dateVar는 예약어 -->
        <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </td>
        <td>${dto.board_hit}</td>
    </tr>
</c:forEach>

</table>

</DIV>
    <jsp:include page="../menu/bottom.jsp" />
</body>
</html>
