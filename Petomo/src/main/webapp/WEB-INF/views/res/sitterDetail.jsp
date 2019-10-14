<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
</head>
<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">シッターページ</h2>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="author-profile-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="author-profile">
                        <div class="row">
                            <div class="col-lg-5 col-md-7">
                                <div class="author-desc">
                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sitter.st_id}.png" alt="" style="width:120px; height: 120px;">
                                    <div class="infos">
                                        <h4>${sitter.st_name}</h4>
                                    </div>
                                </div><!-- ends: .author-desc -->
                            </div><!-- ends: .col-lg-5 -->
                            <div class="col-lg-4 order-lg-1 col-md-12 order-md-2">
                                <div class="author-social social social--color--filled">
                                    <ul>
                                       <li>
                                       </li>
                                    </ul>
                                </div><!-- ends: .author-social -->
                            </div><!-- ends: .col-lg-3 -->
                            <div class="col-lg-3 order-lg-2 col-md-5 order-md-1">
                                <div class="author-stats">
                                    <ul>
                                        <li class="t_items" style="margin-bottom:10px;">
                                            <span>${rCount}</span>
                                            <p>今までの予約</p>
                                        </li>
                                        <li class="t_sells" style="width:100px;">
                                        <span >
                                        <c:if test="${sitter.st_level=='bronze'}">
                                    		<img style="width:40px;" src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/bronze.png" alt="">
                                        </c:if>
                                        <c:if test="${sitter.st_level=='silver'}">
                                    		<img style="width:40px;" src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/silver.png" alt="">
                                        </c:if>
                                        <c:if test="${sitter.st_level=='gold'}">
                                    		<img style="width:40px;" src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/gold.png" alt="">
                                        </c:if>                                                                                
										</span>                                        
                                        </li>
                                        </ul>
                                        <ul>
                                        <li class="t_reviews" style="margin-bottom:10px;">
                                            <div class="rating product--rating">
                                                <span class="ratings">
                                                	<c:if test="${'5' eq sitter.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>                                                		 
                                                	</c:if>
                                                	<c:if test="${'4' eq sitter.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>                                                		 
                                                	</c:if>
                                                	<c:if test="${'3' eq sitter.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>                                                  		 
                                                	</c:if>
                                                	<c:if test="${'2' eq sitter.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>                                                 		 
                                                	</c:if>
                                                	<c:if test="${'1' eq sitter.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>                                                		 
                                                	</c:if>
                                                	<c:if test="${'0' eq sitter.st_rate}">
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>                                                		 
                                                	</c:if>
                                                </span>
                                                <span class="avg_r">${sitter.st_rate}</span>
                                            </div>
                                        </li>

                                    </ul>
                                    <ul>
                                     	<li>
                                         <a href="reservation?st_id=${sitter.st_id}" class="btn btn--round btn-outline-primary btn-lg">予約</a>
                                        </li>
                                    </ul>
                                </div><!-- ends: .author-stats -->
                            </div><!-- ends: .col-lg-4 -->
                        </div>
                    </div>
                </div><!-- ends: .col-lg-12 -->
                <div class="col-md-12 author-info-tabs">
                    <ul class="nav nav-tabs" id="author-tab" role="tablist">
                        <li>
                            <a class="active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Profile</a>
                        </li>
                        <li>
                            <a id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
                        </li>
                    </ul><!-- Ends: .nav-tabs -->
					<div class="tab-content" id="author-tab-content">
                        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="author_module about_author">
                                <h3>
                                    <span>紹介文</span>
                                </h3>
                                <p>${sitter.st_info}</p>
                            </div>
                         </div>
                        <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-title-area">
                                    </div><!-- ends: .product-title-area -->
                                    <div class="thread thread_review thread_review2">
                                        <ul class="media-list thread-list">
                                            <c:forEach items="${rList}" var="res">
                                           	 	<c:if test="${res.res_review!=null}">
		                                            <li class="single-thread">
		                                                <div class="media">
		                                                    <div class="media-left">
		                                                        <a href="#">
		                                                            <img class="media-object" style="height: 70px; width:70px;"
		                                                            src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${res.mb_id}.png">
		                                                        </a>
		                                                    </div>
		                                                    <div class="media-body">
		                                                        <div class="d-flex flex-wrap">
		                                                            <div class="">
		                                                                <div class="media-heading">
		                                                                    <a href="author.html">
		                                                                        <h4>${res.mb_id}</h4>
		                                                                    </a>
		                                                                </div>
		                                                                <div class="rating product--rating">
		                                                                    <ul>
		                                                                        <li>
		                                                                            <span class="fa fa-star"></span>
		                                                                        </li>
		                                                                        <li>
		                                                                            <span class="fa fa-star"></span>
		                                                                        </li>
		                                                                        <li>
		                                                                            <span class="fa fa-star"></span>
		                                                                        </li>
		                                                                        <li>
		                                                                            <span class="fa fa-star"></span>
		                                                                        </li>
		                                                                        <li>
		                                                                            <span class="fa fa-star-half-o"></span>
		                                                                        </li>
		                                                                    </ul>
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                        <p>${res.res_review}</p>
		                                                    </div>
		                                                </div>
		                                            </li>
	                                            </c:if>
                                            </c:forEach>
                                        </ul><!-- ends: .media-list -->
                                    </div><!-- ends: .comments -->
                                </div><!-- ends: .col-md-12 -->
                        </div><!-- Ends: reviews-tab -->
                        <!-- Ends: followers-tab -->
                    </div><!-- ends: .tab-content -->
                </div><!-- Ends: .author-info-tabs -->
            </div>
        </div>
        </div>
    </section><!-- ends: .author-profile-area -->
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
   </body>
</html>