<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<html lang="en">

<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
    $("#register").on('click',regist);
    })
function regist(){
   var petname = $("#petname").val();
   if(petname == ''){
   alert("名前が空いてはいけません。");
   return false;
   }
   
   var petgender = $("#petgender").val();
   if(petgender == ''){
      alert("ペットの性別を入力してください。");
      return false;
   }
   
   var pet_birth = $("#pet_birth").val();
   if(pet_birth ==''){
      alert("ペットの誕生日を入力してください。");
      return false;
   }
   var pet_weight = $("#pet_weight").val();
   if(pet_weight ==''){
      alert("ペットの体重を入力してください。");
      return false;
   }
   var pet_type = $("#pet_type").val();
   if(pet_type ==''){
      alert("ペットの種類を入力してください。");
      return false;
   }
   var pet_breed = $("#pet_breed").val();
   if(pet_breed ==''){
      alert("ペットの大きさを入力してください。");
      return false;
   }
   var pet_neuter = $("#pet_neuter").val();
   if(pet_neuter ==''){
      alert("ペットの中性化可否を入力してください。");
      return false;
   }
   var pet_status = $("#pet_status").val();
   if(pet_status ==''){
      alert("ペットの特異事項を入力してください。");
      return false;
   }
   }
   
</script>
</head>
<body class="preload">
        <jsp:include page="../menuBar.jsp" />
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
                                <a href="memberProfile"><span class="lnr icon-home"></span>マイプロフィール</a>
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
                                    <label for="password">ペットネーム</label>
                                    <input id="password" type="text" name = "pet_name" class="text_field" >
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">ペット性別</label>
                                    <input id="con_pass" type="text" class="text_field" name = "pet_sex">
                                </div>
                                  <div class="form-group">
                                    <label for="user_name">ペット誕生日</label>
                                    <input id="user_name" type="text" name = "pet_birth" class="text_field" >
                                </div>
                                <div class="form-group">
                                    <label for="email_ad">ペット体重</label>
                                    <input id="nickname" type="text" name = "pet_weight" class="text_field" >
                                </div>    
                                <div class="form-group">
                                    <label for="email_ad">ペット種類</label>
                                    <input id="email_ad" type="text" name = "pet_type" class="text_field"  >
                                </div> 
                                <div class="form-group">
                                    <label for="email_ad">ペットの大きさ</label>
                                    <input id="email_ad" type="text" name = "pet_breed" class="text_field" >
                                </div>                                                            
                                <div class="form-group">
                                    <label for="con_pass">中性化</label>
                                    <input id="con_pass" type="text" class="text_field" name = "pet_neuter"  >
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">特異事項</label>
                                    <input id="con_pass" type="text" class="text_field" name = "pet_status"  >
                                </div>
                                
                                <button type = "submit" class="btn btn--md register_btn btn-primary" id = "register">Register Now</button>
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
                    </form>
                </div><!-- end .col-md-6 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .signup_area -->
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
</body>

</html>