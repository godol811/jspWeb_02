<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <meta charset="utf-8">
  <title>FAQ</title>
  <style>
  .faq{
  	padding-bottom: 10px;
  }
  
  .faq ul {
  	text-align: center;
   	 color: Black;
  }
  .faq ul li {
  	text-align: left;
    cursor: default;
  }
   .faq ul li.active {
    background: white;
    color: black;
  }
  span {
   /*  color:red; */
  }
  
  #head{
  	font-weight: bold;
  	font-size: 25px;
  	margin-bottom: 20px;
  	margin-left:32%;
  	margin-right: atuo;
  	text-align: left;
  	list-style-type: none;
  
  }
  #head:hover #content{
  	opacity: 0.5
  }
  
  #content{
  	font-size: 20px;
  	color:#4269e1;
  	margin-bottom: 20px;
  	margin-left:35%;
  	margin-right: atuo;
  	text-align: left;
  	list-style-type: none;
  	opacity: 0;
  	
  }
  
  </style>
<!--   <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 --></head>
<body>
 
<ul class="faq">
  <li id="head">Room 에서 예약하는 방법은 무엇입니까?</li>
  <li id="head"> ➡ 검색을 하셔서 사용하시면 예약을 할 수 있게 되었습니다.</li>
  <li id="head">Room 의 회원 전용 혜택은 무엇입니까?</li>
  <li id="head"> ➡ 회원에 가입을 하시면 중개 수수료 없이 즐기실 수 있습니다 </li>
  <li id="head">Room 앱(app)이 있습니까?</li>
  <li id="head"> ➡ 물론 없습니다. 조만간 안드로이드와 애플앱 공부를 마치고 만들예정입니다</li>
</ul>
<script>
$( ".faq li" )
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