<%@ page import="entity.MovieComment" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: EYlee
  Date: 11/26/15
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>See reply</h1>

<div class="chatMain">
    <ul class="ulSet">
        <li class="li1">People who reply</li>
        <li class="li1">Reply time</li>
        <li class="li3" style="width:800px">Reply content</li>
    </ul>
</div>
<div class="chatMain">
    <%
        List<MovieComment> commentList = (List<MovieComment>) request.getAttribute("movieCommentList");
//        for(MovieComment c:commentList){
        for (int i = 0; i < commentList.size(); i++) {
            MovieComment c = commentList.get(i);

    %>
    <ul class="ulSet">
        <li class="li1"><%=c.getUserid() %>
        </li>
        <li class="li1"><%=c.getCommenttime() %>
        </li>
        <li class="li3" style="width:800px"><%=c.getCommenttext() %>
        </li>
    </ul>

    <%
        }
    %>
</div>

</body>
</html>
