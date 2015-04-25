<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

  <title>Решение судоку</title>

  <link rel="stylesheet" href="css/styles.css">
  <a href="/">На главную</a>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script type="text/javascript" src="scripts/sudoku.js"></script>

  <script>
  var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
</script>
</head>

<body>
<header>
  <h1>Робот для решения судоку.</h1>
  <p>Если вы хотите проверить правильность решения вашего судоку или вам просто лень его решать, дайте его мне, и я в миг решу его для вас!<br/></p>
</header>



  <div class="area">
    <table border="1" class="sudoku notsolved">
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
      <tr><td id=""></td></tr>
    </table>
    <br />
    <form onsubmit="forSubmit(); return false">
      <input type="submit" value="Решить!" id="sud_submit" class="buttons">
    </form>
    <button style="display: none" class="buttons">Решить ещё!</button>
  </div>

<script type="text/javascript">

	var chr1;	
   $('.notsolved td').click(function() {

    if($('.sudoku').hasClass('notsolved')) {
  if(isMobile.any()) {
   if(chr1) {
   	$('.chosen').text(chr1);
   }
    chr1 = $(this).text();
    $(this).text("");		
   	$('.inner').remove();
   	var INPUT = document.createElement("input");     //    Добавляем атриьбут
    INPUT.setAttribute("type", 'number');
    INPUT.setAttribute("class", 'inner');
    INPUT.setAttribute("min", '0');
    INPUT.setAttribute("max", '9');
    INPUT.setAttribute("size", '1');   
    INPUT.setAttribute("value", chr1);    
    var PARENT = $(this);
    //    пока элемент не отображается на странице
    //    Добавляем созданный элемент INPUT к элементу PARENT
    PARENT.append(INPUT);
    $('.inner').focus();
    
   	}



      $('td').removeClass('chosen');
      $(this).toggleClass('chosen');
    }    

  });

  $('.numbers td').click(function() {
    var num = this.id;
    $('.chosen').text(num);
    $('.chosen').toggleClass('chosen');
  });

    $('button').click(function() {
    var tds = $('td');
    for (var i = 0; i < 81; i++) {
      tds[i].innerHTML = "";
    }
    $('form').toggle();
    $('button').toggle();
    $('.sudoku').toggleClass('notsolved');


  });

    $(document).keydown(function(e) {
     if(isMobile.any()) {
      if(e.which == '8') {
      $('.chosen').text('');
      chr1 = "";
      }
    }

    var tds = $('.sudoku td');

      if(e.which == '37') {
      var index = $('.chosen').index('td');
      $('.chosen').toggleClass('chosen');
      $(tds[index - 1]).toggleClass('chosen');
      }

      if(e.which == '38') {
      var index = $('.chosen').index('td');
      $('.chosen').toggleClass('chosen');
      $(tds[index - 9]).toggleClass('chosen');
      }

      if(e.which == '39') {
      var index = $('.chosen').index('td');
      $('.chosen').toggleClass('chosen');
      $(tds[index + 1]).toggleClass('chosen');
      }

      if(e.which == '40') {
      var index = $('.chosen').index('td');
      $('.chosen').toggleClass('chosen');
      $(tds[index + 9]).toggleClass('chosen');
      }    
    }); 


   $(document).on('keydown keypress', function(e) {

    e = e || event;
    e.preventDefault();

    if (e.ctrlKey || e.altKey || e.metaKey) return;

    var chr = getChar(e);


    // с null надо осторожно в неравенствах, т.к. например null >= '0' => true!
    // на всякий случай лучше вынести проверку chr == null отдельно
    if ((chr == null) && e.which != '46' && e.which != '8') return;

    if (!(chr < '0' || chr > '9')) {
      if(chr == '0')
        $('.chosen').text('');
      else
        $('.chosen').text(chr);      
      var tds = $('.sudoku td');
    //  var index = $('.chosen').index('td');
    //  $('.chosen').toggleClass('chosen');
    //  $(tds[index + 1]).toggleClass('chosen'); 
    }

    if(e.which == '46' || e.which == '127') {
      $('.chosen').text('');
      var tds = $('.sudoku td');
      var index = $('.chosen').index('td');
      $('.chosen').toggleClass('chosen');
      $(tds[index + 1]).toggleClass('chosen');
    }

    if(e.which == '8') {

      $('.chosen').text('');
      var tds = $('.sudoku td');
      var index = $('.chosen').index('td');
      $('.chosen').toggleClass('chosen');
      $(tds[index - 1]).toggleClass('chosen');
    }

	if(isMobile.any()) {
 var index = $('.chosen').index('td'); 
    chr1 = $(tds[index + 1]).text();
	$(tds[index + 1]).text("");
   	$('.inner').remove();
   	var tds = $('.sudoku td');
   	  	
   	var INPUT = document.createElement("input");    
    INPUT.setAttribute("type", 'number');
    INPUT.setAttribute("class", 'inner');
    INPUT.setAttribute("min", '0');
    INPUT.setAttribute("max", '9');
    INPUT.setAttribute("size", '1');   
    INPUT.setAttribute("value", chr1);     
    var PARENT = $(tds[index + 1]);
    $('.chosen').toggleClass('chosen');
    PARENT.toggleClass('chosen'); 
    PARENT.append(INPUT);

    $('td input').focus();
    
   	}


    
  });

function forSubmit() {
	if(chr1)
		$('.chosen').text(chr1);
	$('.inner').remove();
	getAnswer();

		
}
</script>

</body>
</html>