<!--보류: 로딩시 기존위치 선택되게 selectbox 커스텀데이터+JS -->
<!--유효성, 비밀번호 중복체크 -->
<!-- 프로필사진 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <title>Petomo</title>
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
    <jsp:include page="sitterMenuBar.jsp" /> 

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
                                                     <p class="bold">Profile Image</p>
                                                    <p class="subtitle">JPG, GIF or PNG 100x100 px</p>
                                                </div>
                                            </div>
                                            <form action="insertSitterImage" id="insertSPI" method="POST" enctype="multipart/form-data">
                                            <label for="cover_photo" class="upload_btn">
                                                <input type="file" id="cover_photo" name="uploadfile">
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
                                                <input type="text" name="st_id" class="text_field s_readonly" placeholder="ID" value="${sitter.st_id}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">名前
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_name" class="text_field s_readonly" placeholder="Name" value="${sitter.st_name}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="emailad">メールアドレス
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_email" class="text_field" placeholder="Email address" value="${sitter.st_email}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="sex">性別</label>
                                                <input type="text" name="st_sex" class="text_field s_readonly" placeholder="Sex" value="${sitter.st_sex}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="password">パスワード
                                                    <sup>*</sup>
                                                </label>
                                                <input type="password" name="st_pw" class="text_field" placeholder="Enter Password" value="${sitter.st_pw}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="conpassword">パスワード(確認）
                                                    <sup>*</sup>
                                                </label>
                                                <input type="password" id="conpassword" class="text_field" placeholder="re-enter password" value="${sitter.st_pw}">
                                            </div>
                                        </div>
                                        
                                        
<!--                                       보류: 로딩시 기존위치 선택되게 selectbox 커스텀데이터+JS -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="loc1">位置1
                                                    <sup>*</sup>
                                                </label>
                                                <div class="select-wrap select-wrap2">
                                                    <select name="st_loc1" id="st_loc1" class="text_field">
                                                        <option value="">Select one</option>
                                                        <option value="Seoul" selected>Seoul</option>
                                                        <option value="Tokyo">Tokyo</option>
                                                    </select>
                                                    <span class="lnr icon-arrow-down"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="loc2">位置2
                                                    <sup>*</sup>
                                                </label>
                                                <div class="select-wrap select-wrap2">
                                                    <select name="st_loc2" id="st_loc2" class="text_field">
                                                        <option value="">Select one</option>
                                                        <option value="Kangnam" selected>Kangnam</option>
                                                        <option value="Ueno">Ueno</option>
                                                    </select>
                                                    <span class="lnr icon-arrow-down"></span>
                                                </div>
                                            </div>
                                        </div>
 										<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="license">ライセンス
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_license" class="text_field s_readonly" placeholder="License Number" value="${sitter.st_license}" readonly>
                                            </div>
                                        </div> 
                                		<div class="col-md-6">
                                            <div class="form-group">
                                                <label for="lineid">Line ID
                                                    <sup>*</sup>
                                                </label>
                                                <input type="text" name="st_lineid" class="text_field" placeholder="Line ID" value="${sitter.st_lineid}">
                                            </div>
                                        </div>                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="info">紹介文</label>
                                                <textarea name="st_info" id="st_info" class="text_field" placeholder="Info">${sitter.st_info}</textarea>
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