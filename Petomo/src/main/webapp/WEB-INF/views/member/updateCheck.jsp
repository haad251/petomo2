<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
<script>
$(function(){
 	$("#idchecking").on('click',idchecking);
 	})
	function idchecking(){
		 var userid = $("#sessionid").val();
		 var userpw = $("#urPw").val();
		 var form = document.getElementById("idpwcheck");
		$.ajax({
			url: 'idpwchck',
			type: 'POST',
			data: { 
					'mb_id':userid,
					'mb_pw':userpw
					},
			success: function chck(resp){
				if(resp.length == 0){
					alert("パスワードが違います。");
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
      <jsp:include page="../menuBar.jsp" /> 
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">会員情報修正	</h2>
                        </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="login_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
                    <form action="memberInfo" id = "idpwcheck" method = "POST">
                        <div class="cardify login">
                            <div class="login--header">
                                <h3>会員情報修正	</h3>
                                <p>パスワードの確認のためにもう一度入力してください。</p>
                            </div><!-- end .login_header -->
                            <div class="login--form">
                                <div class="form-group">
                                    <label for="pass">パスワード</label>
                                    <input id="urPw" type="password" class="text_field" name = "mb_pw" placeholder="パスワード">
                                </div>
                                <input type = "hidden" id = "sessionid" name = "mb_id" value = "${sessionScope.sessionId}">
                                <button type = "button" class="btn btn--md btn-primary" id = "idchecking" >パスワード確認</button>
                                </div>
                            </div><!-- end .login--form -->
                        </div><!-- end .cardify -->
                    </form>
                </div><!-- end .col-md-6 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .login_area -->
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxflHHc5FlDVI-J71pO7hM1QJNW1dRp4U"></script>
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
</body>

</html>