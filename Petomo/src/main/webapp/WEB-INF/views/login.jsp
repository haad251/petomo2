<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){
 	$("#idchecking,#idchecking2").on('click',idchecking);
	$("#memberradio").on('click',function(){
 		$("#loginform").show();
 		$("#sitterloginform").hide();
 	});
 	
	$("#sitterradio").on('click',function(){
 		$("#sitterloginform").show();
 		$("#loginform").hide();
 	});
	 	
 	});
	function idchecking(){/* 아이디 중복check ajax */
		 var radioval = $('input[name="selecttype"]:checked').val();
		 if(radioval=="member"){		 
			 var userid = $("#urId").val();
			 var userpw = $("#urPw").val();
			 var form = document.getElementById("loginform");
			 var userdata = {"mb_id" : userid, "mb_pw": userpw};
	 	 }else {
	 		 var userid = $("#urId2").val();
			 var userpw = $("#urPw2").val();
			 var form = document.getElementById("sitterloginform");
	 		 var userdata = {"st_id" : userid, "st_pw": userpw};
	 	 }
		$.ajax({
			url: 'idpwchck',
			type: 'POST',
			data:userdata,
			success: function chck(resp){
				if(resp.length == 0){
					alert("入力されたID、またはパスワードに誤りがあります");
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
    
    <section class="login_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
                        <div class="cardify login">
                            <div class="login--header">
                                <h3>ログイン</h3>
                                <input type="radio" name="selecttype" value="member" id="memberradio" checked="checked">ユーザー
                                <input type="radio" name="selecttype" value="sitter" id="sitterradio">シッター
                            </div><!-- end .login_header -->
                            <div class="login--form">
                   			 <form action="loginMember" id = "loginform" method = "POST">
                                <div class="form-group">
                                    <label for="user_name">ID</label>
                                    <input id="urId" type="text" class="text_field" name = "mb_id"  placeholder="Enter your username...">
                                </div>
                                <div class="form-group">
                                    <label for="pass">パスワード</label>
                                    <input id="urPw" type="password" class="text_field" name = "mb_pw" placeholder="Enter your password...">
                                </div>
                                <button type = "button" class="btn btn--md btn-primary" id="idchecking" >ログイン</button>
                                <div class="login_assist">
<<<<<<< HEAD
                                    <p class="recover">Lost your
                                        <a href="recover-pass.html">username</a> or
                                        <a href="recover-pass.html">password</a>?</p>
                                    <p class="signup">Don't have an
                                        <a href="signupChoose">account</a>?</p>
=======
                                    <p class="signup">
                                        <a href="signupChoose">新しいアカウントを作成</a></p>
>>>>>>> refs/remotes/origin/master
                                </div>
                  			  </form>
                  			  
                  			  
                  			  
<!--                   			  시터폼 (처음엔숨겨짐) -->
                  			  <form action="loginSitter" id = "sitterloginform" method = "POST" style="display:none;">
                                <div class="form-group">
                                    <label for="user_name">ID</label>
                                    <input id="urId2" type="text" class="text_field" name = "st_id"  placeholder="Enter your username...">
                                </div>
                                <div class="form-group">
                                    <label for="pass">パスワード</label>
                                    <input id="urPw2" type="password" class="text_field" name = "st_pw" placeholder="Enter your password...">
                                </div>
                                <button type = "button" class="btn btn--md btn-primary" id="idchecking2" >ログイン</button>
                                <div class="login_assist">
                                    <p class="signup">
                                        <a href="signupChoose">新しいアカウントを作成</a></p>
                                </div>
                  			  </form>
                  			  
                  			  
                  			  
                  			  
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
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