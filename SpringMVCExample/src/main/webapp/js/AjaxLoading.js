
var personne={userId : "", lastName:"", firstName:"", mail :"", password:""};
//localStorage.loginPerson='{}';
localStorage.pannier = {liste_produit:[]};
function AjaxCaller (action, data, function_success, function_error) {
    
    
    
    $.ajax({
        url: "/monylady/"+action,
        data: data,
        type: "GET",
        async : false,
         
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
        success: function(datas) {            
             
            function_success(datas);
        	//alert(res.lists);
        	 /* console.log(res.data.length);
            results = res.lists;*/
             
            //$("#sPhoneFromResponse").html(respContent);         
        },
        error: function (request, status, errorThrown) {
        	function_error(request+"--"+status+"--"+errorThrown);
        }
        
    });

};


function success_login(pers){
	personne = pers;
	localStorage.loginPerson = JSON.stringify(pers);
	window.location.replace("/monylady/index.jsp");
}

function error_login(error){
	alert(error);
} 

function lockout(){
	localStorage.loginPerson = "{}";
	window.location.replace("/monylady/index.jsp");
}

function Ajax_creatUser(){
	
	var fisrtN=$("#idUFirstName").val();
	var lastN=$("#idULastName").val();
	var email=$("#idUMail").val();
	var password=$("#idUPwd").val();
	var dataUser ={"firstName" : fisrtN, "lastName" :lastN, "mail" :email, "password" : password };
	//var dataUser={"user" : personneLigh };
	AjaxCaller("createUser", dataUser, success_login, error_login);

}

function maj_pannier(produit){
	localStorage.pannier.liste_produit.push(produit);		
}

function Ajax_loginUser(){
	var login = $("#idLEmail").val();
	var password = $("#idLPwd") .val();
	var dataUser ={"firstName" : "", "lastName" :"", "mail" :login, "password" : password };
	AjaxCaller("loginUser", dataUser, success_login, error_login);
	
}


function success_loadProduct(listProducts){
	
//	document.getElementById("listProducts").innerHTML +="
//		<div class="col-sm-4" id="listProducts">
//	<div class="product-image-wrapper">
//		<div class="single-products">
//				<div class="productinfo text-center">
//					<img src="images/home/product1.jpg" alt="" />
//					<h2>$56</h2>
//					<p>Easy Polo Black Edition</p>
//					<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Commander</a>
//				</div>
//				<div class="product-overlay">
//					<div class="overlay-content">
//						<h2>$56</h2>
//						<p>Easy Polo Black Edition</p>
//						<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Commander</a>
//					</div>
//				</div>
//		</div>
//		<div class="choose">
//			<ul class="nav nav-pills nav-justified">
//				<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
//				<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
//			</ul>
//		</div>
//	</div>
//</div>"
//	
} 

