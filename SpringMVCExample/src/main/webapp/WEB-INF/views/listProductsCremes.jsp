<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MonyLady Website</title>
<meta name="description"
	content="Simple Multi-Item Slider: Category slider with CSS animations" />
<meta name="keywords"
	content="jquery plugin, item slider, categories, apple slider, css animation" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/styleWelcome.css" />
<link rel="stylesheet" type="text/css" href="css/styleAppleMenu.css" />
<link rel="stylesheet" type="text/css" href="css/stylesadmin.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/styles.css"
	media="screen" />
<script src="js/modernizr.custom.63321.js"></script>
</head>
<body>


	

	<div class="container">
		<!-- Codrops top bar -->
		<div class="codrops-top clearfix">
			<a href="#"><strong> MonyLady.com :</strong>Vente de
				l'étranger Vers la Mauritanie </a> <span class="right"><a
				href="#"><strong>Bienvenue</strong></a></span>
		</div>
		<!--/ Codrops top bar -->
		<header class="clearfix">
			<h1>
				MonyLady <span>Welcome</span>
			</h1>
		</header>
		
		
		<nav>
		<ul>
			<li id="login"><a id="login-trigger" href="#"> Connecter <span>▼</span>
			</a>
				<div id="login-content">
					<form>
						<fieldset id="inputs">
							<input id="username" type="email" name="Email"
								placeholder="votre adresse email " required> <input
								id="password" type="password" name="mot de passe"
								placeholder="Password" required>
						</fieldset>
						<fieldset id="fff">
							<input type="submit" id="submit" value="Connecter"> <label><input
								type="checkbox" checked="checked"> Keep me signed in</label>
						</fieldset>
					</form>
				</div></li>
			<li id="signup"><a href="#login-box"
				class="login-window dashboard-module">Ma première connexion</a>
				<div id="login-box" class="login-popup">
					<a href="#" class="close"><img src="images/close_pop.png"
						class="btn_close" title="Close Window" alt="Close" /></a>
					<form id="saveClient" method="post" class="signin"
						action="/monylady/savePersont.jsp">
						<fieldset class="textbox">
							<label class="username"> <span>Prenom</span> <input
								id="lastName" name="lastName" placeholder="Your lastName"
								required>
							</label> <label class="username"> <span>Nom</span> <input
								id="firstName" name="firstName" placeholder="Your firstName"
								required>
							</label> <label class="username"> <span>Email</span> <input
								id="email" type="email" name="mail"
								placeholder="Your email address" required>
							</label> <label class="username"> <span>Mot de passe</span> <input
								id="password" type="password" name="password"
								placeholder="password" required>
							</label> <label class="username"> <span>Question de
									sécurité</span> <select name="question" id="question">
									<option value="Q0" selected="selected">----
										Selectionnez une question ----</option>
									<option value="Q1">Votre surnom?</option>
									<option value="Q2">nom de votre meilleur ami ?</option>
									<option value="Q3">nom de jeune fille de votre maman?</option>
							</select>
							</label> <label class="username" id="hidenAnswer"> <span>answer</span>
								<input id="securityAnswer" placeholder="answer"
								name="securityAnswer" required>
							</label>
							<button type="submit" class="submit buttonj">Create</button>
						</fieldset>
					</form>
				</div></li>
		</ul>
	
	<!-- /container -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="js/jquery.catslider.js"></script>
	<script>
			$(function() {

				$( '#mi-slider' ).catslider();

			});
		</script>
</body>
</html>