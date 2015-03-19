<%--
  Created by IntelliJ IDEA.
  User: orbot
  Date: 22.02.15
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

  <title>Решение судоку</title>

<link rel="stylesheet" href="css/styles.css">
<a href="/">На главную</a>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>

<body>
<header>
  <h1>Робот для решения судоку.</h1>
  <p>Если вы хотите проверить правильность решения вашего судоку или вам просто лень его решать, дайте его мне, и я в миг решу его для вас!<br/></p>
</header>

<div class="area">
<table border="1" class="sudoku">
  <tr>
    <td></td> <td></td> <td class="third-vert" ></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr>
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr class="third-hor">
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr>
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr>
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr class="third-hor">
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr>
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr>
    <td id="test"></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
  <tr class="third-hor">
    <td></td> <td></td> <td class="third-vert"></td> <td></td> <td></td> <td class="third-vert"></td> <td ></td> <td></td> <td></td>
  </tr>
</table>

<table class="numbers" border="1">
  <tr><td id="1">1</td></tr>
  <tr><td id="2">2</td></tr>
  <tr><td id="3">3</td></tr>
  <tr><td id="4">4</td></tr>
  <tr><td id="5">5</td></tr>
  <tr><td id="6">6</td></tr>
  <tr><td id="7">7</td></tr>
  <tr><td id="8">8</td></tr>
  <tr><td id="9">9</td></tr>
  <tr><td id="">0</td></tr>
</table>
<br />
<form action="./answer" method="post">
  <input type="hidden" name="sudoku" id="submitter">
  <input type="submit" value="Решить!" onclick="forsubmit()">
</form>
</div>

<script>
  $('.sudoku td').click(function() {
    $('td').removeClass('chosen');
    $(this).toggleClass('chosen');
  });

  $('.numbers td').click(function() {
    var num = this.id;
    $('.chosen').text(num);
  });

</script>

<script>

  function forsubmit() {
    var tds = $('td');
    var nums = "";
    for(var i = 1; i < 82; i++) {

      if(tds[i - 1].innerHTML == "")
        nums = nums + 0 + " ";
      else
        nums = nums + tds[i - 1].innerHTML + " ";

      if((i % 9) == 0) {
        nums = nums + "\r\n";
      }
    }
    $('input:hidden').val(nums);

  }


</script>

</body>
</html>
