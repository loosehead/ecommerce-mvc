
var personne={userId : "", lastName:"", firstName:"", mail :"", password:""};
//localStorage.loginPerson='{}';
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



function Ajax_loginUser(){
	var login = $("#idLEmail").val();
	var password = $("#idLPwd") .val();
	var dataUser ={"firstName" : "", "lastName" :"", "mail" :login, "password" : password };
	AjaxCaller("loginUser", dataUser, success_login, error_login);
	
}

