<%@ page import="entity.MemberInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Movie" %>

<%--
  Created by IntelliJ IDEA.
  User: EYlee
  Date: 11/24/15
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <h1>
        Movie Manage
    </h1>
    <table class="table" border="1">
        <tr class="table_header">
            <td>
                id:
            </td>
            <td>
                title:
            </td>
            <td>
                director:
            </td>
            <td>
                description:
            </td>


        </tr>
        <%

            List<Movie> movies =
                    (List<Movie>) request.getAttribute("movies");
            for (int i = 0; i < movies.size(); i++) {
                Movie m = movies.get(i);
        %>
        <tr class="row<%=(i % 2 + 1) %>">
            <td>
                <%=m.getId()%>
            </td>
            <td>
                <%=m.getTitle()%>
            </td>
            <td>
            <%=m.getDirector()%>
            </td>
            <td>
            <%=m.getDescription()%>
            </td>



        </tr>
        <%
            }
        %>
    </table>


</div>
<form action="list.do" method="post">
    <input type="submit" value="Update worker">
</form>



</body>
</html>
