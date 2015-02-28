
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link rel="stylesheet" type="text/css" href="css/styleAppleMenu.css"/>
</head>
<body style="background-image: url(images/pattern.png), url(images/2.jpg);">

<div id="wrapper">
    
        
    <div id="content">
		
        <nav>
            <ul id="appleNav">
                <li><a href="http://www.apple.com/" title="Apple"><img src="images/logo.png" alt="Apple Logo" /></a></li>
                <li><a href="javascript:buildByCathegorie('cosmetique');" title="cosmetique">Cosmetique</a></li>
                <li><a href="javascript:buildByCathegorie('Electromenager');" title="Electromenager">Electromenager</a></li>
                <li><a href="javascript:buildByCathegorie('vetements');" title="vetements">Vêtements</a></li>
                <li><a href="http://www.apple.com/iphone/" title="iPhone">iPhone</a></li>
                <li><a href="http://www.apple.com/ipad/" title="iPad">iPad</a></li>
                <li><a href="http://www.apple.com/itunes/" title="iTunes">iTunes</a></li>
                <li><a href="http://www.apple.com/support/" title="Support">Support</a></li>
                <li>
                    <form>
                        <input type="text" />
                    </form>
                </li>
            </ul>
        </nav>
		
    </div>

	<s:actionerror />
	<div class="container">
		<section id="content">
			<s:form action="loginAction" method="post">
	
				<h1>Login</h1>
				<div>
					<input type="text" name="login" placeholder="login" required="" id="login" />
				</div>
				<div>
					<input type="password" name="password"placeholder="Password" required="" id="password" />
				</div>
				<div>
					<input type="submit" value="Se connecter" /> <a href="#">Lost your
						password?</a> <a href="#">Register</a>
				</div>
				
			</s:form>
		</section>		<!-- content -->
	</div>	<!-- container -->
</body>
</html>