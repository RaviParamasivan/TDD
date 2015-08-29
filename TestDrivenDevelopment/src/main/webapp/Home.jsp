<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 

	var _scroll = true, _timer = false, _floatbox = $("#contact_form"), _floatbox_opener = $(".contact-opener") ;
	//_floatbox.css("right", "-407px"); //initial contact form position
	
	//Contact form Opener button
	_floatbox_opener.click(function(){
		if (_floatbox.hasClass('visiable')){
            _floatbox.animate({"right":"-407px"}, {duration: 300}).removeClass('visiable');
        }else{
           _floatbox.animate({"right":"0px"},  {duration: 300}).addClass('visiable');
        }
	});
	
	//Effect on Scroll
	$(window).scroll(function(){
		if(_scroll){
			_floatbox.animate({"top": "100px"},{duration: 300});
			_scroll = false;
		}
		if(_timer !== false){ clearTimeout(_timer); }           
			_timer = setTimeout(function(){_scroll = true; 
			_floatbox.animate({"top": "100px"},{easing: "linear"}, {duration: 500});}, 400); 
	});
	
	
	//Ajax form submit
    $("#submit_btn").click(function() { 
        var proceed = true;
        //simple validation at client's end
        //loop through each field and we simply change border color to red for invalid fields       
        $("#contact_form input[required=true], #contact_form textarea[required=true]").each(function(){
            $(this).css('border-color',''); 
            if(!$.trim($(this).val())){ //if this field is empty 
                $(this).css('border-color','red'); //change border color to red   
                proceed = false; //set do not proceed flag
            }
            //check invalid email
            var email_reg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/; 
            if($(this).attr("type")=="email" && !email_reg.test($.trim($(this).val()))){
                $(this).css('border-color','red'); //change border color to red   
                proceed = false; //set do not proceed flag              
            }   
        });
       
        if(proceed) //everything looks good! proceed...
        {
            //get input field values data to be sent to server
            post_data = {
                'user_name'     : $('input[name=name]').val(), 
                'user_email'    : $('input[name=email]').val(), 
                'country_code'  : $('input[name=phone1]').val(), 
                'phone_number'  : $('input[name=phone2]').val(), 
                'subject'       : $('select[name=subject]').val(), 
                'msg'           : $('textarea[name=message]').val()
            };
            
            //Ajax post data to server
            $.post('contact_me.php', post_data, function(response){  
                if(response.type == 'error'){ //load json data from server and output message     
                    output = '<div class="error">'+response.text+'</div>';
                }else{
                    output = '<div class="success">'+response.text+'</div>';
                    //reset values in all input fields
                    $("#contact_form  input[required=true], #contact_form textarea[required=true]").val(''); 
                }
                $("#contact_form #contact_results").hide().html(output).slideDown();
            }, 'json');
        }
    });
    
    //reset previously set border colors and hide all message on .keyup()
    $("#contact_form  input[required=true], #contact_form textarea[required=true]").keyup(function() { 
        $(this).css('border-color',''); 
        $("#result").slideUp();
    });
	
});

</script>

<script>
 function updateFeedback(){
	 
	 if($("#feedBackTitle").val() == ""){
		 alert("Please enter the title");
		 return false ;
	 }else 	 if($("#feedBackGroup").val() == ""){
		 alert("Please select the category");
		 return false ;
	 }else 	 if($("#feedBackDesc").val() == ""){
		 alert("Please enter the Message ");
		 return false ;
	 }	 
	
	 var data={"feedBackTitle":$("#feedBackTitle").val(),"feedBackDesc":$("#feedBackDesc").val(),"feedBackGroup":$("#feedBackGroup").val()};
	 
	 $.ajax({url: "/index.jsp?jsonStr="+JSON.stringify(data), success: function(result){
         alert(result);
     }});
} 
</script>

<style>
body {
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
    text-align: left;
    margin: 0px auto;
    padding: 0px;
    line-height: 1.6em;
    background-color: #fff;
    color: #333;
}
a:link,a:hover,a:visited{ color:#333; text-decoration:none}

#NavMenu {
	width: 1000px;
	height:40px;
	margin: 0 auto;
	background-color:#FE980F;
}
#NavMenu ul {
	margin: 0;
	padding: 0;
	list-style: none;
	float:left
}
#NavMenu li {
	display: inline;
}
#NavMenu a {
	display: block;
	float: left;
	height: 40px;
	padding-left:23px;
	padding-right:23px;
	text-decoration: none;
	font-size: 13px;
	font-weight:700;
	color: #fff;
	line-height:40px
}
#NavMenu a:hover {
	color: #fff;
	background-color:#333;
}
#NavMenu .active a {
	background-color:#333;
	color: #FFFFFF;
}
.text-center{ text-align:center}

.shop-menu ul{ float:right}

.shop-menu ul li {
    display: inline-block;
    padding-left: 15px;
    padding-right: 15px;
}
.navbar-nav > li {
    float: left;
}
.nav > li {
    position: relative;
    display: block;
}

.col-sm-4{ width:214px; margin:0 10px}
ul.nav-justified { padding-left:0px}
.nav-justified li{ text-align:center}



.single-products {
  position: relative;
  margin-top:20px
}

.new, .sale {
  position: absolute;
  top: 0;
  right: 0;
}

.productinfo h2{
	color: #FE980F;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: 700;
}
.product-overlay h2{
	color: #fff;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: 700;
}


.productinfo p{
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 400;
  color: #696763;
}

.productinfo img{
  width: 100%;
}

.productinfo{
 position:relative;
}

.product-overlay {
  background:#FE980F;
  top: 0;
  display: none;
  height: 0;
  position: absolute;
  transition: height 500ms ease 0s;
  width: 100%;
  display: block;
  opacity:;
}

.single-products:hover .product-overlay {
  display:block;
  height:100%;
}


.product-overlay .overlay-content {
  bottom: 0;
  position: absolute;
  bottom: 0;
  text-align: center;
  width: 100%;
}

.product-overlay .add-to-cart {
  background:#fff;
  border: 0 none;
  border-radius: 0;
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 25px;
}

.product-overlay .add-to-cart:hover {
  background:#fff;
  color: #FE980F;
}


.product-overlay p{
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 400;
  color: #fff;
}



.add-to-cart {
  background:#F5F5ED;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 25px;
  padding:10px;
}

.add-to-cart:hover {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
}

.add-to{
  margin-bottom: 10px;
}

.add-to-cart i{
	margin-right:5px;
}

.add-to-cart:hover {
  background: #FE980F;
  color: #FFFFFF;
}
.FooterBG{ background:#333;}
.footermenu {
	width:100%;
	height:30px;
	float:left;
	position:relative;
	
}
.footermenu ul {
	padding:0px;
	margin:0px 0px 0px 5px
}
.footermenu ul li {
	height:30px;
	float:left;
	position:relative;
	list-style:none
}
.footermenu ul li a {
	float:left;
	position:relative;
	padding:3px 5px 3px 6px;
	color:#FFFFFF;
	list-style:none;
	text-decoration:none;
	font-size:11px
}
.copy_txt{ color:#fff}
.col-sm-6 { padding:20px}
.col-sm-6 h2,.col-sm-6 p,.col-sm-6 h1{ color:#fff;}
.btn-default{ background:#FF9900; text-decoration:none; padding:10px; font-size:13px; color:#fff; border:none; font-weight:bold}







/* floating box style */
.floating-form {
    width: 400px;
    padding: 30px 30px 10px 30px;
    font: 13px Arial, Helvetica, sans-serif;
    background: #F9F9F9;
    border: 1px solid #ddd;
    right: 10px;
    position: fixed;
	border-radius:4px;
    box-shadow: -2px -0px 8px #333;
    -moz-box-shadow: -2px -0px 8px #333;
    -webkit-box-shadow:  -2px -0px 8px #333;
	z-index:1111;
	top:100px;
	}
.contact-opener {
    position: absolute;
    left: -88px;
    transform: rotate(-90deg);
    top: 100px;
    background-color: #216288;
    padding: 9px;
    color: #fff;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.43);
    cursor: pointer;
    border-radius: 5px 5px 0px 0px;
    -webkit-border-radius: 5px 5px 0px 0px;
    -moz-border-radius: 5px 5px 0px 0px;
    box-shadow: -2px -0px 8px rgba(43, 33, 33, 0.06);
    -moz-box-shadow: -2px -0px 8px rgba(43, 33, 33, 0.06);
    -webkit-box-shadow:  -2px -0px 8px rgba(43, 33, 33, 0.06);

}

#contact_results{ background:#67aa34 url("../images/success.png") no-repeat 10px; padding:15px; font-size:13px; color:#fff; padding-left:40px; font-weight:bold}

.floating-form-heading{
    font-weight: bold;
    font-style: italic;
    border-bottom: 2px solid #ddd;
    margin-bottom: 10px;
    font-size: 15px;
    padding-bottom: 3px;
}
.floating-form label{
    display: block;
    margin: 0px 0px 15px 0px;
}
.floating-form label > span{
    width: 70px;
    font-weight: bold;
	display:block;
    padding-top: 8px;
    padding-right: 5px;
}
.floating-form span.required{
    color:red;
}
.floating-form .tel-number-field{
    width: 40px;
    text-align: center;
}
.floating-form  .long{
    width: 120px;
}
.floating-form input.input-field{
    width: 100%;
   
}

.floating-form input.input-field,
.floating-form .tel-number-field,
.floating-form .textarea-field,
 .floating-form .select-field{
    -webkit-transition: all 0.30s ease-in-out;
    -moz-transition: all 0.30s ease-in-out;
    -ms-transition: all 0.30s ease-in-out;
    -o-transition: all 0.30s ease-in-out; 
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    border: 1px solid #C2C2C2;
    box-shadow: 1px 1px 4px #EBEBEB;
    -moz-box-shadow: 1px 1px 4px #EBEBEB;
    -webkit-box-shadow: 1px 1px 4px #EBEBEB;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    padding: 7px;
    outline: none;

}
.floating-form .input-field:focus,
.floating-form .tel-number-field:focus,
.floating-form .textarea-field:focus,  
.floating-form .select-field:focus{
    border: 1px solid #0C0;
}
.floating-form .textarea-field{
    height:100px;
    width: 100%;
}
.floating-form input[type="button"],
.floating-form input[type="submit"], .contact-opener {
    -moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
    -webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
    box-shadow: inset 0px 1px 0px 0px #3985B1;
    background-color: #216288;
    border: 1px solid #17445E;
    display: inline-block;
    cursor: pointer;
    color: #FFFFFF;
    padding: 8px 18px;
    text-decoration: none;
    font: 18px Arial, Helvetica, sans-serif;
}
.floating-form input[type="button"]:hover,
.floating-form input[type="submit"]:hover, .contact-opener {
    background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
    background-color: #28739E;
}
.floating-form .success{
	background: #D8FFC0;
	padding: 5px 10px 5px 10px;
	margin: 0px 0px 5px 0px;
	border: none;
	font-weight: bold;
	color: #2E6800;
	border-left: 3px solid #2E6800;
}
.floating-form .error {
	background: #FFE8E8;
	padding: 5px 10px 5px 10px;
	margin: 0px 0px 5px 0px;
	border: none;
	font-weight: bold;
	color: #FF0000;
	border-left: 3px solid #FF0000;
}
</style>

</head>
<body>
<div class="floating-form" id="contact_form">
<div class="contact-opener">FEEDBACK</div>
    <div class="floating-form-heading">Please Contact Us</div>
	<div id="contact_results">Thank you for your feedback.</div>
    <div id="contact_body">
        <label><span>Title <span class="required">*</span></span>
        	<input type="email" name="feedBackTitle" id="feedBackTitle" required="true" class="input-field">
        </label>
       
        <label for="subject"><span>Regarding<span class="required">*</span></span>
            <select name="feedBackGroup" id="feedBackGroup" class="select-field">
            <option value="Billing">Billing</option>
            <option value="Repair">Repair</option>
            <option value="Ordering">Ordering</option>
            </select>
        </label>
        <label for="field5"><span>Message <span class="required">*</span></span>
			<textarea name="message"  name="feedBackDesc" id="feedBackDesc"  class="textarea-field" required="true"></textarea>
        </label>
        <label>
        	<span>&nbsp;</span><input type="submit" id="submit" value="Submit" onclick="updateFeedback()";>
        </label>
    </div>
</div>
<table cellpadding="0" cellspacing="0" width="1000" align="center">
  <tr>
  <td valign="middle" height="100">
  <table cellpadding="0" cellspacing="0" width="100%">
  <tr>
        <td>
        	<a href="index.html"><span style="color:#FE980F; font-size:20px; font-weight:bold">ONLINE <span style="color:#333; font-size:20px; font-weight:bold">E CART</span></span></a>
        </td>
        <td align="right">
        <div class="shop-menu">
           <ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-user"></i> Account</a></li>
								<li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><a href="login.html"><i class="fa fa-lock"></i> Login</a></li>
							</ul>
                        </div>    
        </td>
    </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2">
    <div id="NavMenu">
        <ul>
            <li class="active"><a href="#" >Home</a></li>
            <li><a href="#">Shop</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    </td>
  </tr>
  <tr><td style="background:#006699"><div class="col-sm-6">
									<h1><span>ONLINE</span> E CART</h1>
									<h2>Online Products</h2> 
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div></td></tr>
  <tr>
      <td valign="top"  class="body_content">
     	 <table cellpadding="0" cellspacing="0" width="100%"><tr>
        <td valign="top">
             <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
          </td>
          <td valign="top">
             <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
          </td>
          <td valign="top">
             <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
          </td>
           <td valign="top">
             <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
        <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<div style="width:214px; height:218px; background:#ecedee; border:1px solid #ddd"></div>
										<h2>$56</h2>
										<p>ASUS ZENFONE</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
		</div>
          </td>
      </tr>
    
      </table>
      </td>
  </tr>
  <tr><td><br /></td></tr>
  <tr>
    <td valign="top" class="FooterBG" colspan="2">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td> 
                            <div class="footermenu">
                                  <ul>
                                        <li ><a href="#" >About us</a></li>
                                        <li><a href="#">Services</a></li>
                                        <li><a href="#">Supports</a></li>
                                        <li><a href="#">Developments</a></li>
                                        <li><a href="#">Contact</a></li>
                                  </ul>
                            </div>
                  </td>
                  <td align="right">
                          <div class="copy_txt" style="padding-right:10px;"> Copyright &copy; 2015 Online E CART. All rights reserved.</div>
                  </td>
              </tr>
          </table>
    </td>
  </tr>
</table>
</body>

</html>
