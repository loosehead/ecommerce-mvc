var personne = {
	userId : "",
	lastName : "",
	firstName : "",
	mail : "",
	password : ""
};
// localStorage.loginPerson='{}';
// localStorage.pannier = [];

// var panierStored= localStorage["pannier"];
// if(panierStored == null || panierStored ==""){
//
// localStorage.removeItem("pannier");
// var tempPannier = [];
// localStorage["pannier"] = tempPannier;
// }

function tests() {

}
function AjaxCaller(action, data, function_success, function_error) {

	$.ajax({
		url : "/monylady/" + action,
		data : data,
		type : "GET",
		async : false,

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		success : function(datas) {

			function_success(datas);
			// alert(res.lists);
			/*
			 * console.log(res.data.length); results = res.lists;
			 */

			// $("#sPhoneFromResponse").html(respContent);
		},
		error : function(request, status, errorThrown) {
			function_error(request + "--" + status + "--" + errorThrown);
		}

	});

};

function success_login(pers) {
	personne = pers;
	localStorage.loginPerson = JSON.stringify(pers);
	window.location.replace("/monylady/index.jsp");
}

function error_login(error) {
	alert(error);
}
function error_loadProduct(error) {
	alert(error);
}

function lockout() {
	localStorage.loginPerson = "{}";
	localStorage.pannier = [];
	window.location.replace("/monylady/index.jsp");
}

function Ajax_creatUser() {

	var fisrtN = $("#idUFirstName").val();
	var lastN = $("#idULastName").val();
	var email = $("#idUMail").val();
	var password = $("#idUPwd").val();
	var dataUser = {
		"firstName" : fisrtN,
		"lastName" : lastN,
		"mail" : email,
		"password" : password
	};
	// var dataUser={"user" : personneLigh };
	AjaxCaller("createUser", dataUser, success_login, error_login);

}

function loadByCategory(category, subcategory) {
	var data = {
		"categoryName" : category,
		"subcategoryName" : subcategory
	};
	localStorage.setItem("_borneInflistProduits", 0);
	localStorage.setItem("_borneSuplistProduits", 0);
	AjaxCaller("allProductBySubcategoryName", data, success_loadProduct,
			error_loadProduct);
}

function maj_pannier(produitName) {
	var storedproduits = JSON.parse(localStorage["tempProduit"]);
	for (i = 0, len = storedproduits.length; i < len; i++) {
		if (storedproduits[i].productName == produitName) {
			// var existingEntry = localStorage["pannier"];

			if (localStorage.getItem("pannier") == null
					|| localStorage.getItem("pannier") == "") {
				var noTexistingEntries = [];
				noTexistingEntries.push(storedproduits[i]);
				localStorage.setItem("pannier", JSON
						.stringify(noTexistingEntries));
			} else {
				var existingEntries = JSON.parse(localStorage
						.getItem("pannier"));
				existingEntries.push(storedproduits[i]);
				localStorage
						.setItem("pannier", JSON.stringify(existingEntries));
			}

		}

	}
}

function chargerDetails(produitName) {
	var storedproduits = JSON.parse(localStorage["tempProduit"]);
	var htmlDetails = "";
	for (i = 0, len = storedproduits.length; i < len; i++) {
		if (storedproduits[i].productName == produitName) {
			htmlDetails = htmlDetails
					+ "<div class='col-sm-5'>"
					+ "<div class='view-product'>"
					+ " <img src='images/tempHayat/bigImages/"
					+ storedproduits[i].imageName
					+ "' alt='' />"
					+ "<h3>ZOOM</h3>"
					+ "</div>"
					+ "<div id='similar-product' class='carousel slide' data-ride='carousel'>"
					+ " <!-- Wrapper for slides -->"
					+ " <div class='carousel-inner'>"
					+ "<div class='item active'>"
					+ "<a href=''><img src='images/product-details/similar1.jpg' alt='></a>"
					+ "<a href=''><img src='images/product-details/similar2.jpg' alt=''></a>"
					+ "<a href=''><img src='images/product-details/similar3.jpg' alt=''></a>"
					+ "</div>"
					+ "<div class='item'>"
					+ "<a href=''><img src='images/product-details/similar1.jpg' alt=''></a>"
					+ "<a href=''><img src='images/product-details/similar2.jpg' alt=''></a>"
					+ "<a href=''><img src='images/product-details/similar3.jpg' alt=''></a>"
					+ "</div>"
					+ "<div class='item'>"
					+ "<a href=''><img src='images/product-details/similar1.jpg' alt=''></a>"
					+ "<a href=''><img src='images/product-details/similar2.jpg' alt=''></a>"
					+ "<a href=''><img src='images/product-details/similar3.jpg' alt=''></a>"
					+ "</div>"
					+ "</div>"
					+ " <!-- Controls -->"
					+ " <a class='left item-control' href='#similar-product' data-slide='prev'>"
					+ "<i class='fa fa-angle-left'></i>"
					+ " </a>"
					+ " <a class='right item-control' href='#similar-product' data-slide='next'>"
					+ "<i class='fa fa-angle-right'></i>"
					+ "</a>"
					+ "</div>"
					+ "</div>"
					+ "<div class='col-sm-7'>"
					+ "<div class='product-information'><!--/product-information-->"
					+ "<img src='images/product-details/new.jpg' class='newarrival' alt='' />"
					+ "<h2>Anne Klein Sleeveless Colorblock Scuba</h2>"
					+ "<p>Web ID: 1089772</p>"
					+ "<img src='images/product-details/rating.png' alt='' />"
					+ "<span>"
					+ "<span>"+ storedproduits[i].price
					+ "€</span>"
					+ "<label>Quantity:</label>"
					+ "<input type='text' value='3' />"
					+ "<button type='button' class='btn btn-fefault cart'>"
					+ "<i class='fa fa-shopping-cart'></i>"
					+ "Add to cart"
					+ "</button>"
					+ "</span>"
					+ "<p><b>Availability:</b> In Stock</p>"
					+ "<p><b>Condition:</b> New</p>"
					+ "<p><b>Brand:</b> E-SHOPPER</p>"
					+ "<a href=''><img src='images/product-details/share.png' class='share img-responsive'  alt='' /></a>"
					+ "</div><!--/product-information-->" + "</div>"
					+ "</div><!--/product-details-->";
			break;
		}
		

	}
	$("#prodItems").html(htmlDetails);
}

function Ajax_loginUser() {
	var login = $("#idLEmail").val();
	var password = $("#idLPwd").val();
	var dataUser = {
		"firstName" : "",
		"lastName" : "",
		"mail" : login,
		"password" : password
	};
	AjaxCaller("loginUser", dataUser, success_login, error_login);

}

function success_loadProduct(listProducts) {

	if (parseInt(localStorage.getItem("_borneSuplistProduits")) + 6 > listProducts.length) {
		localStorage.setItem("_borneSuplistProduits", parseInt(localStorage
				.getItem("_borneSuplistProduits"))
				+ (listProducts.length - parseInt(localStorage
						.getItem("_borneSuplistProduits"))));
	} else {
		localStorage.setItem("_borneSuplistProduits", parseInt(localStorage
				.getItem("_borneSuplistProduits")) + 6);
	}
	var taille = 0;
	if (parseInt(localStorage.getItem("_borneSuplistProduits")) == listProducts.length) {
		taille = listProducts.length;
		$(".next_prod").html("revenir au debut");

		localStorage.setItem("_borneSuplistProduits", 0);
	} else {
		taille = parseInt(localStorage.getItem("_borneSuplistProduits"))
				% listProducts.length;
	}

	if (parseInt(localStorage.getItem("_borneInflistProduits")) > taille) {
		localStorage.setItem("_borneInflistProduits", 0);
	}
	// localStorage.tempProduit = listProducts;
	var borneInf = parseInt(localStorage.getItem("_borneInflistProduits"));
	localStorage["tempProduit"] = JSON.stringify(listProducts);
	var _htmlProductList = '<h2 class="title text-center">Features Items</h2>';
	for (i = borneInf; i < taille; i++) {
		var p = listProducts[i];
		_htmlProductList = _htmlProductList
				+ "<div class='col-sm-4' id='"
				+ p.productName
				+ "'>"
				+ "<div class='product-image-wrapper'>"
				+ "<div class='single-products'>"
				+ "<div class='productinfo text-center'>"
				+ "<img src='images/tempHayat/bigImages/"
				+ p.imageName
				+ "' alt=''/>"
				+ "<h2>"
				+ p.price
				+ "€"
				+ "</h2>"
				+ "<p>"
				+ p.description
				+ "</p>"
				+ "<a href='javascript:maj_pannier(\""
				+ p.productName
				+ "\");' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Commander</a>"
				+ "</div>"
				+ "</div>"
				+ "<div class='choose'>"
				+ "<ul class='nav nav-pills nav-justified'>"
				+ "<li><a href='javascript:maj_pannier(\""
				+ p.productName
				+ "\")'><i class='fa fa-plus-square'></i>Add to wishlist</a></li>"
				+ "<li><a href='javascript:chargerDetails(\"" + p.productName
				+ "\")'><i class='fa fa-plus-square'></i>Détails</a></li>"
				+ "</ul></div></div>" + "</div>";

	}

	localStorage.setItem("_borneInflistProduits", taille);
	$("#prodItems").html(_htmlProductList);

}

function showNextProducts() {
	$(".prev_prod").show();
	success_loadProduct(JSON.parse(localStorage.getItem("tempProduit")));
}

function showPrevProducts() {
	$(".next_prod").show();
	localStorage.setItem("_borneInflistProduits", 0);
	localStorage.setItem("_borneSuplistProduits", 0);
	success_loadProduct(JSON.parse(localStorage.getItem("tempProduit")));
}
function updatePannier(contentPan) {
	var _htmlProductListPan = "";
	for (i = 0, len = contentPan.length; i < len; i++) {
		var p = contentPan[i];
		_htmlProductListPan = _htmlProductListPan
				+ "<tr>"
				+ "<td class='cart_product'>"
				+ "<a href=''><img src='images/tempHayat/smallImages/"
				+ p.imageName
				+ "' alt=''></a>"
				+ "</td>"
				+ "<td class='cart_description'>"
				+ "<h4><a href=''>Colorblock Scuba</a></h4>"
				+ "<p>"
				+ p.description
				+ "</p>"
				+ "</td>"
				+ "<td class='cart_price'>"
				+ "<p>"
				+ p.price
				+ "</p>"
				+ "</td>"
				+ "<td class='cart_quantity'>"
				+ "<div class='cart_quantity_button'>"
				+ "<a class='cart_quantity_up' href=''> + </a>"
				+ "<input class='cart_quantity_input' type='text' name='quantity' value='1' autocomplete='off' size='2'>"
				+ "<a class='cart_quantity_down' href=''> - </a>"
				+ "</div>"
				+ "</td>"
				+ "<td class='cart_total'>"
				+ "<p class='cart_total_price'>"
				+ p.price
				+ "</p>"
				+ "</td>"
				+ "<td class='cart_delete'>"
				+ "<a class='cart_quantity_delete' href=''><i class='fa fa-times'></i></a>"
				+ "</td>" + "</tr>";
	}
	$("#listProdBuy").html(_htmlProductListPan);
}
