<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Petomo</title>
</head>

<body class="preload">
    
<!--     상단메뉴 불러오기 -->
    <jsp:include page="menuBar.jsp" />

<!-- 파란화면 -->
	<section class="breadcrumb-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumb-contents">
						<h2 class="page-title">장바구니</h2>
						<div class="breadcrumb">
							<ul>
								<li><a href="#">Home</a></li>
								<li class="active"><a href="#">장바구니</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- end .col-md-12 -->
			</div>
			<!-- end .row -->
		</div>
		<!-- end .container -->
	</section>
	<!-- ends: .breadcrumb-area -->
	
	
	
	<!-- 메인화면 -->
 <section class="cart_area section--padding bgcolor">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product_archive added_to__cart">
                        <div class="table-responsive single_product">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <h4>Product Details</h4>
                                        </th>
                                        <th scope="col">
                                            <h4>Category</h4>
                                        </th>
                                        <th scope="col">
                                            <h4>Price</h4>
                                        </th>
                                        <th scope="col">
                                            <h4>Remove</h4>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="1">
                                            <div class="product__description">
                                                <div class="p_image"><img src="img/pur1.jpg" alt="Purchase image"></div>
                                                <div class="short_desc">
                                                    <a href="single-product.html">
                                                        <h6>Finance and Consulting Business Theme</h6>
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a href="#" class="category">Wordpress</a>
                                        </td>
                                        <td>
                                            <div class="item_price">
                                                <span>$59</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="item_action">
                                                <a href="#" class="remove_from_cart">
                                                    <span class="icon-trash"></span>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="product__description">
                                                <div class="p_image"><img src="img/pur2.jpg" alt="Purchase image"></div>
                                                <div class="short_desc">
                                                    <a href="#">
                                                        <h6>Visibility Manager Subscriptions</h6>
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a href="#" class="category">Wordpress</a>
                                        </td>
                                        <td>
                                            <div class="item_price">
                                                <span>$59</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="item_action">
                                                <a href="#" class="remove_from_cart">
                                                    <span class="icon-trash"></span>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- ends: .single_product -->
                        <div class="row">
                            <div class="col-md-6 offset-md-6">
                                <div class="cart_calculation text-right">
                                    <div class="cart--subtotal">
                                        <p><span>Cart Subtotal</span>$120</p>
                                    </div>
                                    <div class="cart--total">
                                        <p><span>total</span>$120</p>
                                    </div>
                                    <a href="goCheckout" class="btn btn--md checkout_link btn-primary">결제하기</a>
                                </div>
                            </div><!-- end .col-md-12 -->
                        </div><!-- end .row -->
                    </div><!-- end .added_to__cart -->
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .cart_area -->




	<!-- 하단메뉴바 불러오기 -->
    <jsp:include page="footerBar.jsp" /> 
</body>
</html>