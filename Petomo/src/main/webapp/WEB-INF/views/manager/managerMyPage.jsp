<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Manger Page</title>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script>
    $(function(){
    	selectNewSitterList();
    	
    	//최근 시터 목록 새로고침 버튼을 누르면 최근 5개의 목록만 가져옴 
    	$(document).on("click","#sitterListRefresh",function(){
    		alert("동작중");
    		selectNewSitterList();
    	});
    	
    });
   
    function selectNewResList(){
    	
    }
    
    function selectNewSitterList(){
    	$.ajax({
    		url:"selectNewSitterList"
    		,type:"post"
    		,success:function(serverData){
    			for(var i = 0 ; i < serverData.length ; i++){
    				var str = "";
    				str += '<li>';
                    str += '<div class="single_buyer">';
                    str += '<div class="buyer__thumb_title">';
                    str += '<div class="thumb">';
                    str += '<img src="img/buyr1.png" alt="Sitter Images">';
                    str += '</div>';
                    str += '<div class="title">';
                    str += '<h6>'+serverData[i].st_name+'</h6>';
                    str += '<p>'+serverData[i].st_loc1+'</p>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="price">';
                    str += '<p>'+serverData[i].st_license+'</p>';
                    str += '</div>';
                    str += '</div>';
                    str += '</li>';
    				$("#mj_newRegisterSitter").append(str);
    			}
    		}
    	});
    }
    </script>
    
</head>

<body class="dashboard-page preload">
    <jsp:include page="../menuBar.jsp" /> 
    <jsp:include page="../managerMenuBar.jsp" />
    
   <section class="dashboard-area">
        <div class="dashboard_contents p-top-100 p-bottom-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="primary">$369</h1>
                            <p>Available Balance</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="secondary">$273</h1>
                            <p>Weekly Earnings</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="info">$2,249</h1>
                            <p>Yearly Earnings</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="danger">$5,583</h1>
                            <p>Lifetime Earnings</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                </div>
                <div class="row">
                    <div class="col-lg-8 col-md-12" 
                   	style="flex: 0 0 50%;max-width: 50%;">
                        <div class="dashboard_module recent_sells">
                            <div class="dashboard__title">
                                <h4>Recent Reservation</h4>
                                <div class="loading">
                                    <a href="#">Refresh <span class="lnr icon-refresh"></span></a>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <ul>
                                    <li>
                                        <div class="single_sell">
                                            <div class="single_sell__thumb-title">
                                                <div class="prod_title">
                                                    <h6>Finance and Consulting Business Theme</h6>
                                                    <div class="category">
                                                        <span>Wordpress</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ammount">
                                                <p>$34.25</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div><!-- ends: .dashboard__content -->
                        </div><!-- ends: .dashboard_module -->
                    </div><!-- ends: .col-md-8 -->
                    <div class="col-lg-4 col-md-12" 
                    	style="flex: 0 0 50%;max-width: 50%;">
                        <div class="dashboard_module recent_buyers">
                            <div class="dashboard__title">
                                <h4>Recent Register Sitter</h4>
                                <div class="loading">
                                    <a href="#sitterListRefresh">
                                        Refresh <span class="lnr icon-refresh"></span>
                                    </a>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <ul id="mj_newRegisterSitter">
                                   <!--  <li>
                                        <div class="single_buyer">
                                            <div class="buyer__thumb_title">
                                                <div class="thumb">
                                                    <img src="img/buyr1.png" alt="Buyer Images">
                                                </div>
                                                <div class="title">
                                                    <h6>James Anderson</h6>
                                                    <p>United States</p>
                                                </div>
                                            </div>
                                            <div class="price">
                                                <p>$29</p>
                                            </div>
                                        </div>
                                    </li> -->
                                </ul>
                            </div><!-- ends: .dashboard__content -->
                        </div><!-- ends: .dashboard_module -->
                    </div><!-- ends: .col-md-4 -->
                    <div class="col-lg-12">
                        <div class="dashboard_module statistics_module">
                            <div class="dashboard__title">
                                <h4>Sales and Views Statistics</h4>
                                <div id="stat_legend" class="legend"></div>
                                <div class="select-wrap">
                                    <select name="mon" class="period_selector">
                                        <option value="jan">Sep 2019</option>
                                        <option value="feb">Aug 2019</option>
                                        <option value="mar">Jul 2019</option>
                                    </select>
                                    <span class="lnr icon-arrow-down"></span>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <canvas id="myChart"></canvas>
                                <div class="statistics_data">
                                    <div class="single_stat_data">
                                        <h4 class="single_stat__title">478</h4>
                                        <p>Total <span>Sales</span> This Month</p>
                                    </div>
                                    <div class="single_stat_data">
                                        <h4 class="single_stat__title color-primary">$2,478</h4>
                                        <p>Total <span>Earnings</span> This Month</p>
                                    </div>
                                    <div class="single_stat_data align-right">
                                        <h4 class="single_stat__title color-secondary">478</h4>
                                        <p>Total <span>Sales</span> This Month</p>
                                    </div>
                                </div>
                            </div><!-- ends: .dashboard__content -->
                        </div><!-- ends: .statistics_module -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
         </div>
    </section><!-- ends: .dashboard-area -->
    
    <!-- modal -->
    <div class="modal fade item_removal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <h4>Please confirm the removal of the item.</h4>
                    <div class="btns">
                        <a href="#" class="btn btn--md btn-danger">Confirm</a>
                        <a href="#" class="btn btn--md btn-primary" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">Cancel</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
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