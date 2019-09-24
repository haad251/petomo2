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
                        <div class="dashboard_title_area">
                            <div class="dashboard__title">
                                <h3>Sales Statements</h3>
                                <div class="date_area">
                                    <form action="#">
                                        <div class="input_with_icon">
                                            <input type="text" class="dattaPikkara" placeholder="From">
                                            <span class="icon-calendar"></span>
                                        </div>
                                        <div class="input_with_icon">
                                            <input type="text" class="dattaPikkara" placeholder="To">
                                            <span class="icon-calendar"></span>
                                        </div>
                                        <div class="select-wrap">
                                            <select name="transaction_type" id="#">
                                                <option value="all">All Transaction</option>
                                                <option value="sale">Sale</option>
                                                <option value="sale">Purchase</option>
                                                <option value="credited">Withdraw</option>
                                            </select>
                                            <span class="icon-arrow-down"></span>
                                        </div>
                                        <button type="submit" class="btn btn--sm btn-primary">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="statement_info_card">
                            <div class="info_wrap">
                                <span>
                                    <span class="icon-handbag icon primarybg transparent-bg primary"></span>
                                </span>
                                <div class="info">
                                    <p class="primary">$4,563</p>
                                    <span>Total Sales</span>
                                </div>
                            </div><!-- end .info_wrap -->
                        </div><!-- end .statement_info_card -->
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="statement_info_card">
                            <div class="info_wrap">
                                <span>
                                    <span class="icon-basket-loaded icon secondarybg transparent-bg secondary"></span>
                                </span>
                                <div class="info">
                                    <p class="secondary">$340</p>
                                    <span>Total Purchases</span>
                                </div>
                            </div>
                            <!-- end .info_wrap -->
                        </div>
                        <!-- end .statement_info_card -->
                    </div>
                    <!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="statement_info_card">
                            <div class="info_wrap">
                                <span>
                                    <span class="icon-wallet icon mcolorbg3 transparent-bg info"></span>
                                </span>
                                <div class="info">
                                    <p class="info">$4,563</p>
                                    <span>Total Credited</span>
                                </div>
                            </div><!-- end .info_wrap -->
                        </div><!-- end .statement_info_card -->
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="statement_info_card">
                            <div class="info_wrap">
                                <span>
                                    <span class="icon-briefcase icon mcolorbg4 transparent-bg danger"></span>
                                </span>
                                <div class="info">
                                    <p class="danger">$3,690</p>
                                    <span>Total Withdraw</span>
                                </div>
                            </div><!-- end .info_wrap -->
                        </div><!-- end .statement_info_card -->
                    </div><!-- end .col-lg-3 -->
                </div><!-- end .row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="statement_table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Order ID</th>
                                        <th>Author</th>
                                        <th>Detail</th>
                                        <th>Type</th>
                                        <th>Price</th>
                                        <th>Earning</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>09 Jul 2017</td>
                                        <td>MP810094</td>
                                        <td class="author">AazzTech</td>
                                        <td class="detail">
                                            <a href="single-product.html">Visibility Manager Subscriptions</a>
                                        </td>
                                        <td class="type">
                                            <span class="sale">Sale</span>
                                        </td>
                                        <td class="price">$49</td>
                                        <td class="earning">$24.50</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>03 Jul 2017</td>
                                        <td>MP810094</td>
                                        <td class="author">Markober</td>
                                        <td class="detail">
                                            <a href="single-product.html">DigiPro Coffee Shop</a>
                                        </td>
                                        <td class="type">
                                            <span class="purchase">Purchase</span>
                                        </td>
                                        <td class="price">$30</td>
                                        <td class="earning subtract">-$30</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09 Jul 2017</td>
                                        <td>MP810094</td>
                                        <td class="author">Themexylum</td>
                                        <td class="detail">
                                            <a href="single-product.html">DigiPro Extension Bundle</a>
                                        </td>
                                        <td class="type">
                                            <span class="sale">Sale</span>
                                        </td>
                                        <td class="price">$49</td>
                                        <td class="earning">$24.50</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>05 Apr 2017</td>
                                        <td>MP810094</td>
                                        <td class="author">AazzTech</td>
                                        <td class="detail">
                                            <a href="single-product.html">Stack - Responsive Bootstrap 4 Admin Template</a>
                                        </td>
                                        <td class="type">
                                            <span class="sale">Sale</span>
                                        </td>
                                        <td class="price">$20</td>
                                        <td class="earning">$10</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>25 Dec 2016</td>
                                        <td>MP810394</td>
                                        <td class="author text-center" colspan="2">Via Payoneer</td>
                                        <td class="type">
                                            <span class="credited">Credited</span>
                                        </td>
                                        <td class="price">$49</td>
                                        <td class="earning">$24.50</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09 Jul 2017</td>
                                        <td>MP810094</td>
                                        <td class="author text-center" colspan="2">Via Paypal</td>
                                        <td class="type">
                                            <span class="withdrawal">Withdraw</span>
                                        </td>
                                        <td class="price">$350</td>
                                        <td class="earning subtract">-$350</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>0 Feb 2017</td>
                                        <td>MP810094</td>
                                        <td class="author">Artcorner</td>
                                        <td class="detail">
                                            <a href="single-product.html">Rida - Applanding Onepage </a>
                                        </td>
                                        <td class="type">
                                            <span class="purchase">Purchase</span>
                                        </td>
                                        <td class="price">$30</td>
                                        <td class="earning subtract">-$30</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>26 May 2016</td>
                                        <td>MP81024</td>
                                        <td class="author">Awesomaiya</td>
                                        <td class="detail">
                                            <a href="single-product.html">Table Generator extension bundle</a>
                                        </td>
                                        <td class="type">
                                            <span class="sale">Sale</span>
                                        </td>
                                        <td class="price">$49</td>
                                        <td class="earning">$24.50</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>26 Aug 2017</td>
                                        <td>MP810654</td>
                                        <td class="author">Codepoets</td>
                                        <td class="detail">
                                            <a href="single-product.html">Kamla One page portfolio</a>
                                        </td>
                                        <td class="type">
                                            <span class="sale">Sale</span>
                                        </td>
                                        <td class="price">$49</td>
                                        <td class="earning">$24.50</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09 Jul 2017</td>
                                        <td>MP810094</td>
                                        <td class="author">Designing</td>
                                        <td class="detail">
                                            <a href="single-product.html">Ajaxified karma loader</a>
                                        </td>
                                        <td class="type">
                                            <span class="purchase">Purchased</span>
                                        </td>
                                        <td class="price">$29</td>
                                        <td class="earning">-$29</td>
                                        <td class="action">
                                            <a href="invoice.html">view</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- Start Pagination -->
                            <!-- Start Pagination -->
                            <nav class="pagination-default">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav><!-- Ends: .pagination-default -->
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