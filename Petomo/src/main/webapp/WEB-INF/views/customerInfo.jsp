<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!-- viewport meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="DigiPro - Digital Products Marketplace ">
    <meta name="keywords" content="marketplace, easy digital download, digital product, digital, html5">
    <title>DigiPro - Digital Products Marketplace</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">
    <!-- inject:css-->
    <link rel="stylesheet" href="vendor_assets/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="vendor_assets/css/animate.css">
    <link rel="stylesheet" href="vendor_assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor_assets/css/jquery-ui.css">
    <link rel="stylesheet" href="vendor_assets/css/magnific-popup.css">
    <link rel="stylesheet" href="vendor_assets/css/owl.carousel.css">
    <link rel="stylesheet" href="vendor_assets/css/select2.min.css">
    <link rel="stylesheet" href="vendor_assets/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendor_assets/css/slick.css">
    <link rel="stylesheet" href="vendor_assets/css/trumbowyg.min.css">
    <link rel="stylesheet" href="vendor_assets/css/venobox.css">
    <link rel="stylesheet" href="style.css">
    <!-- endinject -->
    <!-- Favicon Icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-32x32.png">
    <!--  ajax 및 jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	alert("작동?");
 	$("#confirm").on('click',update);
 	})
function update(){ 
	var password = $("#mb_pw").val();
	var con_pass = $("#confirmpw").val();
	if(password != con_pass){
		alert("비밀번호와 확인비밀번호는 일치해야합니다");
		return false;
	}
	if(password.length <3 || password.length > 16){
		alert("비밀번호의 길이는 3~15자리이여야 합니다")
		return false;
	}
	var user_name = $("#name").val();
	if(user_name == ''){
	alert("이름이 비어있으면 안됩니다");
	return false;
	}
	
	var chcknickname = $("#nickname").val();
	if(chcknickname == ''){
		alert("닉네임을 입력해주세요");
		return false;
	}
	
	var chckemail = $("#email_ad").val();
	if(chckemail ==''){
		alert("이메일을 입력해주세요");
		return false;
	}
	}
</script>
</head>

<body class="preload">
       <jsp:include page="menuBar.jsp" /> 
   
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">Customer Dashboard</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Customer Dashboard</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="dashboard-area dashboard_purchase">
        <div class="dashboard_menu_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button class="menu-toggler d-md-none">
                            <span class="icon-menu"></span> Dashboard Menu
                        </button>
                        <ul class="dashboard_menu dashboard_menu--two">
                            <li class="active">
                                <a href="gosetting"><span class="lnr icon-settings"></span>Account Info</a>
                            </li>
                            <li>
                                <a href="gomemberout"><span class="icon-logout"></span>회원 탈퇴</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
        <div class="dashboard_contents section--padding">
            <div class="container">
                <form action="memberupdate" class="setting_form" method = "POST" id = "update">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="information_module">
                                <a class="toggle_title">
                                    <h3>Personal Information</h3>
                                </a>
                                <div class="information__set toggle_module">
                                    <div class="information_wrapper form--fields">
                                        <div class="form-group">
                                    <label for="user_name">User name</label>
                                    <input id="user_name" type="text" name = "mb_name" class="text_field" id = "name" placeholder="Enter your username" value = "${mbname}">
                              	    </div>
                                       <div class="form-group">
                                    <label for="email_ad">Nick name</label>
                                    <input id="nickname" type="text" name = "mb_nickname" class="text_field" id = "nickname" placeholder="Enter your Nick name" value = "${mbnickname}">
                                    </div>   
                                      <div class="form-group">
                                    <label for="email_ad">User Address</label>
                                    <input id="email_ad" type="text" name = "mb_addr" class="text_field"  id = "address" placeholder="Enter your address" value ="${mbaddress}">
                                </div>           
                                    <div class="form-group">
                                    <label for="email_ad">Email Address</label>
                                    <input id="email_ad" type="text" name = "mb_email" class="text_field" id = "email_ad"placeholder="Enter your email address" value = "${mbemailaddress}">
                                </div> 
                                  <div class="form-group">
                                    <label for="con_pass">Naver Line id</label>
                                    <input id="con_pass" type="text" class="text_field" name = "mb_lineid" placeholder="Naver Line Id" value = "${mblineid}">
                                    <input type = "hidden" name = "mb_id" value = "${sessionScope.sessionId}">
                                </div>
                                    </div><!-- ends: .information_wrapper -->
                                </div><!-- ends: .information__set -->
                            </div><!-- ends: .information_module -->
                          
                            <div class="information_module">
                                <a class="toggle_title">
                                    <h3>Change Your Password</h3>
                                </a>
                                <div class="information__set toggle_module">
                                    <div class="information_wrapper form--fields">
                                        <div class="form-group">
                                    <label for="password">New Password </label>
                                    <input type="password" name = "mb_pw" class="text_field" placeholder="Enter your password" id = "mb_pw">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">Re-enter Password</label>
                                    <input type="password" class="text_field" placeholder="Confirm password" name = "confirmpw" id = "confirmpw">
                                </div>
                                    </div><!-- ends: .information_wrapper -->
                                </div><!-- ends: .information__set -->
                            </div><!-- ends: .information_module -->
                            <div class="dashboard_setting_btn text-left">
                                <button type="submit" class="btn btn--md btn-primary" id = "confirm">Save Change</button>
                            </div>
                        </div><!-- ends: .col-md-12 -->
                    </div><!-- ends: .row -->
                </form><!-- ends: form -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    </section><!-- ends: .dashboard_purchase -->
    <footer class="footer-area footer--light">
        <div class="footer-big">
            <!-- start .container -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget">
                            <div class="widget-about">
                                <img src="img/footer-logo.png" alt="" class="img-fluid">
                                <p>Pellentesque facilisis the ullamcorp keer sapien interdum is the magna pellentesque
                                    kequis
                                    hasellus keur condimentum eleifend.</p>
                                <ul class="contact-details">
                                    <li>
                                        <span class="icon-earphones"></span>
                                        Call Us:
                                        <a href="tel:344-755-111">344-755-111</a>
                                    </li>
                                    <li>
                                        <span class="icon-envelope-open"></span>
                                        <a href="mailto:support@aazztech.com">support@aazztech.com</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- end /.col-md-4 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget">
                            <div class="footer-menu footer-menu--1">
                                <h5 class="footer-widget-title">Popular Category</h5>
                                <ul>
                                    <li>
                                        <a href="#">Wordpress</a>
                                    </li>
                                    <li>
                                        <a href="#">Plugins</a>
                                    </li>
                                    <li>
                                        <a href="#">Joomla Template</a>
                                    </li>
                                    <li>
                                        <a href="#">Admin Template</a>
                                    </li>
                                    <li>
                                        <a href="#">HTML Template</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- end /.footer-menu -->
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- end /.col-md-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget">
                            <div class="footer-menu">
                                <h5 class="footer-widget-title">Our Company</h5>
                                <ul>
                                    <li>
                                        <a href="#">About Us</a>
                                    </li>
                                    <li>
                                        <a href="#">How It Works</a>
                                    </li>
                                    <li>
                                        <a href="#">Affiliates</a>
                                    </li>
                                    <li>
                                        <a href="#">Testimonials</a>
                                    </li>
                                    <li>
                                        <a href="#">Contact Us</a>
                                    </li>
                                    <li>
                                        <a href="#">Plan & Pricing</a>
                                    </li>
                                    <li>
                                        <a href="#">Blog</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- end /.footer-menu -->
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- end /.col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget">
                            <div class="footer-menu no-padding">
                                <h5 class="footer-widget-title">Help Support</h5>
                                <ul>
                                    <li>
                                        <a href="#">Support Forum</a>
                                    </li>
                                    <li>
                                        <a href="#">Terms & Conditions</a>
                                    </li>
                                    <li>
                                        <a href="#">Support Policy</a>
                                    </li>
                                    <li>
                                        <a href="#">Refund Policy</a>
                                    </li>
                                    <li>
                                        <a href="#">FAQs</a>
                                    </li>
                                    <li>
                                        <a href="#">Buyers Faq</a>
                                    </li>
                                    <li>
                                        <a href="#">Sellers Faq</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- end /.footer-menu -->
                        </div>
                        <!-- Ends: .footer-widget -->
                    </div>
                    <!-- Ends: .col-lg-3 -->
                </div>
                <!-- end /.row -->
            </div>
            <!-- end /.container -->
        </div>
        <!-- end /.footer-big -->
        <div class="mini-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="copyright-text">
                            <p>&copy; 2018
                                <a href="#">DigiPro</a>. All rights reserved. Created by
                                <a href="#">AazzTech</a>
                            </p>
                        </div>
                        <div class="go_top">
                            <span class="icon-arrow-up"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxflHHc5FlDVI-J71pO7hM1QJNW1dRp4U"></script>
    <!-- inject:js-->
    <script src="vendor_assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="vendor_assets/js/jquery/uikit.min.js"></script>
    <script src="vendor_assets/js/bootstrap/popper.js"></script>
    <script src="vendor_assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="vendor_assets/js/chart.bundle.min.js"></script>
    <script src="vendor_assets/js/grid.min.js"></script>
    <script src="vendor_assets/js/jquery-ui.min.js"></script>
    <script src="vendor_assets/js/jquery.barrating.min.js"></script>
    <script src="vendor_assets/js/jquery.countdown.min.js"></script>
    <script src="vendor_assets/js/jquery.counterup.min.js"></script>
    <script src="vendor_assets/js/jquery.easing1.3.js"></script>
    <script src="vendor_assets/js/jquery.magnific-popup.min.js"></script>
    <script src="vendor_assets/js/owl.carousel.min.js"></script>
    <script src="vendor_assets/js/select2.full.min.js"></script>
    <script src="vendor_assets/js/slick.min.js"></script>
    <script src="vendor_assets/js/tether.min.js"></script>
    <script src="vendor_assets/js/trumbowyg.min.js"></script>
    <script src="vendor_assets/js/venobox.min.js"></script>
    <script src="vendor_assets/js/waypoints.min.js"></script>
    <script src="theme_assets/js/dashboard.js"></script>
    <script src="theme_assets/js/main.js"></script>
    <script src="theme_assets/js/map.js"></script>
    <!-- endinject-->


</body>
</html>