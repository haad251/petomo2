<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
</head>

<body class="preload">
<<<<<<< HEAD
	<jsp:include page="../menuBar.jsp" />
=======
	<jsp:include page="../menuBar.jsp" /> 

>>>>>>> refs/remotes/origin/master
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">Sales Statement</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Sales Statement</a>
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
                            <li>
                                <a href="dashboard-setting.html"><span class="lnr icon-settings"></span>Setting</a>
                            </li>
                            <li>
                                <a href="dashboard-purchase.html"><span class="lnr icon-basket"></span>Purchase</a>
                            </li>
                            <li>
                                <a href="dashboard-add-credit.html"><span class="lnr icon-credit-card"></span>Add Credits</a>
                            </li>
                            <li class="active">
                                <a href="dashboard-statement.html"><span class="lnr icon-chart"></span>Statements</a>
                            </li>
                            <li>
                                <a href="dashboard-upload.html"><span class="lnr icon-cloud-upload"></span>Upload Items</a>
                            </li>
                            <li>
                                <a href="dashboard-manage-item.html"><span class="lnr icon-note"></span>Manage Items</a>
                            </li>
                            <li>
                                <a href="dashboard-withdrawal.html"><span class="lnr icon-briefcase"></span>Withdrawals</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
        <div class="dashboard_contents dashboard_statement_area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="statement_table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>日付</th>
                                        <th>時間</th>
                                        <th>ユーザー名</th>　
<!--                                         멤버가 볼때는 シッター아이디넣기 -->
                                        <th>サービス名</th>
                                        <th>値段</th>
                                        <th>メモ</th>
                                        <th>予約状況</th>
                                        <th>詳細</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${rList}" var="res" >
	                                    <tr>
	                                        <td>${res.date}</td>
	                                        <th>${res.res_start}~${res.res_end}</th>
	                                        <th>${res.mb_id}</th>　
	                                        <th>${res.service_name}</th>
    	                                    <th>${res.res_amount}</th>
            	                            <th>${res.res_memo}</th>
            	                           	<th>${res.res_status}</th>
	                                        <td class="action">
	                                            <a href="streamingService?res_id=${res.res_id}">go</a>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                
                                </tbody>
                            </table>
                            <!-- Start Pagination -->
<!--                             <nav class="pagination-default"> -->
<!--                                 <ul class="pagination"> -->
<!--                                     <li class="page-item"> -->
<!--                                         <a class="page-link" href="#" aria-label="Previous"> -->
<!--                                             <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span> -->
<!--                                             <span class="sr-only">Previous</span> -->
<!--                                         </a> -->
<!--                                     </li> -->
<!--                                     <li class="page-item active"><a class="page-link" href="#">1</a></li> -->
<!--                                     <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--                                     <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                                     <li class="page-item disabled"><a class="page-link" href="#">...</a></li> -->
<!--                                     <li class="page-item"><a class="page-link" href="#">10</a></li> -->
<!--                                     <li class="page-item"> -->
<!--                                         <a class="page-link" href="#" aria-label="Next"> -->
<!--                                             <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span> -->
<!--                                             <span class="sr-only">Next</span> -->
<!--                                         </a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </nav>Ends: .pagination-default -->
                        </div><!-- ends: .statement_table -->
                    </div>
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