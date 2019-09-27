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
    <!-- inject:css-->
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
    <!-- endinject -->
    <!-- Favicon Icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-32x32.png">

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
                                    <a href="/"><img src="img/logo.png" alt="logo image" class="img-fluid"></a>
                                		<br><a href="memberLogin">mb1</a>
                                            <a href="sitterLogin">st1</a>
                                            <a href="logout">out</a>
                                            <font color="red">${sessionScope.loginId}</font>
                                
                                </div>
                            </div>
                            <div class="menu-container">
                                <div class="d_menu">
                                    <nav class="navbar navbar-expand-lg mainmenu__menu">
                                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-controls="bs-example-navbar-collapse-1" aria-expanded="false" aria-label="Toggle navigation">
                                            <span class="navbar-toggler-icon icon-menu"></span>
                                        </button>
                                        <!-- Collect the nav links, forms, and other content for toggling -->
                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                            <ul class="navbar-nav">
                                                <li class="has_dropdown">
                                                    <a href="index.html">Home</a>
                                                    <div class="dropdown dropdown--menu">
                                                        <ul>
                                                            <li>
                                                                <a href="introducePetomo">기업소개</a>
                                                            </li>
                                                          <!--   <li>
                                                                <a href="index2.html">Home Two Single User</a>
                                                            </li>
                                                            <li>
                                                                <a href="index3.html">Home Three Product</a>
                                                            </li>
                                                            <li>
                                                                <a href="index4.html">Home Four Product</a>
                                                            </li>
                                                            <li>
                                                                <a href="index5.html">Home Five Product</a>
                                                            </li> -->
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="has_dropdown">
                                                    <a href="all-products.html">Sitter★</a>
                                                    <div class="dropdown dropdown--menu">
                                                        <ul>
                                                            <li>
                                                                <a href="sitterInfoModi">정보수정</a>
                                                            </li>
                                                            <li>
                                                                <a href="streamingService">채팅창</a>
                                                            </li>
                                                        </ul>
                                                        <ul>
                                                            <li>
                                                                <a href="sitterList">시터리스트</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="has_dropdown">
                                                    <a href="all-products.html">Manager☆</a>
                                                    <div class="dropdown dropdown--menu">
                                                        <ul>
                                                            <li>
                                                                <a href="manager">매니져마이페이지</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- /.navbar-collapse -->
                                    </nav>
                                </div>
                            </div>
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
                                            <li class="has_dropdown">
                                                <div class="icon_wrap">
                                                    <span class="icon-envelope-open"></span>
                                                    <span class="notification_status msg"></span>
                                                </div>
                                                <div class="dropdown messaging--dropdown">
                                                    <div class="dropdown_module_header">
                                                        <h6>My Messages</h6>
                                                    </div>
                                                    <div class="messages">
                                                        <a href="message.html" class="message recent">
                                                            <div class="message__actions_avatar">
                                                                <div class="avatar">
                                                                    <img src="img/notification_head4.png" alt="">
                                                                </div>
                                                            </div>
                                                            <!-- end /.actions -->
                                                            <div class="message_data">
                                                                <div class="name_time">
                                                                    <div class="name">
                                                                        <p>NukeThemes</p>
                                                                        <span class="icon-envelope"></span>
                                                                    </div>
                                                                    <span class="time">Just now</span>
                                                                    <p>Hello John Smith! Nunc placerat mi ...</p>
                                                                </div>
                                                            </div>
                                                            <!-- end /.message_data -->
                                                        </a>
                                                        <!-- end /.message -->
                                                         
                                                    </div>
                                                    <div class="text-center m-top-30 m-bottom-30 p-left-20 p-right-20">
                                                        <a href="message.html" class="btn btn-primary btn-md btn-block">View All</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="has_dropdown">
                                                <div class="icon_wrap">
                                                    <span class="icon-basket-loaded"></span>
                                                    <span class="notification_count purch">2</span>
                                                </div>
                                                <div class="dropdown dropdown--cart">
                                                    <div class="cart_area">
                                                        <div class="cart_list">
                                                            <div class="cart_product">
                                                                <div class="product__info">
                                                                    <div class="thumbn">
                                                                        <img src="img/capro1.jpg" alt="cart product thumbnail">
                                                                    </div>
                                                                    <div class="info">
                                                                        <a class="title" href="single-product.html">Finance
                                                                            and Consulting Business Theme</a>
                                                                        <div class="cat">
                                                                            <a href="#">
                                                                                <img src="img/catword.png" alt="">Wordpress</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="product__action">
                                                                    <a href="#">
                                                                        <span class="icon-trash"></span>
                                                                    </a>
                                                                    <p>$60</p>
                                                                </div>
                                                            </div>
                                                            <div class="cart_product">
                                                                <div class="product__info">
                                                                    <div class="thumbn">
                                                                        <img src="img/capro2.jpg" alt="cart product thumbnail">
                                                                    </div>
                                                                    <div class="info">
                                                                        <a class="title" href="single-product.html">Flounce
                                                                            - Multipurpose OpenCart Theme</a>
                                                                        <div class="cat">
                                                                            <a href="#">
                                                                                <img src="img/catword.png" alt="">Wordpress</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="product__action">
                                                                    <a href="#">
                                                                        <span class="icon-trash"></span>
                                                                    </a>
                                                                    <p>$60</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="total">
                                                            <p>
                                                                <span>Total :</span>$80</p>
                                                        </div>
                                                        <div class="cart_action">
                                                            <a class="btn btn-primary" href="cart.html">View
                                                                Cart</a>
                                                            <a class="btn btn-secondary" href="checkout.html">Checkout</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!--start .author-author__info-->
                                   <c:if test="${sessionScope.sessionId != null }">
                                     <div class="author-author__info has_dropdown">
                                        <div class="author__avatar online">
                                            <img src="img/user-avater.png" alt="user avatar" class="rounded-circle">
                                        </div>
                                        <div class="dropdown dropdown--author">
                                            <div class="author-credits d-flex">
                                                <div class="author__avatar">
                                                    <img src="img/user-avater.png" alt="user avatar" class="rounded-circle">
                                                </div>
                                                 <div class="autor__info">
                                                    <p class="name">
                                                       ${sessionScope.sessionName}
                                                    </p>
                                                    <p class="amount">$20.45</p>
                                                </div> 
                                            </div>
                                            <ul>
                                                <li>
                                                    <a href="memberProfile">
                                                        <span class="icon-user"></span>Profile</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard.html">
                                                        <span class="icon-home"></span> Dashboard</a>
                                                </li>
                                                <li>
                                                    <a href="updateCheck">
                                                        <span class="icon-settings"></span> Setting</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>Logout</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    	</c:if>
                                    <!--end /.author-author__info-->
                                    <!-- login -->
   					
                                                        <ul>
                                                            <li>
                                          	<c:if test="${sessionScope.sessionId == null }">
                                                                <a href="login">Login</a>
                                                     </c:if>
                                                            </li>
                                                        </ul>
                                                    </div>
                                    
                                   
                                </div>
                                <!-- end .author-area -->
                                <!-- author area restructured for mobile -->
                                <div class="mobile_content ">
                                    <span class="icon-user menu_icon"></span>
                                    <!-- offcanvas menu -->
                                    <div class="offcanvas-menu closed">
                                        <span class="icon-close close_menu"></span>
                                        <div class="author-author__info">
                                            <div class="author__avatar v_middle">
                                                <img src="img/user-avater.png" alt="user avatar">
                                            </div>
                                        </div>
                                        <!--end /.author-author__info-->
                                        <div class="author__notification_area">
                                            <ul>
                                                <li>
                                                    <a href="notification.html">
                                                        <div class="icon_wrap">
                                                            <span class="icon-bell"></span>
                                                            <span class="notification_count noti">25</span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="message.html">
                                                        <div class="icon_wrap">
                                                            <span class="icon-envelope"></span>
                                                            <span class="notification_count msg">6</span>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="cart.html">
                                                        <div class="icon_wrap">
                                                            <span class="icon-basket"></span>
                                                            <span class="notification_count purch">2</span>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <!--start .author__notification_area -->
                                        <div class="dropdown dropdown--author">
                                            <ul>
                                                <li>
                                                    <a href="author.html">
                                                        <span class="icon-user"></span>Profile</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard.html">
                                                        <span class="icon-home"></span> Dashboard</a>
                                                </li>
                                                <li>
                                                    <a href="updatecheck">
                                                        <span class="icon-settings"></span> Setting</a>
                                                </li>
                                                <li>
                                                    <a href="cart.html">
                                                        <span class="icon-basket"></span>Purchases</a>
                                                </li>
                                                <li>
                                                    <a href="favourites.html">
                                                        <span class="icon-heart"></span> Favourite</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard-add-credit.html">
                                                        <span class="icon-credit-card"></span>Add Credits</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard-statement.html">
                                                        <span class="icon-chart"></span>Sale Statement</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard-upload.html">
                                                        <span class="icon-cloud-upload"></span>Upload Item</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard-manage-item.html">
                                                        <span class="icon-notebook"></span>Manage Item</a>
                                                </li>
                                                <li>
                                                    <a href="dashboard-withdrawal.html">
                                                        <span class="icon-briefcase"></span>Withdrawals</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>Logout</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="text-center">
                                            <a href="signup.html" class="author-area__seller-btn inline">Become a
                                                Seller</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- end /.mobile_content -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end /.row -->
            </div>
            <!-- end /.container -->
        </div>
        <!-- end  -->
    </div>
    <!-- end /.menu-area -->


<!-- 스타일 스크립트 -->

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

