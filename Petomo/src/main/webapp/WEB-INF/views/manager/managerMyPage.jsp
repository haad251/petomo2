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
    	
    	var date = new Date(); //오늘의 날짜
    	var todayDate = getFormatDate(date); //2019-10-02 형식
    	var thisMonth = getFormatMonth(date); //2019-10 형식
    	var thisYear = getFormatYear(date); //2019 형식
    	
    	//최근에 등록한 Sitter 목록을 가져온다.
    	selectNewSitterList();
    	
    	//최근에 예약된 목록을 가져온다.
    	selectNewResList();
    	
    	//서비스 이용 완료된(利用済み) 모든 매출을 가져온다.
    	selectAllResByComStatus();
    	
    	// 오늘 날짜(today) 서비스 이용 완료된(利用済み) 예약의 매출을 가져온다.
        selectResByDate();
    	function selectResByDate(){
        	$.ajax({
        		url:"selectResByDate"
        		,type:"post"
        		,data:{
        			res_start:todayDate
        		}
        		,success:function(serverData){
        			$(".primary").append(serverData+"￥");
        		}
        	});
        }
    	
    	//이번 달(Month) 서비스 이용 완료된(利用済み) 예약의 매출을 가져온다.
    	selectResByMonth();
     	function selectResByMonth(){
        	$.ajax({
        		url:"selectResByMonth"
        		,type:"post"
        		,data:{
        			res_start:thisMonth
        		}
        		,success:function(serverData){
        			$(".secondary").append(serverData+"￥");
        		}
        	});
        }
     	
     	//올해 서비스 이용 완료된(利用済み)  예약의 매출을 가져온다.
     	selectResByYear();
     	function selectResByYear(){
        	$.ajax({
        		url:"selectResByYear"
        		,type:"post"
        		,data:{
        			res_start:thisYear
        		}
        		,success:function(serverData){
        			$(".info").append(serverData+"￥");
        		}
        	});
        }
    	
    	//최근 시터 목록 새로고침 버튼을 누르면 최근 5개의 목록만 가져옴 
    	$(document).on("click","#sitterListRefresh",function(){
    		alert("동작중");
    		$('#mj_newRegisterSitter').html("");
    		selectNewSitterList();
    	});
    	
    	$(document).on("click","#resListRefresh",function(){
    		alert("동작중");
    		$('#mj_newReservation').html("");
    		selectNewResList();
    	});
    	
    	//일본지도 클릭 이벤트
        $("#map-container").japanMap({
            onSelect : function(data){
            alert(data.name);
            }
        });
    	
    	/* //차트에서 월 바꿀 때 마다 새로운 데이터 출력
        $(document).on("change",".period_selector",function(){
        	console.log(todayDate);
        }); */
    	
    	
    });
   
    //최근 리뷰 5개만 가져오는 함수
    function selectNewResList(){
    	$.ajax({
    		url:"selectNewResList"
    		,type:"post"
    		,success:function(serverData){
    			for(var i = 0 ; i < serverData.length ; i++){
    				var str = "";
    				str += '<li>';
                    str += '<div class="single_sell">';
                    str += '<div class="single_sell__thumb-title">';
                    str += '<div class="prod_title">';
                    str += '<h6>'+serverData[i].res_id+'</h6>';
                    str += '<div class="category">';
                    str += '<span>顧客:'+serverData[i].mb_id+'</span>';
                    str += '</div>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="ammount">';
                    str += '<p>'+serverData[i].res_amount+'</p>';
                    str += '</div>';
                    str += '</div>';
                 	str += '</li>';
                 $("#mj_newReservation").append(str);
    			}
    		}
    	});
    }
    
    //최근 등록한 시터 5개만 가져오는 함수
    function selectNewSitterList(){
    	$.ajax({
    		url:"selectNewSitterList"
    		,type:"post"
    		,success:function(serverData){
    			for(var i = 0 ; i < serverData.length ; i++){
    				var str = "";
    				str += '<li>';
                    str += '<div class="single_buyer single_sitter">';
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
    
    //서비스 이용 완료된(利用済み) 모든 매출을 가져오는 메소드
    function selectAllResByComStatus(){
    	$.ajax({
    		url:"selectAllResByComStatus"
    		,type:"post"
    		,success:function(serverData){
    			$(".danger").append(serverData+"￥");
    		}
    	});
    }
    
    //서비스 이용 완료된(利用済み) 오늘의 매출을 가져오는 메소드
    function selectResByComStatusAndDate(){
    	$.ajax({
    		url:"selectResByComStatusAndDate"
    		,type:"post"
    		,data:{
    			res_start:todayDate
    		}
    		,success:function(serverData){
    			$(".primary").append(serverData+"￥");
    		}
    	});
    }
    
    //오늘의 날짜를 원하는 format으로 뽑아내는 함수
    function getFormatDate(date){ 
    	var year = date.getFullYear(); //yyyy 
    	var month = (1 + date.getMonth()); //M 
    	month = month >= 10 ? month : '0' + month; //month 두자리로 저장 
    	var day = date.getDate(); //d 
    	day = day >= 10 ? day : '0' + day; //day 두자리로 저장 
    	return year + '-' + month + '-' + day; 
    }
    
    //이번 달을 원하는 format으로 뽑아내는 함수
    function getFormatMonth(date){ 
    	var year = date.getFullYear(); //yyyy 
    	var month = (1 + date.getMonth()); //M 
    	month = month >= 10 ? month : '0' + month; //month 두자리로 저장 
    	return year + '-' + month; 
    }
    
    //올해를 원하는 format으로 뽑아내는 함수
    function getFormatYear(date){
    	var year = date.getFullYear(); //yyyy 
    	return year;
    }
    
    
    </script>
    
</head>

<body class="dashboard-page preload">
    <jsp:include page="../menuBar.jsp" /> 
    <jsp:include page="../managerMenuBar.jsp" />
    
    
   <section class="dashboard-area">
        <div class="dashboard_contents p-top-100 p-bottom-70">
            <div class="container">
            <div id="map-container" style="text-align: center"></div>
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="primary"></h1>
                            <p>Today Earnings</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="secondary"></h1>
                            <p>Month Earnings</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="info"></h1>
                            <p>Yearly Earnings</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="danger"></h1>
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
                                    <a id="resListRefresh" href="#">Refresh <span class="lnr icon-refresh"></span></a>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <ul id="mj_newReservation">
                                    <!-- <li>
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
                                    </li> -->
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
                                    <a id="sitterListRefresh" href="#">
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
                                      	<option value="jan">Jan 2018</option>
                                        <option value="feb">Feb 2018</option>
                                        <option value="mar">Mar 2018</option>
                                    </select>
                                    <span class="lnr icon-arrow-down"></span>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <canvas id="mySitterChart"></canvas>
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
    
    <!-- 일본지도 관련  js-->
    <script src="theme_assets/js/jquery.japan-map.js"></script>
    <script src="theme_assets/js/jquery.japan-map.min.js"></script>
    
</body>

</html>