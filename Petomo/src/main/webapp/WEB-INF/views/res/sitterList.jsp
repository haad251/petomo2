<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
</head>

<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
    <jsp:include page="../searchBar.jsp" /> 
	<div class="col-md-12 product-list">
		<div class="row">
			<c:forEach items="${result}" var="SitterVO">
				<div class="col-lg-4 col-md-6">
					<div class="product-single latest-single">
						<div class="product-thumb">
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
								<a href="sitterDetail?st_id=${SitterVO.st_id }"> ${SitterVO.st_id}</a>
							</h5>
							<!-- <ul class="product-facts clearfix">
								<li class="price">$24</li>
								<li class="sells"><span class="icon-basket"></span>141</li>
								<li class="goFavorite"><span class="icon-heart"
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
							</ul> -->
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
			
			
</body>
</html>