<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	alert("작동");
 	$("#idchecking").on('click',idchecking);
 	})
	function idchecking(){/* 아이디 중복check ajax */
		 var userid = $("#urId").val();
		 var userpw = $("#urPw").val();
		 var form = document.getElementById("loginform");
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
                        <h2 class="page-title">Login</h2>
<!--                         <div class="breadcrumb"> -->
<!--                             <ul> -->
<!--                                 <li> -->
<!--                                     <a href="#">Home</a> -->
<!--                                 </li> -->
<!--                                 <li class="active"> -->
<!--                                     <a href="#">Login</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> -->
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="login_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
                    <form action="loginMember" id = "loginform" method = "POST">
                        <div class="cardify login">
                            <div class="login--header">
                                <h3>Welcome Back</h3>
                                <p>You can sign in with your username</p>
                            </div><!-- end .login_header -->
                            <div class="login--form">
                                <div class="form-group">
                                    <label for="user_name">Username</label>
                                    <input id="urId" type="text" class="text_field" name = "mb_id"  placeholder="Enter your username...">
                                </div>
                                <div class="form-group">
                                    <label for="pass">Password</label>
                                    <input id="urPw" type="password" class="text_field" name = "mb_pw" placeholder="Enter your password...">
                                </div>
                                <div class="form-group">
                                    <div class="custom_checkbox">
                                        <input type="checkbox" id="ch2">
                                        <label for="ch2">
                                            <span class="shadow_checkbox"></span>
                                            <span class="label_text">Remember me</span>
                                        </label>
                                    </div>
                                </div>
                                <button type = "button" class="btn btn--md btn-primary" id = "idchecking" >Login Now</button>
                                <div class="login_assist">
                                    <p class="recover">Lost your
                                        <a href="recover-pass.html">username</a> or
                                        <a href="recover-pass.html">password</a>?</p>
                                    <p class="signup">Don't have an
                                        <a href="signupChoose">account</a>?</p>
                                </div>
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
                    </form>
                </div><!-- end .col-md-6 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .login_area -->
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