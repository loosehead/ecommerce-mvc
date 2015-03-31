
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>ECommerce MonyLady</title>

<!-- CSS Reset -->
<link rel="stylesheet" type="text/css" href="css/resetadmin.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/reset.css"
	media="screen" />

<!-- Fluid 960 Grid System - CSS framework -->
<link rel="stylesheet" type="text/css" href="css/grid.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/grid.css"
	media="screen" />

<!-- IE Hacks for the Fluid 960 Grid System -->
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="ie6.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie6.css" media="screen" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="ie.css" tppabs="http://www.xooom.pl/work/magicadmin/css/ie.css" media="screen" /><![endif]-->

<!-- Main stylesheet -->
<link rel="stylesheet" type="text/css" href="css/stylesadmin.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/styles.css"
	media="screen" />

<!-- WYSIWYG editor stylesheet -->
<link rel="stylesheet" type="text/css" href="css/jquery.wysiwyg.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/jquery.wysiwyg.css"
	media="screen" />

<!-- Table sorter stylesheet -->
<link rel="stylesheet" type="text/css" href="css/tablesorter.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/tablesorter.css"
	media="screen" />

<!-- Thickbox stylesheet -->
<link rel="stylesheet" type="text/css" href="css/thickbox.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/thickbox.css"
	media="screen" />

<!-- Themes. Below are several color themes. Uncomment the line of your choice to switch to different color. All styles commented out means blue theme. -->
<link rel="stylesheet" type="text/css" href="css/theme-blue.css"
	tppabs="http://www.xooom.pl/work/magicadmin/css/theme-blue.css"
	media="screen" />
<!--<link rel="stylesheet" type="text/css" href="css/theme-red.css" media="screen" />-->
<!--<link rel="stylesheet" type="text/css" href="css/theme-yellow.css" media="screen" />-->
<!--<link rel="stylesheet" type="text/css" href="css/theme-green.css" media="screen" />-->
<!--<link rel="stylesheet" type="text/css" href="css/theme-graphite.css" media="screen" />-->

<!-- JQuery engine script-->
<script type="text/javascript" src="js/jquery-1.3.2.min.js"
	tppabs="http://www.xooom.pl/work/magicadmin/js/jquery-1.3.2.min.js"></script>

<!-- JQuery WYSIWYG plugin script -->
<script type="text/javascript" src="js/jquery.wysiwyg.js"
	tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.wysiwyg.js"></script>

<!-- JQuery tablesorter plugin script-->
<script type="text/javascript" src="js/jquery.tablesorter.min.js"
	tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.tablesorter.min.js"></script>

<!-- JQuery pager plugin script for tablesorter tables -->
<script type="text/javascript" src="js/jquery.tablesorter.pager.js"
	tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.tablesorter.pager.js"></script>

<!-- JQuery password strength plugin script -->
<script type="text/javascript" src="js/jquery.pstrength-min.1.2.js"
	tppabs="http://www.xooom.pl/work/magicadmin/js/jquery.pstrength-min.1.2.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- JQuery thickbox plugin script -->
<script type="text/javascript" src="js/thickbox.js"
	tppabs="http://www.xooom.pl/work/magicadmin/js/thickbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js" />
<!-- Initiate WYIWYG text area -->
<script type="text/javascript">
			$(function()
			{
			$('#wysiwyg').wysiwyg(
			{
			controls : {
			separator01 : { visible : true },
			separator03 : { visible : true },
			separator04 : { visible : true },
			separator00 : { visible : true },
			separator07 : { visible : false },
			separator02 : { visible : false },
			separator08 : { visible : false },
			insertOrderedList : { visible : true },
			insertUnorderedList : { visible : true },
			undo: { visible : true },
			redo: { visible : true },
			justifyLeft: { visible : true },
			justifyCenter: { visible : true },
			justifyRight: { visible : true },
			justifyFull: { visible : true },
			subscript: { visible : true },
			superscript: { visible : true },
			underline: { visible : true },
            increaseFontSize : { visible : false },
            decreaseFontSize : { visible : false }
			}
			} );
			});
        </script>

<!-- Initiate tablesorter script 
<script type="text/javascript">
			$(document).ready(function() { 
				$("#myTable") 
				.tablesorter({
					// zebra coloring
					widgets: ['zebra'],
					// pass the headers argument and assing a object 
					headers: { 
						// assign the sixth column (we start counting zero) 
						6: { 
							// disable it by setting the property sorter to false 
							sorter: false 
						} 
					}
				}) 
			.tablesorterPager({container: $("#pager")}); 
		}); 
		</script> -->
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


<script src="js/jquery/jquery-1.6.4.min.js" ></script>
<script src="js/jquery/jquery-ui-1.8.16.custom.min.js" ></script>
<link rel="stylesheet" href="js/jquery/jquery-ui-1.8.16.custom.css" type="text/css" media="screen"> 
<script src="js/autocomplete/autocomplete.js" ></script>
<link rel="stylesheet" href="js/autocomplete/autocomplete.css" type="text/css" media="screen">
<script src="js/openflashchart/js/swfobject.js"></script>
<script src="js/openflashchart/js/json/json2.js"></script>
<script src="js/openflashchart/js-ofc-library/ofc.js"></script>
<script src="js/openflashchart/js-ofc-library/open_flash_chart.min.js"></script>
<script src="js/demo.js" ></script>
<script type="text/javascript">
			window.onload = function() { 
				// you can use "datasource/demo.php" if you have PHP installed, to get live data from the demo.csv file
				//editableGrid.onloadXML("datasource/demo.xml"); 
			
			
			
			//editableGrid = new EditableGrid("DemoGridJSON"); 
			//editableGrid.tableLoaded = function() { this.renderGrid("tablecontent", "testgrid"); };
			grid= {"metadata":[
			               	{"name":"name","label":"NAME","datatype":"string","editable":true},
			            	{"name":"firstname","label":"FIRSTNAME","datatype":"string","editable":true},
			            	{"name":"age","label":"AGE","datatype":"integer","editable":true},
			            	{"name":"height","label":"HEIGHT","datatype":"double(m,2)","editable":true},
			            	{"name":"country","label":"COUNTRY","datatype":"string","editable":true,"values":
			            		{
			            			"Europe":{"be":"Belgium","fr":"France","uk":"Great-Britain","nl":"Nederland"},
			            			"America":{"br":"Brazil","ca":"Canada","us":"USA"},
			            			"Africa":{"ng":"Nigeria","za":"South-Africa","zw":"Zimbabwe"}}
			            		},
			            	{"name":"email","label":"EMAIL","datatype":"email","editable":true},
			            	{"name":"freelance","label":"FREELANCE","datatype":"boolean","editable":true},
			            	{"name":"lastvisit","label":"LAST VISIT","datatype":"date","editable":true}
			            ],

			            "data":[
			            	{"id":1, "values":{"country":"uk","age":33,"name":"Duke","firstname":"Patience","height":1.842,"email":"patience.duke@gmail.com","lastvisit":"11\/12\/2002"}},
			            	{"id":2, "values":["Rogers","Denise",59,1.627,"us","rogers.d@gmail.com","","07\/05\/2003"]},
			            	{"id":3, "values":{"name":"Dujardin","firstname":"Antoine","age":21,"height":1.73,"country":"fr","email":"felix.compton@yahoo.fr","freelance":true,"lastvisit":"21\/02\/1999"}},
			            	{"id":4, "values":{"name":"Conway","firstname":"Coby","age":47,"height":1.96,"country":"za","email":"coby@conwayinc.com","freelance":true,"lastvisit":"01\/12\/2007"}},
			            	{"id":5, "values":{"name":"Shannon","firstname":"Rana","age":24,"height":1.56,"country":"nl","email":"ranna.shannon@hotmail.com","freelance":false,"lastvisit":"07\/10\/2009"}},
			            	{"id":6, "values":{"name":"Benton","firstname":"Jasmine","age":61,"height":1.71,"country":"ca","email":"jasmine.benton@yahoo.com","freelance":false,"lastvisit":"13\/01\/2009"}},
			            	{"id":7, "values":{"name":"Belletoise","firstname":"André","age":31,"height":1.84,"country":"be","email":"belletoise@kiloutou.be","freelance":true,"lastvisit":""}},
			            	{"id":8, "values":{"name":"Santa-Maria","firstname":"Martin","age":37,"height":1.80,"country":"br","email":"martin.sm@gmail.com","freelance":false,"lastvisit":"12\/06\/1995"}},
			            	{"id":9, "values":{"name":"Dieumerci","firstname":"Amédé","age":37,"height":1.81,"country":"ng","email":"dieumerci@gmail.com","freelance":true,"lastvisit":"05\/07\/2009"}},
			            	{"id":10,"values":{"name":"Morin","firstname":"Wanthus","age":46,"height":1.77,"country":"zw","email":"morin.x@yahoo.json.com","freelance":false,"lastvisit":"04\/03\/2004"}}
			            ]}
			editableGrid.onloadJSON(grid);
			//editableGrid.renderGrid("tablecontent", "testgrid");
		 
			};	
			
</script>
		


</head>
<body>
	<!-- Header -->
	<div id="header">
		<!-- Header. Status part -->
		<div id="header-status">
			<div class="container_12">
				<div class="grid_8">&nbsp;</div>
				<div class="grid_4">
					<a href="" id="logout"> Logout </a>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<!-- End #header-status -->

		<!-- Header. Main part -->
		<div id="header-main">
			<div class="container_12">
				<div class="grid_12">
					<div id="logo">
						<ul id="nav">
							<li id="current"><a href="">Dashboard</a></li>
							<li><a href="">Articles</a></li>
							<li><a href="">Files</a></li>
							<li><a href="">Profile</a></li>
							<li><a href="">Settings</a></li>
						</ul>
					</div>
					<!-- End. #Logo -->
				</div>
				<!-- End. .grid_12-->
				<div style="clear: both;"></div>
			</div>
			<!-- End. .container_12 -->
		</div>
		<!-- End #header-main -->
		<div style="clear: both;"></div>
		<!-- Sub navigation -->
		<div id="subnav">
			<div class="container_12">
				<div class="grid_12">
					<ul>
						<li><a href="#">link 1</a></li>
						<li><a href="#">link 2</a></li>
						<li><a href="#">link 3</a></li>
						<li><a href="#">link 4</a></li>
						<li><a href="#">link 5</a></li>
					</ul>

				</div>
				<!-- End. .grid_12-->
			</div>
			<!-- End. .container_12 -->
			<div style="clear: both;"></div>
		</div>
		<!-- End #subnav -->
	</div>
	<!-- End #header -->

	<div class="container_12">



		<!-- Dashboard icons -->
		<div class="grid_7">
			<a href="#login-box" class="login-window dashboard-module">
				<img src="images/Crystal_Clear_write.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif"
				width="64" height="64" alt="edit" /> <span>New article</span>
			</a> <a href="" class="dashboard-module"> <img
				src="images/Crystal_Clear_file.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_file.gif"
				width="64" height="64" alt="edit" /> <span>Upload file</span>
			</a> <a href="" class="dashboard-module"> <img
				src="images/Crystal_Clear_files.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_files.gif"
				width="64" height="64" alt="edit" /> <span>Articles</span>
			</a> <a href="" class="dashboard-module"> <img
				src="images/Crystal_Clear_calendar.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_calendar.gif"
				width="64" height="64" alt="edit" /> <span>Calendar</span>
			</a> <a href="" class="dashboard-module"> <img
				src="images/Crystal_Clear_user.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_user.gif"
				width="64" height="64" alt="edit" /> <span>My profile</span>
			</a> <a href="" class="dashboard-module"> <img
				src="images/Crystal_Clear_stats.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_stats.gif"
				width="64" height="64" alt="edit" /> <span>Stats</span>
			</a> <a href="" class="dashboard-module"> <img
				src="images/Crystal_Clear_settings.gif"
				tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_settings.gif"
				width="64" height="64" alt="edit" /> <span>Settings</span>
			</a>
			<div style="clear: both"></div>
		</div>
		<!-- End .grid_7 -->

		<!-- Account overview -->
		<div class="grid_5">
			<div class="module">
				<h2>
					<span>Account overview</span>
				</h2>

				<div class="module-body">

					<p>
						<strong>User: </strong>User X<br /> <strong>Your last
							visit was on: </strong>20 January 2010,<br /> <strong>From IP: </strong>000.000.00.00
					</p>

					<div>
						<div class="indicator">
							<div style="width: 23%;"></div>
							<!-- change the width value (23%) to dynamically control your indicator -->
						</div>
						<p>Your storage space: 23 MB out of 100MB</p>
					</div>

					<div>
						<div class="indicator">
							<div style="width: 100%;"></div>
							<!-- change the width value (100%) to dynamically control your indicator -->
						</div>
						<p>Your bandwidth (January): 1 GB out of 1 GB</p>
					</div>

					<p>
						Need to switch to a bigger plan?<br /> <a href="">click here</a><br />
					</p>

				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<!-- End .grid_5 -->

		<div style="clear: both;"></div>



<div id="wrap">
		<h1>EditableGrid Demo - Grid with pagination<a href="../index.html">Back to menu</a></h1> 
		
			<!-- Feedback message zone -->
			<div id="message"></div>

			<!--  Number of rows per page and bars in chart -->
			<div id="pagecontrol">
				<label for="pagecontrol">Rows per page: </label>
				<select id="pagesize" name="pagesize">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				&nbsp;&nbsp;
				<label for="barcount">Bars in chart: </label>
				<select id="barcount" name="barcount">
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>	
			</div>
		
			<!-- Grid filter -->
			<label for="filter">Filter :</label>
			<input type="text" id="filter"/>
		
			<!-- Grid contents -->
			<div id="tablecontent"></div>
		
			<!-- Paginator control -->
			<div id="paginator"></div>
		
			<!-- Edition zone (to demonstrate the "fixed" editor mode) -->
			<div id="edition"></div>
			
			<!-- Charts zone -->
			<div id="barchartcontent"></div>
			<div id="piechartcontent"></div>
			
		</div>



		
		<!-- Categories list -->
		<div class="grid_6">

			<div class="module">
				<h2>
					<span>Categories</span>
				</h2>

				<div class="module-body">
					<a href="" class="removable">images</a><br /> <a href=""
						class="removable">video</a><br /> <a href="" class="removable">audio</a><br />
					<a href="" class="removable">documents</a><br /> <a href=""
						class="removable">apps</a><br /> <a href="" class="removable">others</a>

					<form action="">
						<fieldset>
							<input type="text" class="input-medium" />&nbsp;&nbsp;<input
								class="submit-green" type="submit" value="Add category" />
						</fieldset>
					</form>
				</div>
			</div>
			<!-- module -->
			<div style="clear: both;"></div>
		</div>
		<!-- End .grid_6 -->

		<!-- To-do list -->
		<div class="grid_6">

			<div class="module">
				<h2>
					<span>To-do list</span>
				</h2>

				<div class="module-body">
					<a href="" class="checkable">check articles for spelling</a><br />
					<a href="" class="checkable">remove old articles</a><br /> <a
						href="" class="checkable">switch to a bigger plan</a><br /> <a
						href="" class="removable completed">write an article</a><br /> <a
						href="" class="removable completed">do maintanance stuff</a><br />


					<form action="">
						<fieldset>
							<input type="text" class="input-medium" />&nbsp;&nbsp;<input
								class="submit-green" type="submit" value="Add item" />
						</fieldset>
					</form>
				</div>
			</div>
			<!-- module -->
			<div style="clear: both;"></div>

		</div>
		<!-- End .grid_6 -->
		<div style="clear: both;"></div>

		<!-- Form elements -->
		<div class="grid_12">

			<div class="module">
				<h2>
					<span>Form</span>
				</h2>

				<div class="module-body">
					<form action="">

						<div>
							<span class="notification n-success">Success notification.</span>
						</div>

						<p>
							<label>Short textfield</label> <input type="text"
								class="input-short" /> <span
								class="notification-input ni-correct">This is correct,
								thanks!</span>
						</p>

						<p>
							<label>Medium textfield</label> <input type="text"
								class="input-medium" /> <span
								class="notification-input ni-error">Sorry, try again.</span>
						</p>


						<p>
							<label>Long textfield</label> <input type="text"
								class="input-long" /><span class="notification-input ni-error">Sorry,
								try again.</span>
						</p>

						<p>
							<label>Short select input</label> <select class="input-short">
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
								<option value="4">Option 4</option>
							</select>
						</p>

						<p>
							<label>Medium select input</label> <select class="input-medium">
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
								<option value="4">Option 4</option>
							</select>
						</p>

						<p>
							<label>Long select input</label> <select class="input-long">
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
								<option value="4">Option 4</option>
							</select>
						</p>

						<p>
							<label>Short text area</label>
							<textarea rows="7" cols="90" class="input-short"></textarea>
						</p>

						<p>
							<label>Medium text area</label>
							<textarea rows="7" cols="90" class="input-medium"></textarea>
						</p>


						<p>
							<label>Long text area</label>
							<textarea rows="7" cols="90" class="input-long"></textarea>
						</p>

						<fieldset>
							<legend>Checkboxes</legend>
							<ul>
								<li><label><input type="checkbox" name="a"
										checked="checked" id="cb1" /> checkbox 1</label></li>
								<li><label><input type="checkbox" name="b" id="cb2" />
										checkbox 2</label></li>
							</ul>
						</fieldset>

						<fieldset>
							<legend>Radio buttons</legend>
							<ul>
								<li><label><input type="radio" name="c"
										checked="checked" /> radio button 1</label></li>
								<li><label><input type="radio" name="c" /> radio
										button 2</label></li>
							</ul>
						</fieldset>

						<fieldset>
							<label>Textarea with WYSIWYG</label>
							<textarea id="wysiwyg" rows="11" cols="90" name="desc">    </textarea>
						</fieldset>

						<fieldset>
							<input class="submit-green" type="submit" value="Submit" /> <input
								class="submit-gray" type="submit" value="Cancel" />
						</fieldset>
					</form>
				</div>
				<!-- End .module-body -->

			</div>
			<!-- End .module -->
			<div style="clear: both;"></div>
		</div>
		<!-- End .grid_12 -->

		<!-- Settings-->
		<div class="grid_6">
			<div class="module">
				<h2>
					<span>Settings</span>
				</h2>

				<div class="module-body">
					<p class="notification n-attention">
						<strong>Running out of space?</strong><br />Just contact us and
						switch to a bigger plan
					</p>

					<div>
						<div class="indicator">
							<div style="width: 23%;">
								<!-- change the width value (23%) to dynamically control your indicator -->
							</div>
						</div>
						<p>Your storage space: 23 MB out of 100MB</p>
					</div>

					<div>
						<div class="indicator">
							<div style="width: 100%;">
								<!-- change the width value (100%) to dynamically control your indicator -->
							</div>
						</div>
						<p>Your bandwidth (January): 1 GB out of 1 GB</p>
					</div>

				</div>
				<!-- End .module-body -->
			</div>
			<!-- End .module -->
		</div>
		<!-- End .grid_6 -->

		<!-- Password -->
		<div class="grid_6">
			<div class="module">
				<h2>
					<span>Password</span>
				</h2>

				<div class="module-body">
					<form action="">
						<p>
							<label>Type in new password</label> <input
								class="input-medium password" type="password" />
						</p>
						<p>
							<label>Repeat password</label> <input type="password"
								class="input-medium" />
						</p>
						<fieldset>
							<input class="submit-green" type="submit" value="Submit" /> <input
								class="submit-gray" type="submit" value="Cancel" />
						</fieldset>
					</form>

				</div>
				<!-- End .module-body -->
			</div>
			<!-- End .module -->
			<div style="clear: both;"></div>
		</div>
		<!-- End .grid_6 -->
		<div style="clear: both;"></div>

		<div class="grid_3">
			<h1>Heading 1</h1>
			<h2>Heading 2</h2>
			<h3>Heading 3</h3>
			<h4>Heading 4</h4>
			<h5>Heading 5</h5>
			<h6>Heading 6</h6>
		</div>
		<!-- End .grid_3 -->


		<div class="grid_3">
			<p>Unordered list:</p>
			<ul class="bullets">
				<li>UL Element 1</li>
				<li>UL Element 2</li>
				<li>UL Element 3</li>
				<li>UL Element 4</li>
				<li>UL Element 5</li>
			</ul>
			<p>Ordered list:</p>
			<ol>
				<li>OL Element 1</li>
				<li>OL Element 2</li>
				<li>OL Element 3</li>
				<li>OL Element 4</li>
				<li>OL Element 5</li>
			</ol>
		</div>
		<!-- End .grid_3 -->

		<div class="grid_6">
			<p>Paragraph text:</p>

			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
				vel nibh sit amet metus lacinia hendrerit. Nullam tempus sem ut quam
				luctus rhoncus. Nullam vitae justo ligula, nec sollicitudin mauris.
				Pellentesque habitant morbi tristique senectus et netus et malesuada
				fames ac turpis egestas. Etiam ut mauris quis sapien adipiscing
				porttitor vitae at mauris. Fusce imperdiet placerat nunc tincidunt
				varius. Quisque tempus, nibh ac tempus faucibus, elit lorem aliquam
				mauris, facilisis ornare nisl sapien eu mi. Vivamus ac tempor nulla.
				Fusce ac lectus sapien. Aliquam commodo urna nec leo tincidunt non
				ultrices augue consequat. Curabitur justo risus, placerat eu auctor
				et, scelerisque vitae velit. Mauris venenatis nisl ut elit congue in
				euismod libero ultrices. Duis tincidunt sagittis velit, in auctor
				elit molestie sit amet.</p>

			<p>Vivamus tellus magna, malesuada ac cursus sed, facilisis non
				ligula. Nam porta ullamcorper nibh id sagittis. Mauris risus nisi,
				dictum eget feugiat in, egestas in diam. Nulla dictum pharetra
				bibendum. Morbi turpis sapien, dignissim congue dignissim in,
				laoreet non felis. Sed elit turpis, interdum cursus vulputate ut,
				consectetur eget odio. Morbi dolor velit, volutpat auctor aliquet
				id, auctor sit amet neque. Curabitur id quam sit amet est sagittis
				posuere. Sed a nunc eros, hendrerit pulvinar felis. Lorem ipsum
				dolor sit amet, consectetur adipiscing elit. Integer eget felis eget
				neque tristique scelerisque sed et magna.</p>

		</div>
		<!-- End .grid_6 -->


		<div style="clear: both;"></div>
	</div>
	<!-- End .container_12 -->
	<div id="login-box" class="login-popup">
		<a href="#" class="close"><img src="images/close_pop.png"
			class="btn_close" title="Close Window" alt="Close" /></a>
		<form method="post" class="signin" action="/SpringMVCExample/SuccessUserImage.jsp">
			<fieldset class="textbox">
				<label class="username"> 
					<span>Categorie</span>
					<select name="categoryName">
						<option value="Bijoux">Bijoux</option>
						<option selected="selected" value="Cosmetiques">Cosmetiques</option>
						<option value="Vetements">Vetements</option>
						<option value="Maroquineries">Maroquineries</option>
					</select>
				</label>
				<label class="username">
					<span>Sous-Categorie</span>
					<select name="subcategoryName">
								<option value="Hommes">Hommes</option>
								<option selected="selected" value="Femmes">Femmes</option>
								<option value="Enfants">Enfants</option>
							</select>
				 </label>
				 <label class="username">
					<span>Nom du Produit</span>
					<input name="productName">
				 </label>
				 
				 <label class="username">
					<span>Price</span>
					<input name="price">
				 </label>
				 
				 <label class="username">
					<span>Description:</span>
					<input name="description"></input>
				 </label>
				 
				 <label class="username">
					<span>Numéro Modele:</span>
					<input name="modelNumber"></input>
				 </label>
				 
				 <label class="username">
					<span>Quantité:</span>
					<input name="qtyOnHand"></input>
				 </label>
				 
				 <label class="username">
					<span>Image:</span>
					<input type="file" name="image"></input>
				 </label>
				
				<button type="submit" class="submit buttonj" >Create</button>
			</fieldset>
		</form>
	</div>

	<!-- Footer -->
	<div id="footer">
		<div class="container_12">
			<div class="grid_12">
				<!-- You can change the copyright line for your own -->
				<p>
					&copy; 2010. <a href="http://www.templatescreme"
						title="Visit For More Free Website Templates">Free Website
						Templates</a>
				</p>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<!-- End #footer -->
</body>
</html>