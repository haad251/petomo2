<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<html lang="UTF-8">

<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
$(function(){
 	$("#register").on('click',regist);
 	$("#idchecking").on('click',idchecking);
 	$("#urId").change(function idchange(){
 		$("#duplchck").val("unchecked");	
 	});	
 	})
function regist(){
	var chckid = $("#urId").val();
	if(chckid.length < 3 || chckid.length > 15 ){
		alert("IDは3文字以上15文字以下です");
		return false;
	}
	 if($("#duplchck").val()!="checked"){
		alert("IDをチェックしてください");
		return false;
	} 
	var password = $("#password").val();
	var con_pass = $("#con_pass").val();
	if(password != con_pass){
		alert("パスワードとパスワード確認が一致しません");
		return false;
	}
	if(password.length <3 || password.length > 16){
		alert("パスワードは3文字以上15文字以下です")
		return false;
	}
	var user_name = $("#user_name").val();
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
	function idchecking(){
		 var userid = $("#urId").val();
		$.ajax({
			url: 'duplchck',
			type: 'POST',
			data: { 
					'mb_id':userid,
					},
			success: function chck(resp){
				if(resp.length == 0){
					$("#duplchck").val("checked");
					alert("利用できるIDです");
					return false;
				}
				else{
				$("#duplchck").val("unchecked");
				alert("ご入力いただいたIDはすでに登録されています。");
				return false;
				}
				
			}
			}); 
		}
	
</script>



</head>

<body class="preload">
        <jsp:include page="menuBar.jsp" /> 
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
						<h2 class="page-title">ユーザー登録</h2>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="signup_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <form action = "memberSignup" method= "POST">
                        <div class="cardify signup_form">
                            <div class="login--header">
                                <h3>新規会員登録</h3>
                            </div><!-- end .login_header -->
                            <div class="login--form">
                                <div class="form-group">
                                    <label for="urname">ID</label>
                                 <button type = "button" class = "btn btn--md register_btn btn-primary"  id = "idchecking" 
                                 style="width: 100px; margin: 0px; font-size: 13px; padding: 0; line-height:0;height: 30px;">IDチェック</button>
                                    <input id="urId" type="text" name = "mb_id" class="text_field">
                                    <input type = "hidden" id = "duplchck" value = "unchecked">
                                </div>
                                <div class="form-group">
                                    <label for="password">パスワード</label>
                                    <input id="password" type="password" name = "mb_pw" class="text_field">
                                </div>
                                <div class="form-group">
                                    <label for="con_pass">パスワード (確認)</label>
                                    <input id="con_pass" type="password" class="text_field">
                                </div>
                                  <div class="form-group">
                                    <label for="user_name">お名前</label>
                                    <input id="user_name" type="text" name = "mb_name" class="text_field" >
                                </div>
                                <div class="form-group">
                                    <label for="email_ad">ニックネーム</label>
                                    <input id="nickname" type="text" name = "mb_nickname" class="text_field">
                                </div>    
                                <div class="form-group">
                                    <label for="email_ad">メールアドレス</label>
                                    <input id="email_ad" type="text" name = "mb_email" class="text_field">
                                </div> 
                                <div class="form-group">
                                    <label for="email_ad">住所</label>
                                    <input id="email_ad" type="text" name = "mb_addr" class="text_field">
                                </div>                                                            
                                <div class="form-group">
                                    <label for="con_pass">LineID</label>
                                    <input id="con_pass" type="text" class="text_field" name = "mb_lineid">
                                </div>
                                <button type = "submit" class="btn btn--md register_btn btn-primary" id = "register">登録</button>
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