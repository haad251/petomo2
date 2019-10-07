<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- viewport meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="DigiPro - Digital Products Marketplace ">
    <meta name="keywords" content="marketplace, easy digital download, digital product, digital, html5">
    <title>Petomo</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">
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

</head>
	<body class="preload">
    <jsp:include page="../menuBar.jsp" />
    
    <!-- 파란화면 시작 -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">Invoice</h2>
                       <!--  <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Invoice</a>
                                </li>
                            </ul>
                        </div> -->
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <!-- 파란화면 끝 -->
    
     <section class="dashboard-area">
        <div class="dashboard_contents section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="">
                                <div class="dashboard__title">
                                    <h3>Invoice</h3>
                                </div>
                            </div>
                        </div>
                    </div><!-- ends: .col-md-12 -->
                    <div class="col-md-12">
                        <div class="invoice">
                            <div class="table-responsive invoice__detail">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Sitter</th>
                                            <th>Service</th>
                                            <th>Member</th>
                                            <th>StartTime</th>
                                            <th>EndTime</th>
                                            <th>Memo</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                  <c:forEach items="${rList}" var="res" >
	                                    <tr>
	                                        <td>${res.st_id}</td>
	                                        <td>${res.service_id}</td>
	                                        <td>${sessionScope.sessionId}</td>　
	                                        <td>${res.res_start}</td>
    	                                    <td>${res.res_end}</td>
            	                            <td>${res.res_memo}</td>
            	                            <th>${res.res_amount}</th>
	                                    </tr>
                                    	<c:set var="total" value="${total + res.res_amount}"/>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="pricing_info">
                                    <p class="bold">Total Price = <c:out value="${total}"/></p>
                                </div>
                            </div><!-- ends: .invoice_detail -->
                            <a href="/" class="btn btn-sm btn-primary">홈으로</a>
                        </div><!-- ends: .invoice -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    </section><!-- ends: .dashboard-area -->
    
    
</body>
</html>