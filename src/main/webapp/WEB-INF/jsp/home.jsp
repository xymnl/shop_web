<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="/css/flexslider.css">
  <link rel="icon" href="/imgs/favicon-logo.svg" sizes="32x32" type="image/png">
<!--   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
  <script src="/js/jquery-1.12.4.min.js"></script>
  <script src="/js/slide.js"></script>
  <script src="/js/jquery.flexslider.js"></script>
  <script src="/js/jquery.touchSwipe.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script>
	  $(document).ready(function() {
		  $('.flexslider').flexslider({
		    animation: 'slide',
		    controlNav: true,
		    directionNav: false,
		    touch: true,
		    start: function(slider){
		      $('body').removeClass('loading');
		    }
		  });

		  $("#test").swipe({
		    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
		      if (direction === 'left') {
		        $('.flexslider').flexslider('next');
		      } else if (direction === 'right') {
		        $('.flexslider').flexslider('prev');
		      }
		    },
		    threshold: 50,
		    fingers: 'all'
		  });
		});
	</script>
</head>
<body>
	<%@include file="fragments/header.jsp"%>
	<%@include file="fragments/footer.jsp"%>

</body>
</html>