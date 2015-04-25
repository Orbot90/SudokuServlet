

    function getAnswer() {
    var xmlhttp;
    var sendlink = "./answer";
    if (window.XMLHttpRequest)
    {
      xmlhttp=new XMLHttpRequest();
    }
    else
    {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange=function()
    {
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
      {
        var ans = xmlhttp.responseText;        
        if(ans == 999) {        	
          alert("Ваш судоку не был решён. Проверьте правильность ввода.");
        } else {
          var tds = $('td');
          var ansArr = ans.split(" ");
          for(var i = 0; i < 81; i++) {
            tds[i].innerHTML = ansArr[i];
          }

        $('form').toggle();
        $('button').toggle();
        $('td').removeClass('chosen');
        $('.sudoku').toggleClass('notsolved');
        }

      }
    }

    var tds = $('td');
    var nums = "";
    for(var i = 0; i < 81; i++) {

      if(tds[i].innerHTML == "")
        nums = nums + 0 + " ";
      else
        nums = nums + tds[i].innerHTML + " ";

      if(((i + 1) % 9) == 0) {
        nums = nums + "\r\n";
      }
    }

    var params = 'sudoku=' + encodeURIComponent(nums);
    xmlhttp.open("POST", sendlink, true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send(params);

  }



  function getChar(event) {
    if (event.which == null) {
      if (event.keyCode < 32) return null;
      return String.fromCharCode(event.keyCode) // IE
    }

    if (event.which!=0) {
      if (event.which < 32) return null;
      return String.fromCharCode(event.which)   // остальные
    }

    return null; // специальная клавиша
  }