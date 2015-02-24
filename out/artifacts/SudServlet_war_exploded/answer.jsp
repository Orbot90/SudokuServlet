<!DOCTYPE html>

<%--
  Created by IntelliJ IDEA.
  User: orbot
  Date: 23.02.15
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ваш ответ</title>
</head>
<body>

<%String[] answer = (String[])request.getAttribute("answer");%>

<code>
  <%for(String s : answer) {%>
  <%=s%> <br />
  <%}%>
</code>
</body>
</html>
