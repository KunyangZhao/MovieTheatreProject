<%--
  Created by IntelliJ IDEA.
  User: EYlee
  Date: 11/26/15
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Thread</title>
</head>
<body>
<h1>Post Thread</h1>
<div>
    <% Object uid = request.getAttribute("id");%>
    <form action="postThread.do" method="post">
        Please input Movie ID <input type="text"  name="id"><br>
        Input your rating <input type="text" name="rate"><br>
        Input content<textarea id="input" rows="4" name="textarea"></textarea>
        <input type="hidden" value="<%=uid%>" name="uid">
        <input type="submit" value="submit">
    </form>
</div>
<div>
    <a href="threadList.jsp">Show my message</a>
</div>
</body>
</html>
