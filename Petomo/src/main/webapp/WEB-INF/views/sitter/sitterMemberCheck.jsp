<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
       <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script>
    $(function(){
   	init();
	});
    function init() {
    var memberId = $("#memberId").val();
    var tag = "";
    	$.ajax({
    		type:'GET'
    		, data : {"mb_id":memberId}
    		, url : 'dogList'
    		, success : function doglist(resp) {
    	    	for (var i = 0; i < resp.length; i++)
    			{ tag += '<tr>';
    				tag += '<td>'+resp[i].pet_name+'</td>';
    				tag += '<td>'+resp[i].pet_type+'</td>';
    				tag += '<td>'+resp[i].pet_breed+'</td>';
    				tag += '<td>'+resp[i].pet_status+'</td;>';
    				tag += '<td>'+resp[i].pet_sex+'</td>';
    				tag += '<td>'+resp[i].pet_weight+'</td>';
    				tag += '<td>'+resp[i].pet_birth+'</td>';
    				tag += '<td>'+resp[i].pet_neuter+'</td>';
    				tag += '<td><form action = "deletePet" method = "post">';
    				tag += '<input class="del" data-value="'+resp[i].pet_id+'" type="submit" value="削除" id = "delete"/>';
    				tag += '<input type = "hidden" name = "pet_id" value = "'+resp[i].pet_id+'">';
    				tag += '</form>';
    				tag += '</td>';
    				tag += '<td>';
    				tag += '</form>';
    				tag += '</td>';
    				tag += '</td>';
    				tag += '</tr>';
    			}
    			$("#dog").html(tag);//#book 태그 밑에 tag추가
				$("#petnumber").html(resp.length);

    	    }
    	});
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
                        <h2 class="page-title">プロフィール</h2>
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
                            <li class="active">
                                <a href="memberProfile"><span class="lnr icon-home"></span>プロフィール</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    <section class="author-profile-area">
    
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="author-profile">
                        <div class="row">
                            <div class="col-lg-5 col-md-7">
                                <div class="author-desc">
                                        <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${sessionScope.sessionProfileImg}" alt="Author profile area" height="100px" width="100px">
             
                                    <div class="infos">
                                        <h4>${sessionScope.sessionId}</h4>
                                        <input type = "hidden" value = "${sessionScope.sessionId}" id = "memberId">
                                    </div>
                                </div><!-- ends: .author-desc -->
                            </div><!-- ends: .col-lg-5 -->
                            <div class="col-lg-3 order-lg-2 col-md-5 order-md-1">
                                <div class="author-stats">
                                    <ul>
                                        <li class="t_items">
                                            <span id = "petnumber"></span>
                                            <p>ペット数</p>
                                        </li>
                                        <li class="t_reviews">
                               <!--              <div>
                                                <span class="ratings">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </span>
                                                <span class="avg_r">5.0</span>
                                                <span>(226 reviews)</span>
                                            </div> -->
                                        </li>
                                    </ul>
                                </div><!-- ends: .author-stats -->
                            </div><!-- ends: .col-lg-4 -->
                        </div>
                    </div>
                </div><!-- ends: .col-lg-12 -->
                <div class="dashboard_contents dashboard_statement_area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="dashboard__title">
                                <h3>ペットリスト</h3>
                            </div>
                        </div>
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
               
                <div class="row">
                    <div class="col-md-12">
                        <div class="statement_table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th width=100>名前</th>
                                        <th width=100>種類</th>
                                        <th width=100>品種</th>
                                        <th width=300>性格</th>
                                        <th width=100>性別</th>
                                        <th width=100>体重</th>
                                        <th width=200>誕生日</th>
                                        <th width=125>中性化</th>
                                    </tr>
                                </thead>
                                <tbody id = "dog">
                              
                                </tbody>
                            </table>
                        </div><!-- ends: .statement_table -->
                    </div>
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
    </section><!-- ends: .author-profile-area -->
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