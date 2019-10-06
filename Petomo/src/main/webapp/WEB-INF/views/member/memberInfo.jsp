<%@ page language="java" contentType="text/html; charset=UTF-8"
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
 	$("#confirm").on('click',update);
 	
 	
 	$("#cover_photo").change(function(){
	 		$("#insertMPI").submit();
	});
 })
function update(){ 
	var password = $("#mb_pw").val();
	var con_pass = $("#confirmpw").val();
	if(password != con_pass){
		alert("パスワードとパスワード確認が一致しません");
		return false;
	}
	if(password.length <3 || password.length > 16){
		alert("パスワードは3文字以上15文字以下です")
		return false;
	}
	var user_name = $("#name").val();
	if(user_name == ''){
		alert("名前を入力してください");
	return false;
	}
	
	var chcknickname = $("#nickname").val();
	if(chcknickname == ''){
		alert("ニックネームを入力してください");
		return false;
	}
	
	var chckemail = $("#email_ad").val();
	if(chckemail ==''){
		alert("メールアドレスを入力してくたさい");
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
                        <h2 class="page-title">会員情報</h2>
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
                                <a href="gosetting"><span class="lnr icon-settings"></span>アカウント情報</a>
                            </li>
                            <li>
                                <a href="gomemberout"><span class="icon-logout"></span>会員脱退</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
        
        
        
        
        
        <div class="dashboard_contents section--padding">
            <div class="container">
                    <div class="row">
                    <div class="col-md-12">
                            <div class="information_module">
                                <div class="information__set profile_images">
                                    <div class="information_wrapper">
                                        <div class="profile_image_area">
                                            <div>
                                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${sessionScope.sessionProfileImg}" alt="Author profile area" height="100px" width="100px">
                                                <div class="img_info">
                                                     <p class="bold">Profile Image</p>
                                                    <p class="subtitle">JPG, GIF or PNG 100x100 px</p>
                                                </div>
                                            </div>
                                            <form action="insertMemberImage" id="insertMPI" method="POST" enctype="multipart/form-data">
                                            <label for="cover_photo" class="upload_btn">
                                                <input type="file" id="cover_photo" name="uploadfile" accept=".png">
                                                <span id="MPIuploadBtn" class="btn btn-sm btn-primary" aria-hidden="true">アップロード</span>
                                                <a href="deleteMemberImage" class="btn btn-sm btn-danger">削除</a>
                                            </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- ends: .information_module -->
                        </div><!-- ends: .col-md-12 -->
                    
                    
                        <div class="col-md-12">
           			 <form action="memberupdate" class="setting_form" method = "POST" id = "update">
                            <div class="information_module">
                                <a class="toggle_title">
                                    <h3>個人情報</h3>
                                </a>
                                <div class="information__set toggle_module" style= "width: 1100px;">
                                    <div class="information_wrapper form--fields">
                                        <div class="form-group">
                                    <label for="user_name">使用者名</label>
                                    <input id="user_name" type="text" name = "mb_name" class="text_field" id = "name" placeholder="Enter your username" value = "${mbname}">
                              	    </div>
                                       <div class="form-group">
                                    <label for="email_ad">ニックネーム</label>
                                    <input id="nickname" type="text" name = "mb_nickname" class="text_field" id = "nickname" placeholder="Enter your Nick name" value = "${mbnickname}">
                                    </div>   
                                      <div class="form-group">
                                    <label for="email_ad">住所</label>
                                    <input id="email_ad" type="text" name = "mb_addr" class="text_field"  id = "address" placeholder="Enter your address" value ="${mbaddress}">
                                </div>           
                                    <div class="form-group">
                                    <label for="email_ad">メールアドレス</label>
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
                                    <h3>暗証番号変更</h3>
                                </a>
                                <div class="information__set toggle_module">
                                    <div class="information_wrapper form--fields">
                                        <div class="form-group">
                                    <label for="password">新しいパスワード</label>
                                    <input type="password" name = "mb_pw" class="text_field" placeholder="Enter your password" id = "mb_pw">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">新しいパスワード確認。</label>
                                    <input type="password" class="text_field" placeholder="Confirm password" name = "confirmpw" id = "confirmpw">
                                </div>
                                    </div><!-- ends: .information_wrapper -->
                                </div><!-- ends: .information__set -->
                            </div><!-- ends: .information_module -->
                            <div class="dashboard_setting_btn text-left">
                                <button type="submit" class="btn btn--md btn-primary" id = "confirm">セーブ</button>
                            </div>
	                </form><!-- ends: form -->
                        </div><!-- ends: .col-md-12 -->
                    </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    </section><!-- ends: .dashboard_purchase -->
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