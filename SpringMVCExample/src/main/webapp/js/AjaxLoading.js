
var personne={id:"", Nom:"", prenom :""};
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
            var respContent = "";
             
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
	this.personne=pers;
	window.location.replace("/monylady/index.jsp");
}


function Ajax_creatUser(){
	
	
	var fisrtN=$("#idUFirstName").val();
	var lastN=$("#idULastName").val();
	var email=$("#idUMail").val();
	var password=$("#idUPwd").val();
	var personneLigh ={"firsName" : fisrtN, "lastName" :lastN, "mail" :email, "password" : password };
	AjaxCaller("createUser", personneLigh, success_login, error_login);
}


function Ajax_loginUser(){
	var login = $("#idLEmail").val();
	var password = $("#idLPwd") .val();
	var dataLogin= {"login" : login, "password" : password};
	AjaxCaller("loginUser", dataLogin, success_login, error_login);
	
}

