<%-- 
    Document   : index1
    Created on : 1/10/2016, 09:52:08 AM
    Author     : EDINSON
--%>
<%@page import="co.ufps.edu.dto.principal"%>
<%@page import="co.ufps.edu.dao.principaldao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="consul" class="co.ufps.edu.dao.principaldao" scope="session"></jsp:useBean>
    <%
   principal m= consul.consultardatos();
  
    //System.out.println(msg);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Ruddy Website Template | Home :: w3layouts</title>
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		 <link rel="stylesheet" href="css/font-awesome.min.css">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		<!---- animated-css ---->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script type="text/javascript" src="js/jquery.corner.js"></script> 
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
		<!---- animated-css ---->
		<!---- start-smoth-scrolling---->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		 <!---- start-smoth-scrolling---->
		<!----webfonts--->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
		<!---//webfonts--->
		<!----start-top-nav-script---->
		<script>
			$(function() {
				var pull 		= $('#pull');
					menu 		= $('nav ul');
					menuHeight	= menu.height();
				$(pull).on('click', function(e) {
					e.preventDefault();
					menu.slideToggle();
				});
				$(window).resize(function(){
	        		var w = $(window).width();
	        		if(w > 320 && menu.is(':hidden')) {
	        			menu.removeAttr('style');
	        		}
	    		});
			});
		</script>
		<!----//End-top-nav-script---->
                
	</head>
	<body>
		<div id="bg">
		<!----- start-header---->
		<div class="container">
			<div id="home" class="header wow bounceInDown" data-wow-delay="0.4s">
					<div class="top-header">
						<div class="logo">
							<a href="#"><img src="images/logo3.PNG" title="log" /></a>
						</div>
						<!--start-top-nav-->
						 <nav class="top-nav">
							<ul class="top-nav">
							
								<li><a href="#about" class="scroll"><label>quienes somos</label></a></li>
								<li><a href="#process" class="scroll"><label>Restaurante</label></a></li>
								<li><a href="#port" class="scroll"><label>Habitaciones</label></a></li>
								<li><a href="#o" class="scroll"><label>Eventos</label></a></li>
								<!--<li><a href="#o" class="scroll"><label>Entreteniento</label></a></li>
-->								<li class="page-scroll"><a href="#contact" class="scroll"><label>Ubicacion</label></a></li>
								<li class="active-join" class="page-scroll"><a href="../login.jsp" >Inicio Sesión</a></li>
							</ul>
							<a href="#" id="pull"><img src="images/nav-icon.png" title="menu" /></a>
						</nav>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!-- //End-header-->
			<!-- banner-info -->
			<div class="banner-info">
				<div class="container">
					<h1 class="wow fadeIn" data-wow-delay="0.5s"><span><%out.print(m.getNombre()); %></span><br/><label><h2><%out.print(m.getSlogan()); %></h2></label></h1>
				<div class="top-banner-grids wow bounceInUp" data-wow-delay="0.4s">
					
					<div class="banner-grid text-center">
						
						<h3 class="fa fa-car fa-3x"> Transporte</h3>
						<h4>>Estacionamiento >Taxis Especiales </h4>
					</div>
					<div class="banner-grid text-center">
						
						<h3 class="fa fa-building"> En este hotel</h3>
						<h4>> Piscina > Gimnasio > Restaurante > Spa</h4>
					</div>
					
					<div class="clearfix"> </div>
				</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
<script type="text/javascript">
        
$( function(){
    var arrImagenes = ['fondo1.jpg', 'fondo2.jpg', 'fondo3.jpg', 'fondo4.jpg', 'fondo5.jpg'];
    var imagenActual = arrImagenes[0];
	var tiempo = 3000;
	var id_contenedor = 'bg';
 
	var i=0;
    setInterval( function(){
        i++;
		if (i==arrImagenes.length){i=0;}
        sigImagen = arrImagenes[i];
		imagenActual = sigImagen;
        cambiarImagenFondo(imagenActual, id_contenedor);
    }, tiempo)
})
 
function cambiarImagenFondo(nuevaImagen, contenedor){
	var contenedor = $('#' + contenedor);
	//cargar imagen primero
	var tempImagen = new Image();
	$(tempImagen).load( function(){
		
document.getElementById("bg").style.background="url('"+tempImagen.src+"') no-repeat 0px 0px";
			
	});
	tempImagen.src = 'images/' + nuevaImagen;
}
        </script>
        
 < Input type = " texto " nombre = " daterange "  / >
 
<Script type = " text / javascript " >
$ ( Función () {
    $ ( ' Entrada [name = "daterange"] ' ). Daterangepicker ({
        
        minDate="0d",
        locale : {
            Formato :  ' AAAA/ MM / DD '
        }
    });
});
        </script>

			<!---- banner-info ---->
			<!---- top-grids ---->
			<!--<div class="top-grids text-center">
				<div class="container">
					<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
						<div class="top-grid">
							<span class="icon1"> </span>
							<h3><a href="#">right strategy</a></h3>
							<label> </label>
							<p>This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin,</p>
						</div>
					</div>
					<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
						<div class="top-grid">
							<span class="icon2"> </span>
							<h3><a href="#">adaptive style</a></h3>
							<label> </label>
							<p>This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin,</p>
						</div>
					</div>
					<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
						<div class="top-grid">
							<span class="icon3"> </span>
							<h3><a href="#">money making</a></h3>
							<label> </label>
							<p>This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin,</p>
						</div>
					</div>
					<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
						<div class="top-grid">
							<span class="icon4"> </span>
							<h3><a href="#">brand keaping</a></h3>
							<label> </label>
							<p>This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin,</p>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>-->
			<!---- top-grids ---->
			<!---- about ---->
			<div id="about" class="about">
				<div class="head-section">
					<div class="container">
						<h3><span>Quienes</span><label> Somos .</label></h3>
					</div>
				</div>
					<!--- about-grids ---->
					<div class="about-grids">
						<div class="col-md-4 about-grid about-grid1 wow fadeInLeft" data-wow-delay="0.4s">
							<div class="about-grid-info">
								<h4><a >Mision</a></h4>
								<p><%out.print(m.getMision()); %></p>
							</div>
							<div class="about-grid-pic">
							<img src="images/about-pic1.jpg" title="name" />
							</div>
						</div>
						<div class="col-md-4 about-grid about-grid2 wow fadeInUp" data-wow-delay="0.4s">
							<div class="about-grid-pic">
							<img src="images/about-pic2.jpg" title="name" />
							</div>
							<div class="about-grid-info">
								<h4><a>Vision</a></h4>
                                                                <p><%out.print(m.getVision()); %></p>
                                                        </div>
						</div>
						<div class="col-md-4 about-grid about-grid1 wow fadeInRight" data-wow-delay="0.4s">
							<div class="about-grid-info">
								<h4><a>Caracteristicas</a></h4>
                                                                <p><%out.print(m.getObj()); %></p>
                                                        </div>
							<div class="about-grid-pic">
							<img src="images/about-pic3.jpg" title="name" />
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<!--- /about-grids ---->
				</div>
			</div>
			<!---- about ----> 
			
			<!--- process --->
			<div id="process" class="process">
				<div class="head-section">
					<div class="container">
						<h3><span></span><label>Restaurante</label></h3>
					</div>
				</div>
				<div class="container">
					<div class="process-grids text-center wow bounce" data-wow-delay="0.4s">
						<div class="col-md-6 process-grid process-grid1 wow bounceInUp" data-wow-delay="0.4s">
							<img src="images/restaurante.jpeg"  WIDTH=70% HEIGHT=175>
							
						</div>
						<div class="col-md-6 process-grid process-grid2 wow bounceInDown" data-wow-delay="0.4s">

                                                    <h4><a><h3>Chimeney's Restaurant</h3><br>Gastronomía: Internacional <br>Horario: <br>Todos los dias 11:00 am a 1:00 am</a></h4>
						</div>
						
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!--- process --->
			<!--- blog ---->
			<div class="blog">
				<div class="head-section">
					<div class="container" id=o>
						<h3><span>Realiza </span><label>tus EVENTOS.</label></h3>
					</div>
				</div>
				<!---- blog-grids ---->
				<div class="blog-grids">
					<div class="container"> 
					<div class="blog-grids-left">
					<% out.print(consul.mostrarEvent());%>
					
					<div class="clearfix"> </div>
				</div>
				<!---- blog-grids ---->
				</div>
			</div>
			<!--- blog ---->
			<!--- portfolio ---->
			<div id="port" class="portfolio">
				<div class="head-section">
					<div class="container">
						<h3>Habitaciones .</h3>
					</div>
				</div>
				<!-- Portfolio -->
			<div id="port" class="portfolio-box">
				
					<!-- start-portfolio-script-->
					<script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
					<script type="text/javascript">
						$(function () {
							var filterList = {
								init: function () {
								
									// MixItUp plugin
									// http://mixitup.io
									$('#portfoliolist').mixitup({
										targetSelector: '.portfolio',
										filterSelector: '.filter',
										effects: ['fade'],
										easing: 'snap',
										// call the hover effect
										onMixEnd: filterList.hoverEffect()
									});				
								
								},
								hoverEffect: function () {
									// Simple parallax effect
									$('#portfoliolist .portfolio').hover(
										function () {
											$(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
											$(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');				
										},
										function () {
											$(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
											$(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');								
										}		
									);				
								
								}
					
							};
							// Run the show!
							filterList.init();
						});	
					</script>
					<div class="container">
						<!----//End-portfolio-script----->
                                                <% out.print(consul.tiposh());%>
                                                
						
					</div>
					<div id="portfoliolist">
					
					<% out.print(consul.habitacionesMostrar());%>
                                        <div class="clearfix"> </div>
			</div>
				</div>
			</div>
		<br>

			<!---- map ---->
			<div id="contact" class="map">
				<div class="map-location">
                                 <iframe src="https://www.google.com/maps/embed/v1/place?q=Cúcuta+-+Transversal+San+Antonio,+Norte+de+Santander,+Colombia&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe>
				</div>
				<div class="contact-info text-center wow fadeInLeft" data-wow-delay="0.3s">
                                    <h4><span><%out.print(m.getNombre());%></span> Hotel</h4>
					<p><span class="map-icon1"> </span><%out.print(m.getDir());%></p>
					<p><span class="map-icon2"> </span>info@together.com</p>
					<p><span class="map-icon3"> </span><%out.print(m.getTel());%>-<%out.print(m.getCel());%></p>
				</div>
			</div>
			<!---- map ---->
			<div class="clearfix"> </div>
			<!-- footer -->
			<div class="footer">
			</div>
		</div>
	</body>
</html>