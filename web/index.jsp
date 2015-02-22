<%--
  Created by IntelliJ IDEA.
  User: orbot
  Date: 22.02.15
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <title>Решение судоку</title>



</head>

<body>
<header>
  <h1>Робот для решения судоку.</h1>
  <p>Если вы хотите проверить правильность решения вашего судоку или вам просто лень его решать, дайте его мне, и я в миг решу его для вас!<br/>
    Вводить судоку необходимо построчно, цифры отделять друг от друга пробелами. Вместо пустых клеток вводите нули.</p>
</header>

<form action="/SudokuServ" method="post">
			<textarea rows=18 cols=34 name="sudoku"></textarea>
  <input type="submit" value="Решить">
</form>


</body>
</html>
