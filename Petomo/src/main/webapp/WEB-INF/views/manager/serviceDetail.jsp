<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
        <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
</head>
<body>

    <jsp:include page="../menuBar.jsp" /> 
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">Register Service</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Register Service</a>
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
 <section class="dashboard-area">
        <div class="dashboard_contents section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="">
                                <div class="dashboard__title">
                                    <h3>Service Detail</h3>
                                </div>
                            </div>
                            <div class="ml-auto">
                            	<form action="modifyService" method="get">
                            		<input type="hidden" name="service_id" value="${service.service_id}">
                                	<button class="btn btn-sm btn-primary">Modification</button>
                                </form>
                            </div>
                        </div>
                    </div><!-- ends: .col-md-12 -->
                    <div class="col-md-12">
                        <div class="invoice">
                            <div class="invoice__head">
                                <!-- <div class="invoice_logo">
                                    <img src="img/logo.png" alt="">
                                </div> -->
                                <div class="info">
                                    <h4>Service Info</h4>
                                    <p>service id : ${service.service_id}</p>
                                </div>
                            </div><!-- ends: .invoice__head -->
                            <div class="invoice__meta">
                                <div class="address">
                                    <h5 class="bold">${service.service_name}</h5>
                                    <p>type : ${service.service_type}</p>
                                    <p>price : ${service.service_price}</p>
                                    <p>runtime : ${service.service_time}</p>
                                </div>
                                <div class="date_info">
                                    <p>${service.service_info}</p>
                                </div>
                            </div><!-- ends: .invoice__meta -->
                            <!-- 각 서비스의 매출 볼 수 있는 영역 만들 거임 -->
                            <div class="table-responsive invoice__detail">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Reservation Number</th>
                                            <th>The sitter in charge</th>
                                            <th>Member</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Rate</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>03 Jul 2017</td>
                                            <td class="author">AazzTech</td>
                                            <td class="detail">
                                                <a href="#">Multipurpose Blog Template</a>
                                            </td>
                                            <td>Regular</td>
                                            <td>$30</td>
                                            <td>$30</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="pricing_info">
                                    <p>Sub - Total amount: $30</p>
                                    <p class="bold">Total : $30</p>
                                </div>
                            </div><!-- ends: .invoice_detail -->
                        </div><!-- ends: .invoice -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    </section><!-- ends: .dashboard-area -->
</body>
</html>