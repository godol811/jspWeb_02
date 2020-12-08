// JavaScript Document

$(function() {
   $('.subMenuItem').slideUp(1);
   $('#subMenuBox').hide();
   
   var $subMenuItem = $('.subMenuItem');
   
   $('.menuItemHover').each(function (index) {
      $(this).hover (
         function() {
            $('#subMenuBox').css('visibility', 'visible');
            $('#subMenuBox').show();
            
            $subMenuItem.eq(index).slideDown(300);
         },
         function() {
            $subMenuItem.eq(index).slideUp(100);
            
            $('#subMenuBox').hide();
         }
      );
   });
   
   $('.subMenuItem').hover(
      function() {
         $subMenuItem.stop();
         $('#subMenuBox').show();
      },
      function() {
         $subMenuItem1.slideUp(1);
         $('#subMenuBox').hide();
      }
   );
   
});   
   $(function() {  
   $('.subMenuItem1').slideUp(1);
   
   $('#subMenuBox1').hide();
   
   var $subMenuItem1 = $('.subMenuItem1');
   
   $('.menuItemHover1').each(function (index) {
	   $(this).hover (
			   function() {
				   $('#subMenuBox1').css('visibility', 'visible');
				   $('#subMenuBox1').show();
				   
				   $subMenuItem1.eq(index).slideDown(300);
			   },
			   function() {
				   $subMenuItem1.eq(index).slideUp(100);
				   
				   $('#subMenuBox1').hide();
			   }
	   );
   });
   
   $('.subMenuItem1').hover(
		   function() {
			   $subMenuItem.stop();
			   $('#subMenuBox1').show();
		   },
		   function() {
			   $subMenuItem.slideUp(1);
			   $('#subMenuBox1').hide();
		   }
   );
   
   
});