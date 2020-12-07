<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <meta charset="utf-8">
  <title>FAQ</title>
  <style>
  .faq ul {
  	text-align: center;
   	 color: Black;
  }
  .faq ul li {
  	text-align: center;
    cursor: default;
  }
   .faq ul li.active {
    background: white;
    color: black;
  }
  span {
    color:red;
  }
  </style>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
 
<ul class="faq">
  <li>Room 에서 최저가를 예약하는 방법은 무엇입니까?</li>
  <li>알아서하세요</li>
  <li>Room 의 회원 전용 혜택은 무엇입니까?</li>
  <li>예약이 된다는거 ?</li>
  <li>Room 앱(app)이 있습니까?</li>
  <li>물론 없습니다. 조만간 안드로이드와 애플앱 공부를 마치고 만들예정입니다</li>
</ul>
 
<script>
$( "li" )
  .odd()
    .hide()
  .end()
  .even()
    .hover(function() {
      $( this )
        .toggleClass( "active" )
        .next()
          .stop( true, true )
          .slideToggle();
    });
</script>
 
</body>
</html>