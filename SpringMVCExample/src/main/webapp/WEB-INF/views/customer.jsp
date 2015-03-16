
<html>

<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<title>Ecommerce</title>
<link rel="stylesheet" type="text/css" href="css/styleAppleMenu.css" />
</head>


<body
	style="background-image: url(images/pattern.png), url(images/2.jpg);">
	<div class="header">

		<span class="right">
			<div id="admin">
				<a href="admin.jsp">S'authentifier en tant que Admin du site</a>
			</div>
		</span>
		<div class="clr"></div>
	</div>

	<div class="header">


		
		<div class="clr"></div>

	</div>


	<div id="wrapper">


		<div id="content">

			<nav>
				<ul id="appleNav">
					<li><a href="http://www.apple.com/" title="Apple"><img
							src="images/logo.png" alt="Apple Logo" /></a></li>
					<li><a href="javascript:buildByCathegorie('cosmetique');"
						title="cosmetique">Cosmetique</a></li>
					<li><a href="javascript:buildByCathegorie('Electromenager');"
						title="Electromenager">Femmes</a></li>
					<li><a href="javascript:buildByCathegorie('vetements');"
						title="vetements">Vêtements</a></li>
					<li><a href="http://www.apple.com/iphone/" title="iPhone">Enfant</a></li>
					<li><a href="http://www.apple.com/ipad/" title="iPad">Bébé</a></li>
					<li>
						<form>
							<input type="text" />
						</form>
					</li>
				</ul>
			</nav>

		</div>
	</div>

	<div id="dragAndDrop">


		<ul id="products">
			<li><a class="item" href="#" id="imac" draggable="true"> <img
					src="images/imac.png" />
					<div>
						<p>
							<strong>iMac</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$1199.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>10</span>
						</p>
					</div>
			</a></li>
			<li><a class="item" href="#" id="iphone" draggable="true"> <img
					src="images/iphone.png" />
					<div>
						<p>
							<strong>iPhone</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$199.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>16</span>
						</p>
					</div>
			</a></li>
			<li><a class="item" href="#" id="appletv" draggable="true">
					<img src="images/appletv.png" />
					<div>
						<p>
							<strong>AppleTV</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$299.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>9</span>
						</p>
					</div>
			</a></li>
			<li><a class="item" href="#" id="dislpay" draggable="true">
					<img src="images/display.png" />
					<div>
						<p>
							<strong>Cinema Display</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$899.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>4</span>
						</p>
					</div>
			</a></li>
			<li><a class="item" href="#" id="nano" draggable="true"> <img
					src="images/nano.png" />
					<div>
						<p>
							<strong>iPod Nano</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$149.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>20</span>
						</p>
					</div>
			</a></li>
			<li><a class="item" href="#" id="macbook" draggable="true">
					<img src="images/macbook.png" />
					<div>
						<p>
							<strong>Macbook</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$1199.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>13</span>
						</p>
					</div>
			</a></li>
			<li><a class="item" href="#" id="mini" draggable="true"> <img
					src="images/mini.png" />
					<div>
						<p>
							<strong>Mac Mini</strong>
						</p>
						<p>
							<strong>Price</strong>: <span>$599.00</span>
						</p>
						<p>
							<strong>Quantity</strong>: <span>18</span>
						</p>
					</div>
			</a></li>
		</ul>
		<div id="cart">
			<h1>Votre Pannier</h1>
			<ul></ul>
			<p id="total">
				<strong>Total:</strong> $<span>0.00</span>
			</p>
			<h2>Déposer ici pour l'ajouter au pannier</h2>
		</div>
		<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script src="js/jquery.ndd.js"></script>

		<script src="js/dragdrop.js"></script>
		<script src="js/displayProducts.js"></script>


	</div>




</body>
</html>