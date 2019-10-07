<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
</head>

<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
			
<section class="hero-area2 hero-area3 bgimage">
        <div class="bg_image_holder">
            <img src="img/hero-image01.png" alt="background-image">
        </div>
        <div class="hero-content content_above">
            <div class="content-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hero__content__title">
                            </div><!-- end .hero__btn-area-->
                            <div class="search-area">
                                <div class="row">
                                    <div class="col-lg-6 offset-lg-3">
                                        <div class="search_box2">
                                            <form action="#">
                                                <input type="text" class="text_field" placeholder="地域名" value="st_loc1">
                                                <button type="submit" class="search-btn btn--lg btn-primary">検索</button>
                                            </form>
                                        </div><!-- end .search_box -->
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
    
    
    
    <section class="bgcolor p-top-100 p-bottom-40">
        <div class="shortcode_wrapper">
            <div class="container">
                <div class="row">
                    <c:forEach items="${result}" var="SitterVO">
							<div class="col-lg-3 col-md-6">
			                        <div class="team-single">
			                            <figure>
			                            	<div class="s_img_sitterList">
			                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${SitterVO.st_id}.png" alt="" class="img-fluid rounded-circle s_img_sitterList">
			                                </div>
			                                <figcaption>
			                                    <h5><a href="sitterDetail?st_id=${SitterVO.st_id}"> ${SitterVO.st_name}</a></h5>
			                                    
			                                    <div style="height: 40px; width:195px;">
			                                    <span style="font-size:12px;">${SitterVO.st_loc1}</span>
			                                    </div>
			                                    
<%-- 			                                   
 <span class="member-title"><a href="sitterDetail?st_id=${SitterVO.st_id}">予約</a></span> --%>
			                                    <ul class="list-unstyled team-social">
			                                        <li class="t_reviews">
                                            <div class="rating product--rating">
                                                <span class="ratings">
                                                	<c:if test="${'5' eq SitterVO.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>                                                		 
                                                	</c:if>
                                                	<c:if test="${'4' eq SitterVO.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>                                                		 
                                                	</c:if>
                                                	<c:if test="${'3' eq SitterVO.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>                                                  		 
                                                	</c:if>
                                                	<c:if test="${'2' eq SitterVO.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>                                                 		 
                                                	</c:if>
                                                	<c:if test="${'1' eq SitterVO.st_rate}">
                                                		 <i class="fa fa-star"></i>
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>  
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>                                                		 
                                                	</c:if>
                                                	<c:if test="${'0' eq SitterVO.st_rate}">
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>
                                                		 <i class="fa fa-star-o"></i>                                                		 
                                                	</c:if>
                                                </span>
                                            </div>
                                        </li>
			                                    </ul>
			                                </figcaption>
			                            </figure>
			                        </div><!-- ends: .team-single -->
			                    </div><!-- ends: .col-lg-3 -->                    
                   </c:forEach>
                </div>
            </div><!-- end .container -->
        </div><!-- ends: .shortcode_wrapper -->
     </section>
     
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