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

    <link rel="stylesheet" href="css/answer.css">
    <a href="/SudokuServlet/">Решить ещё судоку</a> <br />
    <a href="/">На главную</a>
</head>
<body>
<h1>Ваш ответ:</h1>

<%String[] answer = (String[])request.getAttribute("answer");%>
<div>
<code>
<span>
  <%for(String s : answer) {%>
  <%=s%> <br />
  <%}%>
  </span>
</code>
</div>
</body>
</html>
