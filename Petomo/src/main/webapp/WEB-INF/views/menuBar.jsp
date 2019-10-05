<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTR-8">
<title>Insert title here</title>

    <!-- viewport meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="DigiPro - Digital Products Marketplace ">
    <meta name="keywords" content="marketplace, easy digital download, digital product, digital, html5">


    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">
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
<!--     <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-32x32.png"> -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function(){


	$("#streamService").on("click",function(){
		var streamid = "${sessionScope.streamServer}";
		
		if(streamid.length == 0){
		 alert("まだストリーミング中ではありません。");
		 return false;}
		});
});

</script>
</head>
<body>

    <!-- start menu-area -->
    <div class="menu-area">
        <div class="top-menu-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="menu-fullwidth">
                            <div class="logo-wrapper">
                                <div class="logo logo-top">
                                    <a href="/">
                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/logo_small.png"
											alt="logo image" class="img-fluid" height="50px" width="50px"></a>
                                		<br><a href="memberLogin">mb1</a>
                                            <a href="sitterLoginTest">st1</a>
                                            <a href="logout">out</a>
                                            <font color="red">${sessionScope.sessionId}</font>
                                </div>
                            </div>
                           
                         <div class="mobile_content ">
                                    <span class="icon-user menu_icon"></span>
                                    <!-- offcanvas menu -->
                                    <div class="offcanvas-menu closed">
                                        <span class="icon-close close_menu"></span>
                                        
                                         <c:if test="${sessionScope.sessionId == null }">
	   					                  <div class="author-author__info">
                                            <a href="login">Login</a>
	                                      </div>
                                        </c:if>
                               
                                         <c:if test="${sessionScope.sessionId!=null && sessionScope.sessionSitter!=null}">
                                        <div class="author-author__info">
                                            <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                        </div>
                                       
                                        <p>${sessionScope.sessionName}</p>
                                        </div>
                                        <!--end /.author-author__info-->
                                        <div class="author__notification_area">
                                            <ul>
                                                <li>
                                                    <a href="notification.html">
                                                        <div class="icon_wrap">
                                                            <span class="icon-bell"></span>
                                                        </div>
                                                    </a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                        <!--start .author__notification_area -->
                                        <div class="dropdown dropdown--author">
                                            <ul>
                                               <li>
                                                    <a href="sitterInfoModi" >
                                                        <span class="icon-user"></span>マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="memberResList">
                                                        <span class="icon-home"></span>予約照会</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                                <li>
                                                    <a href="sitterStreaming">
                                                        <span class="icon-notebook"></span>ストリーミングサービス
</a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                      
                                            </ul>
                                        </div>
                                         </c:if>
                                    </div>
                                </div>   
                                <!-- end /.mobile_content -->
                        
                        
                            <div class="author-menu">
                                <!-- start .author-area -->
                                <div class="author-area">
                                    <div class="search-wrapper">
                                        <div class="nav_right_module search_module">
<!--                                             <span class="icon-magnifier search_trigger"></span> -->
                                            <div class="search_area">
<!--                                                 <form action="#"> -->
<!--                                                     <div class="input-group input-group-light"> -->
<!--                                                         <span class="icon-left" id="basic-addon1"> -->
<!--                                                             <i class="icon-magnifier"></i> -->
<!--                                                         </span> -->
<!--                                                         <input type="text" class="form-control search_field" placeholder="Type words and hit enter..."> -->
<!--                                                     </div> -->
<!--                                                 </form> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="author__notification_area">
                                        <ul>
                                            <li class="has_dropdown">
                                                <div class="icon_wrap">
                                                    <span class="icon-bell"></span>
                                                    <span class="notification_status noti"></span>
                                                </div>
                                                <div class="dropdown notification--dropdown">
                                                    <div class="dropdown_module_header">
                                                        <h6>My Notifications</h6>
                                                    </div>
                                                    <div class="notifications_module">
                                                        <div class="notification">
                                                            <div class="notification__info">
                                                                <div class="info_avatar">
                                                                    <img src="img/notification_head.png" alt="">
                                                                </div>
                                                                <div class="info">
                                                                    <p>
                                                                        <span>Anderson</span> added to Favourite
                                                                        <a href="#">Mccarther Coffee Shop</a>
                                                                    </p>
                                                                    <p class="time">Just now</p>
                                                                </div>
                                                            </div>
                                                            <!-- end /.notifications -->
                                                            <div class="notification__icons ">
                                                                <span class="icon-heart loved noti_icon"></span>
                                                            </div>
                                                            <!-- end /.notifications -->
                                                        </div>
                                                        <!-- end /.notifications -->
                                                         
                                                         
                                                         
                                                        <div class="text-center m-top-30 p-left-20 p-right-20"><a href="notification.html" class="btn btn-primary btn-md btn-block">View
                                                                All</a></div>
                                                        <!-- end /.notifications -->
                                                    </div>
                                                    <!-- end /.dropdown -->
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!--start .author-author__info-->
                                    
                                    <!-- 비로그인시 -->
                                        <c:if test="${sessionScope.sessionId == null }">
	   					                  <div class="author-author__info">
                                            <a href="login">ログイン</a>
	                                      </div>
                                        </c:if>
                                      
<!--                                     멤버로그인 -->
                                   <c:if test="${sessionScope.sessionId!=null && sessionScope.sessionSitter==null}">
                                     <div class="author-author__info has_dropdown">
                                        <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                            
                                        </div>
                                        <div class="dropdown dropdown--author">
                                            <div class="author-credits d-flex">
                                                <div class="author__avatar">
                                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                                </div>
                                                 <div class="autor__info">
                                                    <p class="name">
                                                      <a href = "memberProfile"> ${sessionScope.sessionName}</a>
                                                    </p>
<!--                                                     <p class="amount">$20.45</p> -->
                                                </div> 
                                            </div>
                                            <ul>
                                                <li>
                                                    <a href="updateCheck" >
                                                        <span class="icon-user"></span>マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="memberResList">
                                                        <span class="icon-home"></span>予約照会</a>
                                                </li>
                                                <li>
                                                <a href = "streamingService" id = "streamService" >ストリーミング</a>                                               
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                   </c:if>

                                
<!--                                 시터로그인-->
                           			<c:if test="${sessionScope.sessionId!=null && sessionScope.sessionSitter!=null}">
                                     <div class="author-author__info has_dropdown">
                                        <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                        </div>
                                        <div class="dropdown dropdown--author">
                                            <div class="author-credits d-flex">
                                                <div class="author__avatar">
                                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                                </div>
                                                 <div class="autor__info">
                                                    <p class="name">
                                                       ${sessionScope.sessionName}
                                                    </p>
<!--                                                     <p class="amount">$20.45</p> -->
                                                </div> 
                                            </div>
                                            <ul>
                                                <li>
                                                    <a href="sitterInfoModi">
                                                        <span class="icon-user"></span>マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="sitterResList">
                                                        <span class="icon-notebook"></span>予約リスト</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                            
                                            </ul>
                                        </div>
                                    </div>
                                   </c:if>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- author area restructured for mobile -->
                               
                <!-- end /.row -->
            </div>
            <!-- end /.container -->
        </div>
        <!-- end  -->
    </div>
    <!-- end /.menu-area -->


<!-- 스타일 스크립트 -->
<!-- <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxflHHc5FlDVI-J71pO7hM1QJNW1dRp4U"></script> -->
    <!-- inject:js-->
<!--     <script src="vendor_assets/js/jquery/jquery-1.12.4.min.js"></script> -->
<!--     <script src="vendor_assets/js/jquery/uikit.min.js"></script> -->
<!--     <script src="vendor_assets/js/bootstrap/popper.js"></script> -->
<!--     <script src="vendor_assets/js/bootstrap/bootstrap.min.js"></script> -->
<!--     <script src="vendor_assets/js/chart.bundle.min.js"></script> -->
<!--     <script src="vendor_assets/js/grid.min.js"></script> -->
<!--     <script src="vendor_assets/js/jquery-ui.min.js"></script> -->
<!--     <script src="vendor_assets/js/jquery.barrating.min.js"></script> -->
<!--     <script src="vendor_assets/js/jquery.countdown.min.js"></script> -->
<!--     <script src="vendor_assets/js/jquery.counterup.min.js"></script> -->
<!--     <script src="vendor_assets/js/jquery.easing1.3.js"></script> -->
<!--     <script src="vendor_assets/js/jquery.magnific-popup.min.js"></script> -->
<!--     <script src="vendor_assets/js/owl.carousel.min.js"></script> -->
<!--     <script src="vendor_assets/js/select2.full.min.js"></script> -->
<!--     <script src="vendor_assets/js/slick.min.js"></script> -->
<!--     <script src="vendor_assets/js/tether.min.js"></script> -->
<!--     <script src="vendor_assets/js/trumbowyg.min.js"></script> -->
<!--     <script src="vendor_assets/js/venobox.min.js"></script> -->
<!--     <script src="vendor_assets/js/waypoints.min.js"></script> -->
<!--     <script src="theme_assets/js/dashboard.js"></script> -->
<!--     <script src="theme_assets/js/main.js"></script> -->
<!--     <script src="theme_assets/js/map.js"></script> -->
    <!-- endinject-->



</body>
</html>

