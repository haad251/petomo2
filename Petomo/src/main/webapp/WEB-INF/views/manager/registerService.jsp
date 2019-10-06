<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Petomo</title>
</head>

<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                    	<c:if test="${service.service_id == null}">
                        <h2 class="page-title">Register Service</h2>
                        </c:if>
                        <c:if test="${service.service_id != null}">
                        <h2 class="page-title">Modify Service</h2>
                       	</c:if>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                	<c:if test="${service.service_id == null}">
                                    <a href="#">Register Service</a>
                                    </c:if>
                                    <c:if test="${service.service_id != null}">
                                    <a href="#">Modify Service</a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="dashboard-area">
        <div class="dashboard_menu_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button class="menu-toggler d-md-none">
                            <span class="icon-menu"></span> Dashboard Menu
                        </button>
                        <ul class="dashboard_menu">
                            <li>
                                <a href="dashboard.html"><span class="lnr icon-home"></span>Dashboard</a>
                            </li>
                            <li class="active">
                                <a href="/manageService"><span class="lnr icon-note"></span>Manage Service</a>
                            </li>
                            <li>
                                <a href="dashboard-withdrawal.html"><span class="lnr icon-briefcase"></span>Manage Pet Sitter</a>
                            </li>
                            <li>
                                <a href="dashboard-setting.html"><span class="lnr icon-settings"></span>Setting</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
        <div class="dashboard_contents section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="pull-left">
                                <div class="dashboard__title">
                                 <c:if test="${service.service_id == null}">
                                    <h3>サービス登録</h3>
                                  </c:if>
                                   <c:if test="${service.service_id != null}">
                                    <h3>サービス修正</h3>
                                  </c:if>
                                </div>
                            </div>
                        </div>
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
                <div class="row">
                    <div class="col-lg-8 col-sm-12" style="webkit-flex: 0 0 100% ; -ms-flex: 0 0 100%; flex: 0 0 100%; max-width: 100%;">
                    <c:if test="${service.service_id != null}">
                        <form action="updateService" method="post">
                        <input type="hidden" id="service_id" name="service_id" value="${service.service_id}">
					</c:if>
					<c:if test="${service.service_id == null}">
                        <form action="insertNewService" method="post">
					</c:if>
                            <div class="upload_modules">
                                <div class="modules__title">
                                    <h3>サービスの説明</h3>
                                </div><!-- ends: .module_title -->
                                <div class="modules__content">
                                    <div class="form-group">
                                        <label for="category">サービス カテゴリ</label>
                                        <div class="select-wrap select-wrap2">
                                            <select name="service_type" id="service_type" class="text_field" >
                                            	<option value="">サービスタイプを選んでください。</option>
                                                <option value="ケア">ケア</option>
                                                <option value="散歩">散歩</option>
                                            </select>
                                            <span class="lnr icon-arrow-down"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="product_name">サービスの名
                                        </label>
                                        <input type="text" id="service_name" name="service_name" class="text_field" placeholder="ここにサービスの名を入力してください。" value="${service.service_name}">
                                    </div>
                                    <div class="form-group no-margin">
                                        <p class="label">サービスの説明</p>
                                        <textarea id="trumbowyg-demo" id="service_info" name="service_info" >${service.service_info}</textarea>
                                    </div>
                                </div><!-- ends: .modules__content -->
                            </div><!-- ends: .upload_modules -->
                            <div class="upload_modules">
                                <div class="modules__title">
                                    <h4>その他の情報</h4>
                                </div><!-- ends: .module_title -->
                                <div class="modules__content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="dimension">サービスの価格</label>
                                                <input type="text" id="service_price" name="service_price" class="text_field" placeholder="2600￥" value="${service.service_price}">
                                            </div>
                                             <div class="form-group">
                                                <label for="dimension">サービスのランタイム</label>
                                                <input type="text" id="service_time" name="service_time" class="text_field" placeholder="60分" value="${service.service_time}">
                                            </div>
                                        </div><!-- ends: .col-md-6 -->
                                    </div><!-- ends: .row -->
                                </div><!-- ends: .modules__content -->
                            </div><!-- ends: .upload_modules -->
                            <div class="btns m-top-40">
                            <c:if test="${service.service_id != null}">
                            	 <button type="submit" class="btn btn-lg btn-primary m-right-15">修整</button>
                            </c:if> 
                            <c:if test="${service.service_id == null}">
                            	 <button type="submit" class="btn btn-lg btn-primary m-right-15">登録</button>
                            </c:if> 
                                <button type="reset" class="btn btn-lg btn-danger">キャンセル</button>
                            </div>
                        </form>
                    </div><!-- ends: .col-md-8 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    </section><!-- ends: .dashboard-area -->
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