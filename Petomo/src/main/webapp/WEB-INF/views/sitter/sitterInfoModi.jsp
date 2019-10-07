<!--보류: 로딩시 기존위치 선택되게 selectbox 커스텀데이터+JS -->
<!--유효성, 비밀번호 중복체크 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
    $(function(){
    	$("#cover_photo").change(function(){
  	 		$("#insertSPI").submit();
    	});
    });
</script>
    
</head>

<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
    
<section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">シッターメニュー</h2>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="dashboard-area">
        <div class="dashboard_menu_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button class="menu-toggler d-md-none">
                            <span class="icon-menu"></span> Dashboard Menu
                        </button>
						<ul class="dashboard_menu">
                            <li class="active s_jfont">
                                <a href="sitterInfoModi"><span class="lnr icon-settings"></span>マイページ</a>
                            </li>
                            <li>
                                <a href="sitterResList"><span class="lnr icon-notebook"></span>予約リスト</a>
                            </li>
                            <li>
                                <a href="sitterChartPage"><span class="lnr icon-chart"></span>統計</a>
                            </li >
                            <li style="width:200px;">
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
     </section>


        <div class="dashboard_contents section--padding">
            <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="information_module">
                                <div class="information__set profile_images">
                                    <div class="information_wrapper">
                                        <div class="profile_image_area">
                                            <div>
                                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="Author profile area" height="100px" width="100px">
                                                <div class="img_info">
                                                     <p class="bold">プロフィール</p>
                                                    <p class="subtitle">PNG 100x100px</p>
                                                </div>
                                            </div>
                                            <form action="insertSitterImage" id="insertSPI" method="POST" enctype="multipart/form-data">
                                            <label for="cover_photo" class="upload_btn">
                                                <input type="file" id="cover_photo" name="uploadfile" accept=".png">
                                                <span id="SPIuploadBtn" class="btn btn-sm btn-primary" aria-hidden="true">アップロード</span>
                                                <a href="deleteSitterImage" class="btn btn-sm btn-danger">削除</a>
                                            </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- ends: .information_module -->
                        </div><!-- ends: .col-md-12 -->
                       
<!--                        <form action="updateSitter" class="setting_form" method="POST"> -->
                      <form action="updateSitter" class="setting_form" method="POST" enctype="multipart/form-data">
                        <div class="col-md-12">
                            <div class="information_module">
                                <div class="toggle_title">
                                    <h4>会員情報変更</h4>
                                </div>
                                <div class="information__set">
                                    <div class="information_wrapper form--fields row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="id">ID
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_id" class="text_field s_readonly" value="${sitter.st_id}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">名前
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_name" class="text_field s_readonly" value="${sitter.st_name}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="emailad">メールアドレス
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_email" class="text_field"  value="${sitter.st_email}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="sex">性別</label>
                                                <input type="text" name="st_sex" class="text_field s_readonly" value="${sitter.st_sex}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="password">パスワード
                                                    <sup>*</sup>
                                                </label>
                                                <input type="password" name="st_pw" class="text_field" value="${sitter.st_pw}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="conpassword">パスワード(確認）
                                                    <sup>*</sup>
                                                </label>
                                                <input type="password" id="conpassword" class="text_field" value="${sitter.st_pw}">
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6" style="max-width:100%;">
                                            <div class="form-group">
                                                <label for="loc1">住所
                                                    <sup>*</sup>
                                                </label>
                                                <div class="select-wrap select-wrap2">
                                                   	<input type="text" name="st_loc1" class="text_field" value="${sitter.st_loc1}">
                                                </div>
                                            </div>
                                        </div>
 										<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="license">ライセンス
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_license" class="text_field s_readonly" value="${sitter.st_license}" readonly>
                                            </div>
                                        </div> 
                                		<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="lineid">Line ID
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_lineid" class="text_field"value="${sitter.st_lineid}">
                                            </div>
                                        </div>                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="info">紹介文</label>
                                                <textarea name="st_info" id="st_info" class="text_field" >${sitter.st_info}</textarea>
                                            </div>
                                        </div>
                                    </div><!-- ends: .information_wrapper -->
                                </div><!-- ends: .information__set -->
                            </div><!-- ends: .information_module -->
                        </div><!-- ends: .col-md-12 -->
                         <div class="col-md-12">
                            <div class="dashboard_setting_btn">
                                <button type="submit" class="btn btn--md btn-primary">セーブ</button>
                                <button type="reset" class="btn btn-md btn-danger">キャンセル</button>
                            </div>
                        </div><!-- ends: .col-md-12 -->
                  </form>
                    </div><!-- ends: .row -->
                <!-- end /form -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
<!--     </section>ends: .dashboard-area      -->
     
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