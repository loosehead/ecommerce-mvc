var personne = {
	userId : "",
	lastName : "",
	firstName : "",
	mail : "",
	password : ""
};
// localStorage.loginPerson='{}';
//localStorage.pannier =  [];

//var panierStored= localStorage["pannier"];
//if(panierStored == null || panierStored ==""){
//
//	localStorage.removeItem("pannier");
//	var tempPannier = [];
//	localStorage["pannier"] =  tempPannier;
//}

	


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

function maj_pannier(produitName) {
	var storedproduits = JSON.parse(localStorage["tempProduit"]);
	for (i = 0, len =storedproduits.length; i < len; i++) {
		if(storedproduits[i].productName == produitName){
			//var existingEntry = localStorage["pannier"];
			
		    if(localStorage.getItem("pannier") == null || localStorage.getItem("pannier") =="" ) {
		    	var noTexistingEntries = [];
		    	noTexistingEntries.push(storedproduits[i]);
		    	localStorage.setItem("pannier", JSON.stringify(noTexistingEntries))
		    } else{
		    	var existingEntries = JSON.parse(localStorage.getItem("pannier"));
		    	existingEntries.push(storedproduits[i]);
			    localStorage.setItem("pannier", JSON.stringify(existingEntries));		    	
		    }
		    
		    
		}
		
	}
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

	//localStorage.tempProduit = listProducts; 
	localStorage["tempProduit"] = JSON.stringify(listProducts)
	var _htmlProductList = '<h2 class="title text-center">Features Items</h2>';
	for (i = 0, len = listProducts.length; i < len; i++) {
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
				+ "<li><a href='#'><i class='fa fa-plus-square'></i>Add to compare</a></li>"
				+ "</ul></div></div>" + "</div>";

	}

	$("#prodItems").html(_htmlProductList);

}

function updatePannier(contentPan) {
	var _htmlProductListPan ="";
	for (i = 0, len = contentPan.length; i < len; i++) {
		var p = contentPan[i];
		_htmlProductListPan = _htmlProductListPan
		+"<tr>"
				+ "<td class='cart_product'>"
				+ "<a href=''><img src='images/tempHayat/smallImages/"+p.imageName+"' alt=''></a>"
				+ "</td>"
				+ "<td class='cart_description'>"
				+ "<h4><a href=''>Colorblock Scuba</a></h4>"
				+ "<p>"+p.description+"</p>"
				+ "</td>"
				+ "<td class='cart_price'>"
				+ "<p>"+p.price+"</p>"
				+ "</td>"
				+ "<td class='cart_quantity'>"
				+ "<div class='cart_quantity_button'>"
				+ "<a class='cart_quantity_up' href=''> + </a>"
				+ "<input class='cart_quantity_input' type='text' name='quantity' value='1' autocomplete='off' size='2'>"
				+ "<a class='cart_quantity_down' href=''> - </a>"
				+ "</div>"
				+ "</td>"
				+ "<td class='cart_total'>"
				+ "<p class='cart_total_price'>"+p.price+"</p>"
				+ "</td>"
				+ "<td class='cart_delete'>"
				+ "<a class='cart_quantity_delete' href=''><i class='fa fa-times'></i></a>"
				+ "</td>" + "</tr>";
	}
	$("#listProdBuy").html(_htmlProductListPan);
}





