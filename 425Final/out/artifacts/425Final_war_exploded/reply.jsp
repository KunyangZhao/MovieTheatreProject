<%--
  Created by IntelliJ IDEA.
  User: EYlee
  Date: 11/26/15
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>reply thread</h1>

<div class="chatMain">
    <ul class="ulSet">
        <li class="li1">ThreadID</li>
        <li class="li1">UserID</li>
        <li class="li2">MovieID</li>
        <li class="li3">Time</li>
        <li class="li2">Rate</li>
        <li class="li3">Content</li>
    </ul>
</div>
<div class="chatMain">
    <ul class="ulSet">
        <li class="li1"><%=request.getParameter("threadid") %>
        </li>
        <li class="li1"><%=request.getParameter("userid") %>
        </li>
        <li class="li2"><%=request.getParameter("movieid") %>
        </li>
        <li class="li3"><%=request.getParameter("time") %>
        </li>
        <li class="li2"><%=request.getParameter("rate") %>
        </li>
        <li class="li3"><%=request.getParameter("content") %>
        </li>
    </ul>
</div>
<div class="chatMain">
    <form action="reply.do" method="post">
        <!-- 隐藏表单 传值 -->
        <input type="hidden" name="threadid" value="<%=request.getParameter("threadid") %>"/>
        <input type="hidden" name="userid" value="<%=request.getParameter("userid") %>"/>
        <input type="hidden" name="movieid" value="<%=request.getParameter("movieid") %>"/>
        <input type="hidden" name="time" value="<%=request.getParameter("time") %>"/>
        <input type="hidden" name="rate" value="<%=request.getParameter("rate")  %>"/>

        <input type="hidden" name="content" value="<%=request.getParameter("content")  %>"/>
        Put your reply<textarea class="inputText"  rows="4" name="reply"></textarea>
        <br/> <input type="submit" value="submit">
    </form>
</div>

</body>
</html>
