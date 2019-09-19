<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Petomo123</title>
</head>

<body class="preload">
    
<!--     상단메뉴 불러오기 -->
    <jsp:include page="menuBar.jsp" /> 

<!-- 서치메뉴바 불러오기 -->
    <jsp:include page="searchBar.jsp" /> 
    
<!--     본문 -->

	<div class="col-md-12 product-list">
		<div class="row">
			<c:forEach items="${result}" var="SitterVO">
				<div class="col-lg-4 col-md-6">
					<div class="product-single latest-single">
						<div class="product-thumb">
							<div class="s-promotion">-40%</div>
							<figure>
								<img src="img/product1.png" alt="" class="img-fluid">
								<figcaption>
									<ul class="list-unstyled">
										<li><a href=""><span class="icon-basket"></span></a></li>
										<li><a href="">Live Demo</a></li>
									</ul>
								</figcaption>
							</figure>
						</div>
						<!-- Ends: .product-thumb -->
						<div class="product-excerpt">
							<h5>
								<a href="goSitterDetail?st_id=${SitterVO.st_id }"> ${SitterVO.st_id}</a>
							</h5>
							<ul class="titlebtm">
								<li><img class="auth-img" src="img/auth-img.png"
									alt="author image">
									<p>
										<a href="#">Theme-Valley</a>
									</p></li>
								<li class="product_cat">in <a href="#">WordPress</a>
								</li>
							</ul>
							<ul class="product-facts clearfix">
								<li class="price">$24</li>
								<li class="sells"><span class="icon-basket"></span>141</li>
								<li class="product-fav"><span class="icon-heart"
									title="Add to collection" data-toggle="tooltip"></span></li>
								<li class="product-rating">
									<ul class="list-unstyled">
										<li><span class="rate_active"></span></li>
										<li><span class="rate_active"></span></li>
										<li><span class="rate_active"></span></li>
										<li><span class="rate_active"></span></li>
										<li><span class="rate_disabled"></span></li>
									</ul>
								</li>
							</ul>
						</div>
						<!-- Ends: .product-excerpt -->
					</div>
					<!-- Ends: .product-single -->
				</div>
				<!-- ends: .col-lg-4 -->
			</c:forEach>

			<%-- <tbody>
		<c:forEach items="${result}" var="SitterVO">
			<tr>
				<td>${SitterVO.st_id}</td><br>
			</tr>
		</c:forEach>
	</tbody> --%>

			<%-- <c:set var="size" value="${fn:length(nameList)}" />
		<c:forEach var="i" begin="1" end="${size}">
			<p>
				<c:out value="${nameList[size - i]}" />
			</p> --%>
			<%-- </c:forEach> --%>

			<!-- 하단메뉴바 불러오기 -->
			<jsp:include page="footerBar.jsp" />
</body>
</html>