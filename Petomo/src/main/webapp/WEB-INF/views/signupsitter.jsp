<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="DigiPro - Digital Products Marketplace ">
    <meta name="keywords" content="marketplace, easy digital download, digital product, digital, html5">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>



</head>

<body class="preload">
        <jsp:include page="menuBar.jsp" /> 

    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
						<h2 class="page-title">シッター登録</h2>
						<div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Signup</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="signup_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <form action = "sitterSignup" method= "POST">
                        <div class="cardify signup_form">
                            <div class="login--header">
                                <h3>新規会員登録</h3>
                            </div><!-- end .login_header -->
                            <div class="login--form">
                                <div class="form-group">
                                    <label for="urname">ID</label>
                                    <input id="urId" type="text" name = "st_id" class="text_field" placeholder="会員ID">
                                    <input type = "hidden" id = "duplchck" value = "unchecked">
                                </div>
                                 <button type = "button" class = "btn btn--md register_btn btn-primary"  id ="idchecking" >IDチェック</button>
                                <div class="form-group">
                                    <label for="password">パスワード</label>
                                    <input id="password" type="password" name = "st_pw" class="text_field" placeholder="パスワード">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">パスワード (確認) </label>
                                    <input id="con_pass" type="password" class="text_field" placeholder="パスワード (確認) ">
                                </div>
                                  <div class="form-group">
                                    <label for="user_name">お名前</label>
                                    <input id="user_name" type="text" name = "st_name" class="text_field" placeholder="お名前">
                                </div>
                                <div class="form-group">
                                    <label for="email_ad">メールアドレス</label>
                                    <input id="email_ad" type="text" name = "st_email" class="text_field" placeholder="メールアドレス">
                                </div> 
                                <div class="form-group">
                                    <label for="email_ad">性別</label>
                                    <input id="email_ad" type="text" name = "st_sex" class="text_field" placeholder="性別">
                                </div>                                                            
                                <div class="form-group">
                                    <label for="con_pass">LineID</label>
                                    <input id="con_pass" type="text" class="text_field" name = "st_lineid" placeholder="LineID">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">地域１</label>
                                    <input id="con_pass" type="text" class="text_field" name = "st_loc1" placeholder="地域１">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">地域２</label>
                                    <input id="con_pass" type="text" class="text_field" name = "st_loc2" placeholder="地域２">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">紹介文</label>
                                    <input id="con_pass" type="text" class="text_field" name = "st_info" placeholder="紹介文">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">ライセンス</label>
                                    <input id="con_pass" type="text" class="text_field" name = "st_license" placeholder="ライセンス">
                                </div>
                                
                                <button type = "submit" class="btn btn--md register_btn btn-primary" id = "register">登録</button>
                                <div class="login_assist">
                                    <p>アカウントをお持ちの方
                                        <a href="login.html">ログイン</a>
                                    </p>
                                </div>
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
                    </form>
                </div><!-- end .col-md-6 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .signup_area -->
 
 
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