<%-- 
    Document   : index
    Created on : 9/03/2016, 10:02:38 AM
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
<!DOCTYPE>
<html lang="en">
<head>
	<title>Hotel</title>
	<meta charset="utf-8">
	<meta name="author" content="pixelhint.com">
	<meta name="description" content="La casa free real state fully responsive html5/css3 home page website template"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./prin/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./prin/css/responsive.css">

	<script type="text/javascript" src="./prin/js/jquery.js"></script>
	<script type="text/javascript" src="./prin/js/main.js"></script>
</head>
<body>

	<section class="hero">
		<header>
			<div class="wrapper">
				<a href="#"><img src="./prin/img/logo.png" class="logo" alt="" title=""/></a>
				<a href="#" class="hamburger"></a>
				<nav>
					<ul>
						<li><a href="#">Inicio</a></li>
						<li><a href="#">Habitaciones</a></li>
						<li><a href="#">Servicios</a></li>
						<li><a href="#">Contacto</a></li>
					</ul>
					<a href="login.jsp" class="login_btn">Login</a>
				</nav>
			</div>
		</header><!--  end header section  -->

			<section class="caption">
                            <h2 class="caption"><%out.print(m.getNombre()); %></h2>
				<h3 class="properties"><%out.print(m.getSlogan()); %></h3>
			</section>
	</section><!--  end hero section  -->


	<section class="search">
		<div class="wrapper">
			<form action="#" method="post">
				<input type="text" id="search" name="search" placeholder="What are you looking for?"  autocomplete="off"/>
				<input type="submit" id="submit_search" name="submit_search"/>
			</form>
			<a href="#" class="advanced_search_icon" id="advanced_search_btn"></a>
		</div>

		<div class="advanced_search">
			<div class="wrapper">
				<span class="arrow"></span>
				<form action="#" method="post">
					<div class="search_fields">
						<input type="text" class="float" id="check_in_date" name="check_in_date" placeholder="Check In Date"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="check_out_date" name="check_out_date" placeholder="Check Out Date"  autocomplete="off">
					</div>
					<div class="search_fields">
						<input type="text" class="float" id="min_price" name="min_price" placeholder="Min. Price"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="max_price" name="max_price" placeholder="Max. price"  autocomplete="off">
					</div>
					<input type="text" id="keywords" name="keywords" placeholder="Keywords"  autocomplete="off">
					<input type="submit" id="submit_search" name="submit_search"/>
				</form>
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->


	<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
                            <%
                                //out.print(consul.habitacionesMostrar());
                                %>
			</ul>
			<div class="more_listing">
				<a href="#" class="more_listing_btn">View More Listings</a>
			</div>
		</div>
	</section>	<!--  end listing section  -->

	<footer>
		<div class="wrapper footer">
			<ul>
				<li class="links">
					<ul>
						<li><a href="#">Contacto: </a></li>
						<li><a>Dirección: <%out.print(m.getDir()); %></a></li>
						<li><a>Telefono: <%out.print(m.getTel()); %></a></li>
						<li><a>Celular: <%out.print(m.getCel()); %></a></li>
						<li class="about">
					
					<ul>
						<li><a href="http://facebook.com/pixelhint" class="facebook" target="_blank"></a></li>
						<li><a href="http://twitter.com/pixelhint" class="twitter" target="_blank"></a></li>
						<li><a href="http://plus.google.com/+Pixelhint" class="google" target="_blank"></a></li>
						<li><a href="#" class="skype"></a></li>
					</ul>
				</li>
					</ul>
				</li>
			</ul>
		</div>

		<div class="copyrights wrapper">
			Copyright © 2015 <a href="http://pixelhint.com" target="_blank" class="ph_link" title="Download more free Templates">Hotel casa blanca</a>. All Rights Reserved.
		</div>
	</footer><!--  end footer  -->
	
</body>
</html>