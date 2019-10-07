<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="DigiPro - Digital Products Marketplace ">
    <meta name="keywords" content="marketplace, easy digital download, digital product, digital, html5">
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
    <meta charset="UTF-8">
    <title>Petomo</title>
</head>
<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
    <!-- 파랑이 시작 -->
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">Author Profile</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Author Profile</a>
                                </li>
                            </ul>
                        </div>
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
                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sitter.st_id}.png" alt="">
                                    <div class="infos">
                                        <h4>${sitter.st_id}</h4>
                                        <span>${sitter.st_level}</span>
                                        
                                    </div>
                                </div><!-- ends: .author-desc -->
                            </div><!-- ends: .col-lg-5 -->
                            <div class="col-lg-4 order-lg-1 col-md-12 order-md-2">
                                <div class="author-social social social--color--filled">
                                    <ul>
                                       <li>
                                          <a href="reservation?st_id=${sitter.st_id}" class="btn btn-primary btn--xs">예약하기</a>
                                       </li>
                                    </ul>
                                </div><!-- ends: .author-social -->
                            </div><!-- ends: .col-lg-3 -->
                            <div class="col-lg-3 order-lg-2 col-md-5 order-md-1">
                                <div class="author-stats">
                                    <ul>
                                        <li class="t_items">
                                            <span>146</span>
                                            <p>Total Items</p>
                                        </li>
                                        <li class="t_sells">
                                            <span>2426</span>
                                            <p>Total Sales</p>
                                        </li>
                                        <li class="t_reviews">
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
                        <!-- <li>
                            <a id="items-tab" data-toggle="tab" href="#items" role="tab" aria-controls="items" aria-selected="false">Author Items</a>
                        </li> -->
                        <li>
                            <a id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
                        </li>
                       <!--  <li>
                            <a id="followers-tab" data-toggle="tab" href="#followers" role="tab" aria-controls="followers" aria-selected="false">Followers</a>
                        </li>
                        <li>
                            <a id="following-tab" data-toggle="tab" href="#following" role="tab" aria-controls="following" aria-selected="false">Following</a>
                        </li> -->
                    </ul><!-- Ends: .nav-tabs -->
                    <div class="tab-content" id="author-tab-content">
                        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="author_module about_author">
                                <h3>Hi,
                                    <span>I am ${sitter.st_id}</span>
                                </h3>
                                <p>${sitter.st_info}</p>
                            </div>
                            </div>

						<div class="tab-pane fade" id="reviews" role="tabpanel"
							aria-labelledby="reviews-tab">
							<div class="row">
								<div class="col-md-12">
									<div class="thread thread_review thread_review2">
										<ul class="media-list thread-list">
											<li class="single-thread">
												<div class="media">
													<div class="media-left">
														<!-- <a href="#"> <img class="media-object"
															src="img/m1.png" alt="Commentator Avatar">
														</a> -->
													</div>
													<div class="media-body">
														<c:forEach items="${rList}" var="res">
							
															<%-- <c:if test="${sitter.st_id eq res.st_id}"> --%>
																<div class="d-flex flex-wrap">
																	<div class="">
																		<div class="media-heading">
																			<h4>${res.mb_id}</h4>
																		</div>
																		<div class="rating product--rating">
																			<ul>
																				<li><span class="fa fa-star"></span></li>
																				<li><span class="fa fa-star"></span></li>
																				<li><span class="fa fa-star"></span></li>
																				<li><span class="fa fa-star"></span></li>
																				<li><span class="fa fa-star-half-o"></span></li>
																			</ul>
																		</div>
																	</div>
																</div>
																<p>${res.res_memo}</p>
															<%-- </c:if> --%>
														</c:forEach>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
							</div></section><!-- ends: .author-profile-area -->
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