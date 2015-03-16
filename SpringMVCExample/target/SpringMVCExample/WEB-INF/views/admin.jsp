
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>


$(document).ready(function() {
	   
	  $('#addProduct').submit(function(event) {
	       
	      var subcategoryName = $('#subcategoryName').val();
	      var productName = $('#productName').val();
	      var modelNumber = $('#modelNumber').val();
	      var description = $('#description').val();
	      var qtyOnHand = $('#qtyOnHand').val();
	      var image = $('#image').val();
	      var price = $('#price').val();
	      var json = { "image" : image, "productName" : productName, "modelNumber" : modelNumber, "description" : description, "description" : description, "price": price};
	       
	    $.ajax({
	        url: $("#").attr( "action"),
	        data: JSON.stringify(json),
	        type: "POST",
	         
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        success: function(product) {
	            var respContent = "";
	             
	            respContent += "<span class='success'>Smartphone was created: [";
	            respContent += product.producer + " : ";
	            respContent += product.description + " : " ;
	            respContent += product.price + "]</span>";
	             
	            $("#sPhoneFromResponse").html(respContent);         
	        }
	    });
	      
	    event.preventDefault();
	  });
	    
	});


</script>
<link rel="stylesheet" type="text/css" href="css/styleAppleMenu.css" />
</head>
<body
	style="background-image: url(images/pattern.png), url(images/2.jpg);">

	<div id="wrapper">


		<div id="content">

			<nav>
			<ul id="appleNav">
				<li><a href="http://www.apple.com/" title="Apple"><img
						src="images/logo.png" alt="Apple Logo" /></a></li>
				<li><a href="addProduct.jsp" title="Ajouter Produit">Ajouter
						des produits</a></li>
				<li><a href="#" title="Supprimer">Supprimer des produits</a></li>
				<li><a href="#" title="Modifier des Produits">Modifier des
						Produits</a></li>
				<li><a href="#" title="Suivi commandes">Suivi de commandes
				</a></li>
				<li>
					<form>
						<input type="text" />
					</form>
				</li>
			</ul>
			</nav>

		</div>






		<form:form method="POST"
			action="/SpringMVCExample/SuccessUserImage.jsp"
			commandname="sPhone">
			<table>
				<tbody>
				<tr>
						<td>Categorie:</td>
						<td><select name="categoryName">
								<option value="Bijoux">Bijoux</option>
								<option selected="selected" value="Cosmetiques">Cosmetiques</option>
								<option value="Vetements">Vetements</option>
								<option value="Maroquineries">Maroquineries</option>
							</select></td>
					</tr>
					<tr>
						<td>Sous-Categorie:</td>
						<td><select name="subcategoryName">
								<option value="Hommes">Hommes</option>
								<option selected="selected" value="Femmes">Femmes</option>
								<option value="Enfants">Enfants</option>
							</select></td>
					</tr>
					
					<tr>
						<td>Nom du produit:</td>
						<td><input name="productName"></input></td>
					</tr>
					<tr>
						<td>Price:</td>
						<td><input name="price"></input></td>
					</tr>
					<tr>
						<td>Numéro Modele:</td>
						<td><input name="modelNumber"></input></td>
					</tr>
					<tr>
						<td>Description:</td>
						<td><input name="description"></input></td>
					</tr>
									<tr>
						<td>Quantité:</td>
						<td><input name="qtyOnHand"></input></td>
					</tr>
									<tr>
						<td>Image:</td>
						<td><input type="file" name="image"></input></td>
					</tr>
					<tr>
						<td><input type="submit" value="Create"></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</form:form>
</body>
</html>