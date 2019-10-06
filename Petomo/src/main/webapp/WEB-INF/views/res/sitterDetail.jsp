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
    <!-- 파랑이 시작 -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title"> ${sitter.st_id}번 님의 정보</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Single Product</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section>
	<section class="single-product-desc">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12">
					<div class="item-preview">
						<img src="img/single2.jpg" alt="" class="img-fluid">
						<div class="item-preview--excerpt">
							<div class="item-preview--action">
								<div class="action-btns">
									<a href="#" class="btn btn--lg btn-primary">Live Preview</a> <a
										href="goFavorite" class="btn btn--lg btn--icon btn-outline-primary">
										<span class="lnr icon-heart"></span>Add To Favorites
									</a>
								</div>
							</div>
							<!-- ends: .item-preview--action -->
							<div class="item-preview--activity">
								<div class="activity-single">
									<p>
										<span class="icon-cloud-download"></span> Total Downloads
									</p>
									<p>2451</p>
								</div>
								<div class="activity-single">
									<p>
										<span class="icon-heart"></span> Favorities
									</p>
									<p>452</p>
								</div>
								<div class="activity-single">
									<p>
										<span class="icon-eye"></span>Views
									</p>
									<p>3425</p>
								</div>
							</div>
							<!-- Ends: .item-activity -->
						</div>
					</div>
					<!-- ends: .item-preview-->
					<div class="item-info">
						<div class="item-navigation">
							<ul class="nav nav-tabs" role="tablist">
								<li><a href="#product-details" class="active" id="tab1"
									aria-controls="product-details" role="tab" data-toggle="tab"
									aria-selected="true"> <span class="icon icon-docs"></span>
										Item Details
								</a></li>
								<li><a href="#product-comment" id="tab2"
									aria-controls="product-comment" role="tab" data-toggle="tab">
										<span class="icon icon-bubbles"></span> Comments
								</a></li>
							</ul>
						</div>
						<!-- ends: .item-navigation -->
						<div class="tab-content">
							<div class="fade show tab-pane product-tab active"
								id="product-details" role="tabpanel" aria-labelledby="tab1">
								<div class="tab-content-wrapper">
									<h3>Landing Page Details</h3>
									<p class="p-bottom-30">
										Nunc placerat mi id nisi interdum mollis. Praesent pharetra,
										justo ut scelerisque the mattis, leo quam aliquet congue
										placerat mi id nisi interdum mollis. Praesent pharetra, justo
										ut scel erisque the mattis, leo quam aliquet congue justo ut
										scelerisque. Praesent pharetra, justo ut scelerisque the
										mattis, leo quam aliquet congue justo ut scelerisque. <br>
										<br>justo ut scel erisque the mattis, leo quam aliquet
										congue justo ut scelerisque. Praesent pharetra, justo ut
										scelerisque the mattis, leo quam aliquet congue justo ut
										scelerisque. leo quam aliquet congue placerat mi id nisi
										interdum mollis. Praesent pharetra.
									</p>
								</div>
							</div>
							<!-- ends: .tab-content -->
							<div class="fade tab-pane product-tab" id="product-comment"
								role="tabpanel" aria-labelledby="tab2">
								<div class="thread">
									<ul class="media-list thread-list">
										<li class="single-thread">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m1.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<div>
														<div class="media-heading">
															<a href="author.html">
																<h4>Themexylum</h4>
															</a> <span>9 Hours Ago</span>
														</div>
														<a href="#" class="reply-link">Reply</a>
													</div>
													<p>Nunc placerat mi id nisi interdum mollis. Praesent
														pharetra, justo ut sceleris que the mattis, leo quam
														aliquet congue placerat mi id nisi interdum mollis.</p>
												</div>
											</div>
											<!-- ends: .media --> <!-- nested comment markup / replies -->
											<ul class="children">
												<li class="single-thread depth-2">
													<div class="media">
														<div class="media-left">
															<a href="#"> <img class="media-object"
																src="img/m2.png" alt="Commentator Avatar">
															</a>
														</div>
														<div class="media-body">
															<div class="media-heading">
																<h4>AazzTech</h4>
																<span>6 Hours Ago</span>
															</div>
															<span class="comment-tag author">Author</span>
															<p>Nunc placerat mi id nisi interdum mollis. Praesent
																pharetra, justo ut sceleris que the mattis, leo quam
																aliquet congue placerat mi id nisi interdum mollis.</p>
														</div>
													</div>
												</li>
												<li class="single-thread depth-2">
													<div class="media">
														<div class="media-left">
															<a href="#"> <img class="media-object"
																src="img/m1.png" alt="Commentator Avatar">
															</a>
														</div>
														<div class="media-body">
															<div class="media-heading">
																<h4>Themexylum</h4>
																<span>9 Hours Ago</span>
															</div>
															<p>Nunc placerat mi id nisi interdum mollis. Praesent
																pharetra, justo ut sceleris que the mattis, leo quam
																aliquet congue placerat mi id nisi interdum mollis.</p>
														</div>
													</div>
												</li>
											</ul>
											<!-- ends: .children --> <!-- comment reply -->
											<div class="media depth-2 reply-comment">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m2.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<form action="#" class="comment-reply-form">
														<textarea class="bla" name="reply-comment"
															placeholder="Write your comment..."></textarea>
														<button class="btn btn--md btn-primary">Post
															Comment</button>
													</form>
												</div>
											</div>
											<!-- comment reply -->
										</li>
										<!-- ends: .single-thread-->
										<li class="single-thread">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m2.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<div>
														<div class="media-heading">
															<a href="author.html">
																<h4>EchoTheme</h4>
															</a> <span>9 Hours Ago</span>
														</div>
														<a href="#" class="reply-link">Reply</a>
													</div>
													<p>Nunc placerat mi id nisi interdum mollis. Praesent
														pharetra, justo ut sceleris que the mattis, leo quam
														aliquet congue placerat mi id nisi interdum mollis.</p>
												</div>
											</div>
											<!-- ends: .media --> <!-- nested comment markup / replies -->
											<!-- comment reply -->
											<div class="media depth-2 reply-comment">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m2.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<form action="#" class="comment-reply-form">
														<textarea class="bla" name="reply-comment"
															placeholder="Write your comment..."></textarea>
														<button class="btn btn--md btn-primary">Post
															Comment</button>
													</form>
												</div>
											</div>
											<!-- comment reply -->
										</li>
										<!-- ends: .single-thread-->
										<li class="single-thread">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m3.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<div>
														<div class="media-heading">
															<a href="author.html">
																<h4>SnazzyTheme</h4>
															</a> <span>9 Hours Ago</span>
														</div>
														<a href="#" class="reply-link">Reply</a>
													</div>
													<p>Nunc placerat mi id nisi interdum mollis. Praesent
														pharetra, justo ut sceleris que the mattis, leo quam
														aliquet congue placerat mi id nisi interdum mollis.</p>
												</div>
											</div>
											<!-- ends: .media --> <!-- nested comment markup / replies -->
											<!-- comment reply -->
											<div class="media depth-2 reply-comment">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m2.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<form action="#" class="comment-reply-form">
														<textarea class="bla" name="reply-comment"
															placeholder="Write your comment..."></textarea>
														<button class="btn btn--md btn-primary">Post
															Comment</button>
													</form>
												</div>
											</div>
											<!-- comment reply -->
										</li>
										<!-- ends: .single-thread-->
										<li class="single-thread">
											<div class="media">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m4.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<div>
														<div class="media-heading">
															<a href="author.html">
																<h4>ThemeValley</h4>
															</a> <span>9 Hours Ago</span>
														</div>
														<a href="#" class="reply-link">Reply</a>
													</div>
													<p>Nunc placerat mi id nisi interdum mollis. Praesent
														pharetra, justo ut sceleris que the mattis, leo quam
														aliquet congue placerat mi id nisi interdum mollis.</p>
												</div>
											</div>
											<!-- ends: .media --> <!-- nested comment markup / replies -->
											<!-- comment reply -->
											<div class="media depth-2 reply-comment">
												<div class="media-left">
													<a href="#"> <img class="media-object" src="img/m2.png"
														alt="Commentator Avatar">
													</a>
												</div>
												<div class="media-body">
													<form action="#" class="comment-reply-form">
														<textarea class="bla" name="reply-comment"
															placeholder="Write your comment..."></textarea>
														<button class="btn btn--md btn-primary">Post
															Comment</button>
													</form>
												</div>
											</div>
											<!-- comment reply -->
										</li>
										<!-- ends: .single-thread-->
									</ul>
									<!-- ends: .media-list -->
									<!-- Start Pagination -->
									<nav class="pagination-default">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Previous"> <span aria-hidden="true"><i
														class="fa fa-long-arrow-left"></i></span> <span class="sr-only">Previous</span>
											</a></li>
											<li class="page-item active"><a class="page-link"
												href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item disabled"><a class="page-link"
												href="#">...</a></li>
											<li class="page-item"><a class="page-link" href="#">10</a></li>
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next"> <span aria-hidden="true"><i
														class="fa fa-long-arrow-right"></i></span> <span class="sr-only">Next</span>
											</a></li>
										</ul>
									</nav>
									<!-- Ends: .pagination-default -->
									<div class="comment-form-area">
										<h4>Leave a comment</h4>
										<div class="media comment-form">
											<div class="media-left">
												<a href="#"> <img class="media-object" src="img/m7.png"
													alt="Commentator Avatar">
												</a>
											</div>
											<div class="media-body">
												<form action="#" class="comment-reply-form">
													<textarea name="reply-comment"
														placeholder="Write your comment..."></textarea>
													<button class="btn btn--sm btn-primary">Post
														Comment</button>
												</form>
											</div>
										</div>
										<!-- ends: .comment-form -->
									</div>
									<!-- ends: .comment-form-area -->
								</div>
								<!-- ends: .comments -->
							</div>
							<!-- ends: .product-comment -->
						</div>
						<!-- ends: .tab-content -->
					</div>
					<!-- ends: .item-info -->
				</div>
				<!-- ends: .col-md-8 -->
				<div class="col-lg-4 col-md-12">
					<aside class="sidebar sidebar--single-product">
						<div class="sidebar-card card-pricing">
							<div class="price border-none">
								<h1>
									<sup>$</sup> <span>00.00</span>
								</h1>
							</div>
							<div class="purchase-button">
								<a href="goReservation" class="btn btn--lg btn-primary">예약하기</a>
							</div>
						</div>
						<!-- ends: .sidebar--card -->
						<div class="sidebar-card card--product-infos">
							<div class="card-title">
								<h4>Product Information</h4>
							</div>
							<ul class="infos">
								<li>
									<p class="data-label">Released</p>
									<p class="info">16 June 2015</p>
								</li>
								<li>
									<p class="data-label">Updated</p>
									<p class="info">28 July 2016</p>
								</li>
								<li>
									<p class="data-label">Version</p>
									<p class="info">1.2</p>
								</li>
								<li>
									<p class="data-label">Category</p>
									<p class="info">Corporate & Business</p>
								</li>
								<li>
									<p class="data-label">Layout</p>
									<p class="info">Responsive</p>
								</li>
								<li>
									<p class="data-label">Retina Ready</p>
									<p class="info">No</p>
								</li>
								<li>
									<p class="data-label">Files Included</p>
									<p class="info">Html, CSS, JavaScript</p>
								</li>
								<li>
									<p class="data-label">Browser</p>
									<p class="info">IE10, IE11, Firefox, Safari, Opera, Chrome5</p>
								</li>
								<li>
									<p class="data-label">Bootstrap</p>
									<p class="info">Bootstrap 4</p>
								</li>
								<li>
									<p class="data-label">Tags</p>
									<p class="info">
										<a href="#">business</a>, <a href="#">template</a>, <a
											href="#">onepage</a>, <a href="#">creative</a>, <a href="#">responsive</a>,
										<a href="#">corporate</a>, <a href="#">Bootstrap3</a>, <a
											href="#">html5</a>
									</p>
								</li>
							</ul>
							<!-- ends: .infos -->
						</div>
						<!-- ends: .card--product-infos -->
						<div class="sidebar-card social-share-card">
							<p>Social Share:</p>
							<ul class="list-unstyled">
								<li><a href=""> <i class="fa fa-facebook"></i>
								</a></li>
								<li><a href=""> <i class="fa fa-twitter"></i>
								</a></li>
								<li><a href=""> <i class="fa fa-google-plus"></i>
								</a></li>
								<li><a href=""> <i class="fa fa-pinterest"></i>
								</a></li>
							</ul>
						</div>
						<!-- Ends: .social-share-card -->
					</aside>
					<!-- ends: .sidebar -->
				</div>
				<!-- ends: .col-md-4 -->
			</div>
			<!-- ends: .row -->
		</div>
		<!-- ends: .container -->
	</section>
	<!-- ends: .single-product-desc -->
</body>
</html>