<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
</head>

<body class="preload">
<jsp:include page="menuBar.jsp" /> 

    <section class="hero-area4 bgimage">
        <div class="bg_image_holder">
            <img src="img/shape_2.png" alt="background-image">
        </div>
        <div class="hero-content content_above">
            <div class="content-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hero__content__title">
                                <h1><span>${memberNumber}</span> CUSTOMER</h1>
                               	<h1><span>${sitterNumber}</span> PETSITTER</h1>
                            </div><!-- end .hero__btn-area-->
                            <div class="search-area">
                                    <div class="col-lg-8 offset-lg-2">
                                            <form action  = "signupMember" method = "GET">
                                                <span style ="float:left">
                                                <button type="submit" class="search-btn btn--lg btn-primary"  >一般ユーザー</button>
                                                </span></form>
                                              <form action = "signupSitter" method = "GET">
                                                <span style ="float:right">
                                                <button type="submit" class="search-btn btn--lg btn-primary">ペットシッター</button>
                                                </span></form>
                                   
                                    </div>
                                </div>
                            </div>
                            <!--start .search-area -->
                        </div><!-- end .col-md-12 -->
                    </div>
                </div>
            </div><!-- end .contact_wrapper -->
        </div><!-- end hero-content -->
    </section><!-- ends: .hero-area -->
    
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