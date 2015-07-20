<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>MonyLady Website</title>
		<meta name="description" content="Simple Multi-Item Slider: Category slider with CSS animations" />
		<meta name="keywords" content="jquery plugin, item slider, categories, apple slider, css animation" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/styleWelcome.css" />
		<script src="js/modernizr.custom.63321.js"></script>
	</head>
	<body>
		<div class="container">	
			<!-- Codrops top bar -->
			<div class="codrops-top clearfix">
				<a href="#"><strong>&laquo; MonyLady.com :</strong>Vente de l'étranger Vers la Mauritanie </a>
				<span class="right"><a href="#"><strong>Bienvenue</strong></a></span>
			</div><!--/ Codrops top bar -->
			<header class="clearfix">
				<h1>MonyLady <span>Welcome</span></h1>
			</header>
			<div class="main">
				<div id="mi-slider" class="mi-slider">
					<ul>
						<li><a href="#"><img src="images/Cosmetiques/1.jpg" alt="img01"><h4>Maquillage Bio</h4></a></li>
						<li><a href="#"><img src="images/Cosmetiques/2.jpg" alt="img02"><h4>Cremes</h4></a></li>
						<li><a href="#"><img src="images/Cosmetiques/3.jpg" alt="img03"><h4>Make up</h4></a></li>
						<li><a href="#"><img src="images/Cosmetiques/42.jpg" alt="img04"><h4>Parfums</h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="images/Accessoires/5.jpg" alt="img05"><h4>Belts</h4></a></li>
						<li><a href="#"><img src="images/Accessoires/6.jpg" alt="img06"><h4>Hats &amp; Caps</h4></a></li>
						<li><a href="#"><img src="images/Accessoires/7.jpg" alt="img07"><h4>Sunglasses</h4></a></li>
						<li><a href="#"><img src="images/Accessoires/8.jpg" alt="img08"><h4>Scarves</h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="images/Montres/9.jpg" alt="img09"><h4>Casual</h4></a></li>
						<li><a href="#"><img src="images/Montres/10.jpg" alt="img10"><h4>Luxury</h4></a></li>
						<li><a href="#"><img src="images/Montres/11.jpg" alt="img11"><h4>Sport</h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><img src="images/Sacs/12.jpg" alt="img12"><h4>Carry-Ons</h4></a></li>
						<li><a href="#"><img src="images/Sacs/13.jpg" alt="img13"><h4>Duffel Bags</h4></a></li>
						<li><a href="#"><img src="images/Sacs/14.jpg" alt="img14"><h4>Laptop Bags</h4></a></li>
						<li><a href="#"><img src="images/Sacs/15.jpg" alt="img15"><h4>Briefcases</h4></a></li>
					</ul>
					<nav>
						<a href="#">Cosmetiques</a>
						<a href="#">Accessoires</a>
						<a href="#">Montres</a>
						<a href="#">Sacs</a>
					</nav>
				</div>
			</div>
		</div><!-- /container -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="js/jquery.catslider.js"></script>
		<script>
			$(function() {

				$( '#mi-slider' ).catslider();

			});
		</script>
	</body>
</html>