<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<html>

<head>

<title>Ecommerce</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/styleAppleMenu.css" />
<link rel="stylesheet" type="text/css" href="css/stylesadmin.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/styles.css"
	media="screen" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="js/jquery.ndd.js"></script>

<script src="js/dragdrop.js"></script>
<script src="js/displayProducts.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  $('#login-trigger').click(function(){
	    $(this).next('#login-content').slideToggle();
	    $(this).toggleClass('active');          
	    
	    if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
	      else $(this).find('span').html('&#x25BC;')
	    })
	});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('a.login-window').click(function() {
	    
	            //Getting the variable's value from a link 
	    var loginBox = $(this).attr('href');

	    //Fade in the Popup
	    $(loginBox).fadeIn(300);
	    
	    //Set the center alignment padding + border see css style
	    var popMargTop = ($(loginBox).height() + 24) / 2; 
	    var popMargLeft = ($(loginBox).width() + 24) / 2; 
	    
	    $(loginBox).css({ 
	        'margin-top' : -popMargTop,
	        'margin-left' : -popMargLeft
	    });
	    
	    // Add the mask to body
	    $('body').append('<div id="mask"></div>');
	    $('#mask').fadeIn(300);
	    
	    return false;
	});

	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
	    $('#mask').remove();  
	}); 
	return false;
	});
	});
</script>



<!--  fonction de mappage avec l'objet Person de la base de données -->

<script>

$(document).ready(function() {
	   
	  $('#saveClient').submit(function(event) {
	       
	      var lastName = $('#lastName').val();
	      var firstName = $('#firstName').val();
	      var login = $('#email').val();
	      var password = $('#password').val();
	      var question = 1;// $("#question").children('option:selected').index();
	      var securityAnswer = $('#securityAnswer').val();

	      var jsont = { "lastName" : lastName, "firstName" : firstName, "password" : password, "login" : login,  "question" : question, "securityAnswer": securityAnswer};
	       
	    $.ajax({
	        url: "/SpringMVCExample/savePersont.jsp", //$("#").attr("action"),
	        data: JSON.stringify(jsont),
	        type: "POST",
	         
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        success: function(personLigth) {
	                     
	        }
	    });
	      
	    event.preventDefault();
	  });
	  
	
	
	$("#question").change(function(){
	
		$('#hidenAnswer').css('display', 'block');
		
	});

});

</script>

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
					<form id="saveClient" method="post" class="signin" action="/SpringMVCExample/savePersont.jsp">
						<fieldset class="textbox">
						 <label class="username"> <span>Prenom</span> <input
								id="lastName" name="lastName" placeholder="Your lastName"
								required>
							</label>
							<label class="username"> 
								<span>Nom</span> 
								<input 	id="firstName" name="firstName" placeholder="Your firstName"
								required>
							</label>
							 <label class="username"> 
							 	<span>Email</span>
							  	<input id="email" type="email" name="mail" 	placeholder="Your email address" required>
							</label> 
							<label class="username"> 
								<span>Mot de passe</span> 
								<input id="password" type="password" name="password" placeholder="password" required>
							</label> 
							<label class="username"> 
								<span>Question de sécurité</span> 
								<select name="question" id="question">
									<option value="Q0" selected="selected">---- Selectionnez une question ----</option>
									<option value="Q1">Votre surnom?</option>
									<option value="Q2">nom de votre meilleur ami ?</option>
									<option value="Q3">nom de jeune fille de votre maman?</option>
								</select>
							</label>
							<label class="username" id ="hidenAnswer"> <span>answer</span> <input
								id="securityAnswer" placeholder="answer" name="securityAnswer" required>
							</label>
							<button type="submit" class="submit buttonj">Create</button>
						</fieldset>
					</form>
				</div></li>
		</ul>
	</nav>

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
						title="cosmetique">Cosmetique</a>
						<ul>
							<li><a href="#">Hommes</a></li>
							<li><a href="#">femmes</a></li>
							<li><a href="#">Enfants</a></li>
						</ul></li>
					<li><a href="javascript:buildByCathegorie('Electromenager');"
						title="Electromenager">Femmes</a></li>
					<li><a href="javascript:buildByCathegorie('vetements');"
						title="vetements">Vêtements</a></li>
					<li><a href="http://www.apple.com/iphone/" title="iPhone">Enfant</a></li>
					<li><a href="http://www.apple.com/ipad/" title="iPad">Bébé</a></li>
					<li class="appleclass">
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


	</div>




</body>
</html>