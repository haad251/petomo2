<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">



    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	alert("작동");
 	$("#idchecking").on('click',idchecking);
 	})

	function idchecking(){/* 아이디 check ajax */
		
		 var userid = $("#urId").val();
		 var userpw = $("#urPw").val();
		 var sessionid = $("#sessionid").val();
		 var form = document.getElementById("loginform");
		 if(sessionid != userid){
			 alert("아이디 혹은 비밀번호가 틀렸습니다");
			 return false;
		 }
		$.ajax({
			url: 'idpwchck',
			type: 'POST',
			data: { 
					'mb_id':userid,
					'mb_pw':userpw
					},
			success: function chck(resp){
				if(resp.length == 0){
					alert("아이디 혹은 비밀번호가 틀렸습니다");
					return false;
				}
				else{
						form.submit();
				}
			}
			}); 
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
                        <h2 class="page-title">회원탈퇴</h2>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="login_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
                    <form action="deleteAccount" id ="loginform" method = "POST">
                        <div class="cardify login">
                            <div class="login--header">
                                <h3>회원탈퇴</h3>
                                <p>탈퇴하기전 아이디와 비밀번호를 확인하겠습니다</p>
                            </div><!-- end .login_header -->
                            <div class="login--form">
                                <div class="form-group">
                                    <label for="user_name">Username</label>
                                    <input id="urId" type="text" class="text_field" name = "mb_id"  placeholder="Enter your username...">
                                    <input type = "hidden" value = "${sessionScope.sessionId}" id = "sessionid">
                                </div>
                                <div class="form-group">
                                    <label for="pass">Password</label>
                                    <input id="urPw" type="password" class="text_field" name = "mb_pw" placeholder="Enter your password...">
                                </div>
                                <div class="form-group">
                                   
                                </div>
                                <button type = "button" class="btn btn--md btn-primary" id = "idchecking" >회원 탈퇴</button>
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
                    </form>
                </div><!-- end .col-md-6 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .login_area -->
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