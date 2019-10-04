<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 	$("#register").on('click',regist);
 	$("#idchecking").on('click',idchecking);
 	$("#urId").change(function idchange(){
 		$("#duplchck").val("unchecked");	
 	});	
 	})
function regist(){
	var user_name = $("#user_name").val();
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
        <jsp:include page="../menuBar.jsp" />
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">ペット登録</h2>
                        <div class="breadcrumb">
                           
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
        
    </section><!-- ends: .breadcrumb-area -->
      <div class="dashboard_menu_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button class="menu-toggler d-md-none">
                            <span class="icon-menu"></span> Dashboard Menu
                        </button>
                        <ul class="dashboard_menu">
                            <li>
                                <a href="memberProfile"><span class="lnr icon-home"></span>My Profile</a>
                            </li>
                            <li>
                                <a href="memberResList"><span class="lnr icon-basket"></span>予約確認</a>
                            </li>
                            <li class="active">
                                <a href="signupPet"><span class="lnr icon-note"></span>ペット登録</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    <section class="signup_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <form action = "petSignup" method= "POST">
                        <div class="cardify signup_form">
                            <div class="login--header">
                                <h3>ペット登録</h3>
                            </div><!-- end .login_header -->
                            <div class="login--form">
                                <div class="form-group">
                                    <input type = "hidden" id = "duplchck" value = "checked">
                                    <input type = "hidden" value = "${sessionScope.sessionId}" name = "mb_id">
                                </div>
                                <div class="form-group">
                                    <label for="password">PET NAME</label>
                                    <input id="password" type="text" name = "pet_name" class="text_field" placeholder="Enter pet name">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">PET GENDER</label>
                                    <input id="con_pass" type="text" class="text_field" placeholder="Pet Gender" name = "pet_sex">
                                </div>
                                  <div class="form-group">
                                    <label for="user_name">Pet Birth</label>
                                    <input id="user_name" type="text" name = "pet_birth" class="text_field" placeholder="Enter Pet Birth">
                                </div>
                                <div class="form-group">
                                    <label for="email_ad">Pet Weight</label>
                                    <input id="nickname" type="text" name = "pet_weight" class="text_field" placeholder="Enter Pet Weight">
                                </div>    
                                <div class="form-group">
                                    <label for="email_ad">Pet Type</label>
                                    <input id="email_ad" type="text" name = "pet_type" class="text_field" placeholder="Enter Pet Type">
                                </div> 
                                <div class="form-group">
                                    <label for="email_ad">Pet Breed</label>
                                    <input id="email_ad" type="text" name = "pet_breed" class="text_field" placeholder="Enter Pet Breed">
                                </div>                                                            
                                <div class="form-group">
                                    <label for="con_pass">中性化</label>
                                    <input id="con_pass" type="text" class="text_field" name = "pet_neuter" placeholder="特異事項">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">特異事項</label>
                                    <input id="con_pass" type="text" class="text_field" name = "pet_status" placeholder="特異事項があればここに書いてください。">
                                </div>
                                
                                <button type = "submit" class="btn btn--md register_btn btn-primary" id = "register">Register Now</button>
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
                    </form>
                </div><!-- end .col-md-6 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .signup_area -->
       
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