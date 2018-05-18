<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css"
	href="<c:url value='/marketIndex/css/styles.css'/>">
</head>
<body id="selectbody">
	<div id="paper-back">
		<nav>
		<div class="close"></div>
		<a href="#">Home</a> <a href="#">About Us</a> <a href="#">Our Work</a>
		<a href="#">Contact</a> </nav>
	</div>
	<div id="paper-window">
		<div id="paper-front">
			<div class="hamburger">
				<span></span>
			</div>
			<div id="container">
				<section> <header class="htmleaf-header">
				<h1>
					倾斜页面打开侧边栏菜单UI界面设计 <span>A Page Tilt Menu Effect</span>
				</h1>
				</header>
				<p>Click the hamburger icon to see it in action</p>
				</section>
				<section></section>
				<section></section>

			</div>
		</div>
	</div>
	<h1>OKOK</h1>
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script>
		var paperMenu = {
			$window : $('#paper-window'),
			$paperFront : $('#paper-front'),
			$hamburger : $('.hamburger'),
			offset : 1800,
			pageHeight : $('#paper-front').outerHeight(),
			open : function() {
				this.$window.addClass('tilt');
				this.$hamburger.off('click');
				$('#container, .hamburger').on('click', this.close.bind(this));
				this.hamburgerFix(true);
				// console.log('opening...');
			},
			close : function() {
				this.$window.removeClass('tilt');
				$('#container, .hamburger').off('click');
				this.$hamburger.on('click', this.open.bind(this));
				this.hamburgerFix(false);
				// console.log('closing...');
			},
			updateTransformOrigin : function() {
				scrollTop = this.$window.scrollTop();
				equation = (scrollTop + this.offset) / this.pageHeight * 100;
				this.$paperFront.css('transform-origin', 'center ' + equation
						+ '%');
			},
			hamburgerFix : function(opening) {
				if (opening) {
					$('.hamburger').css({
						position : 'absolute',
						top : this.$window.scrollTop() + 30 + 'px'
					});
				} else {
					setTimeout(function() {
						$('.hamburger').css({
							position : 'fixed',
							top : '30px'
						});
					}, 300);
				}
			},
			bindEvents : function() {
				this.$hamburger.on('click', this.open.bind(this));
				$('.close').on('click', this.close.bind(this));
				this.$window
						.on('scroll', this.updateTransformOrigin.bind(this));
			},
			init : function() {
				this.bindEvents();
				this.updateTransformOrigin();
			}
		};
		paperMenu.init();
	</script>
</body>
</html>