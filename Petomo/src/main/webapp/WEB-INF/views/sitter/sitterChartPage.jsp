<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script>
$(function(){
    	
    	var date = new Date(); //오늘의 날짜 추출하기 위한 변수
    	var todayDate = getFormatDate(date); //오늘의 날짜를 2019-10-02 형식으로 추출
    	var thisMonth = getFormatMonth(date); //오늘의 날짜를 2019-10 형식으로 추출
    	var thisYear = getFormatYear(date); //오늘의 날짜를 2019 형식으로 추출
    	var selectedYear = document.getElementById("period_selector").value; // chart에서 선택한 연도를 담을 변수
    	var yearData = []; // chart.js에 넣을 데이터(연도별 매출)를 담을 배열

    	//[완료] 최근에 예약된 목록을 가져온다.
    	selectResBySitterId();
    	
    	//[완료] 최근에 등록된 리뷰 목록을 가져온다.
    	selectNewReviewList();
    	
    	
    	//[완료] Sitter아이디로 서비스 이용 완료된(利用済み) 모든 매출을 가져온다.
    	selectAllResComStatusBySitterId();
    	
    	//[완료] 오늘 날짜(today) 서비스 이용 완료된(利用済み) 예약의 매출을 가져온다.
        selectResByDateAndSitterId();
    	function selectResByDateAndSitterId(){
        	$.ajax({
        		url:"selectResByDateAndSitterId"
        		,type:"post"
        		,data:{
        			"res_start":todayDate,
        			"st_id":"${sessionScope.sessionId}"
        		}
        		,success:function(serverData){
        			$(".primary").append(serverData+"￥");
        		}
        	});
        }
    	
    	//[완료] 이번 달(Month) 서비스 이용 완료된(利用済み) 예약의 매출을 가져온다.
    	selectResByMonthAndSitterId();
     	function selectResByMonthAndSitterId(){
        	$.ajax({
        		url:"selectResByMonthAndSitterId"
        		,type:"post"
        		,data:{
        			"res_start":thisMonth,
        			"st_id":"${sessionScope.sessionId}"
        		}
        		,success:function(serverData){
        			$(".secondary").append(serverData+"￥");
        		}
        	});
        }
     	
     	//[완료] 올해 서비스 이용 완료된(利用済み)  예약의 매출을 가져온다.
     	selectResByYearAndSitterId();
     	function selectResByYearAndSitterId(){
        	$.ajax({
        		url:"selectResByYearAndSitterId"
        		,type:"post"
        		,data:{
        			"res_start":thisYear,
        			"st_id":"${sessionScope.sessionId}"
        		}
        		,success:function(serverData){
        			$(".info").append(serverData+"￥");
        		}
        	});
        }
    	
    	//[완료] 최근 리뷰 목록의 새로고침 버튼을 누르면 최근 5개의 목록만 가져옴 
    	$(document).on("click","#rivewListRefresh",function(){
    		$('#mj_newRegisterReview').html("");
    		selectNewReviewList();
    	});
    	
    	//[완료] 최근 예약 목록의 새로고침 버튼을 누르면 최근 5개의 목록만 가져옴
    	$(document).on("click","#resListRefresh",function(){
    		$('#mj_newReservation').html("");
    		selectResBySitterId();
    	});
    	
    	
    	//기본으로 올해 예약 차트와 예약 건수 출력
        selectResBySelectedYearForSitter(); // 올해 예약 차트 출력
        thisYearResCountForSitter(); //[완료]예약 건수 출력
    	
    	//차트에서 연도를 바꿀 때 마다 새로운 데이터 출력
        $(document).on("change","#period_selector",function(){
        	selectedYear = document.getElementById("period_selector").value; //그래프에서 선택한 연도
        	selectResBySelectedYearForSitter();
        	$('#thisYearAllResCount').html("");
        	$('#thisYearCanResCount').html("");
        	$('#thisYearComResCount').html("");
        	thisYearResCountForSitter();
        }); 
    	
    	//[완료] 차트에서 연도를 바꿀 때 마다 그 해의 예약 건수에 관한 함수
    	function thisYearResCountForSitter(){
    		$.ajax({
        		url:"thisYearResCountForSitter"
        		,type:"post"
        		,data:{
        			"res_start":selectedYear,
        			"st_id":"${sessionScope.sessionId}"
        		}
        		,success:function(serverData){
        			var thisYearAllResCount = serverData[0]; //전체 예약 수
        			var thisYearCanResCount = serverData[1]; // 취소된 예약 수
        			var thisYearComResCount = serverData[2]; // 서비스 이용이 완료된 예약 수
        			$("#thisYearAllResCount").append(thisYearAllResCount);
        			$("#thisYearCanResCount").append(thisYearCanResCount);
        			$("#thisYearComResCount").append(thisYearComResCount);
        		}
    		});
    	}
    	
    	//차트에서 연도를 바꿀 때 마다 그 해의 예약에 관한 통계 표시
        function selectResBySelectedYearForSitter(){
        	var selectAjax = $.ajax({
        		url:"selectResBySelectedYearForSitter"
        		,type:"post"
        		,data:{
        			"res_start":selectedYear,
        			"st_id":"${sessionScope.sessionId}"
        		}
        		,success:function(serverData){
        			console.log("serverData.length : " + serverData.length);
        			yearData = serverData;
        		}
        	});
        	
        	$.when(selectAjax).done(function () {
        		console.log(yearData);
                // 그래프관련 함수
                var ctx = document.getElementById("myChart").getContext('2d');
                var myChart = new Chart(ctx,{
                	type: 'bar',
                	data:{
                		labels:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
                		datasets:[{
                			label:'# 今月の予約総数',
                			data:yearData,
             				backgroundColor:[
             					'rgba(255,99,132,0.2)',
             					'rgba(54,162,235,0.2)',
             					'rgba(255,206,86,0.2)',
             					'rgba(75,192,192,0.2)',
             					'rgba(153,102,255,0.2)',
             					'rgba(255,159,64,0.2)',
             					'rgba(255,99,132,0.2)',
             					'rgba(54,162,235,0.2)',
             					'rgba(255,206,86,0.2)',
             					'rgba(75,192,192,0.2)',
             					'rgba(153,102,255,0.2)',
             					'rgba(255,159,64,0.2)'
             				],
             				borderColor:[
             					'rgba(255,99,132,1)',
             					'rgba(54,162,235,1)',
             					'rgba(255,206,86,1)',
             					'rgba(75,192,192,1)',
             					'rgba(153,102,255,1)',
             					'rgba(255,159,64,1)',
             					'rgba(255,99,132,0.2)',
             					'rgba(54,162,235,0.2)',
             					'rgba(255,206,86,0.2)',
             					'rgba(75,192,192,0.2)',
             					'rgba(153,102,255,0.2)',
             					'rgba(255,159,64,0.2)'
             				],
             				borderWidth:1
                		}]
                	},
                	option:{
                		maintainAspectRatio: true,
                		scales:{
                			yAxes:[{
                				ticks:{
                					beginAtZero:true
                				}
                			}]
                		}
                	}
                });
        	});
        }
    });
   
    //최근 예약 5개만 가져오는 함수
    function selectResBySitterId(){
    	$.ajax({
    		url:"selectResBySitterId"
    		,type:"post"
    		,data:{
    			st_id:"${sessionScope.sessionId}"
    		}
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
    
    //최근 리뷰 5개만 가져오는 함수
    function selectNewReviewList(){
    	$.ajax({
    		url:"selectNewReviewList"
    		,type:"post"
    		,data:{
    			"st_id":"${sessionScope.sessionId}"
    		}
    		,success:function(serverData){
    			for(var i = 0 ; i < serverData.length ; i++){
    				var str = "";
    				str += '<li>';
                    str += '<div class="single_buyer single_sitter">';
                    str += '<div class="buyer__thumb_title">';
                    str += '<div class="thumb">';
//                     str += '<img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/"'+serverData[i].mb_id+'.png alt="Sitter Images">';
                    str += '</div>';
                    str += '<div class="title">';
                    str += '<h6>予約ナンバー: '+serverData[i].res_id+'</a></h6>';
                    str += '<p>サービスナンバー:'+serverData[i].service_id+'</p>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="price">';
                    str += '<p>'+serverData[i].res_rate+'</p>';
                    str += '</div>';
                    str += '</div>';
                    str += '</li>';
    				$("#mj_newRegisterReview").append(str);
    			}
    		}
    	});
    }
    
    //서비스 이용 완료된(利用済み) 모든 매출을 가져오는 메소드
    function selectAllResComStatusBySitterId(){
    	$.ajax({
    		url:"selectAllResComStatusBySitterId"
    		,type:"post"
    		,data:{
    			"st_id":"${sessionScope.sessionId}"
    		}
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
    			"res_start":todayDate
    			,"st_id":"${sessionScope.sessionId}"
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
<body>
	<jsp:include page="../menuBar.jsp" />
<section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">シッターメニュー</h2>
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
                                <a href="sitterInfoModi"><span class="lnr icon-settings"></span>マイページ</a>
                            </li>
                            <li>
                                <a href="sitterResList"><span class="lnr icon-notebook"></span>予約リスト</a>
                            </li>
                            <li class="active s_jfont">
                                <a href="sitterChartPage"><span class="lnr icon-chart"></span>統計</a>
                            </li >
                            <li style="width:200px;">
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
     </section>
	 <section class="dashboard-area">
        <div class="dashboard_contents p-top-100 p-bottom-70" style="padding-top:10px">
            <div class="container">
            <!-- <div id="map-container" style="text-align: center ; margin:30px"></div>-->
                <div class="row">
                   	 <div class="col-md-12" style="padding-top: 40px">
					       <div class="dashboard_title_area">
					          <div class="pull-left">
					            <div class="dashboard__title">
					               <h3>統計</h3>
					             </div>
					          </div>
					         </div>
					       </div><!-- ends: .col-md-12 -->

                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="primary"></h1>
                            <p>今日の収入</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="secondary"></h1>
                            <p>今月の収入</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="info"></h1>
                            <p>今年の収入</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="author-info author-info--dashboard">
                            <h1 class="danger"></h1>
                            <p>総収入</p>
                        </div>
                    </div><!-- end .col-lg-3 -->
                <!-- </div> -->
                <!--  <div class="row"> -->
                    <div class="col-lg-8 col-md-12" 
                   	style="flex: 0 0 50%;max-width: 50%;">
                        <div class="dashboard_module recent_sells">
                            <div class="dashboard__title">
                                <h4>最近の予約</h4>
                                <div class="loading">
                                    <a id="resListRefresh" href="#">リフレッシュ<span class="lnr icon-refresh"></span></a>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <ul id="mj_newReservation">
                                </ul>
                            </div><!-- ends: .dashboard__content -->
                        </div><!-- ends: .dashboard_module -->
                    </div><!-- ends: .col-md-8 -->
                    <div class="col-lg-4 col-md-12" 
                    	style="flex: 0 0 50%;max-width: 50%;">
                        <div class="dashboard_module recent_buyers">
                            <div class="dashboard__title">
                                <h4>最近のレビュー</h4>
                                <div class="loading">
                                    <a id="rivewListRefresh" href="#">
                                        	リフレッシュ <span class="lnr icon-refresh"></span>
                                    </a>
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <ul id="mj_newRegisterReview">
                                </ul>
                            </div><!-- ends: .dashboard__content -->
                        </div><!-- ends: .dashboard_module -->
                    </div><!-- ends: .col-md-4 -->
                    <div class="col-lg-12">
                        <div class="dashboard_module statistics_module">
                            <div class="dashboard__title">
                                <h4>予約統計</h4>
                                <!--<div id="stat_legend" class="legend"></div>-->
                                <div class="select-wrap">
                                    <select name="mon" id="period_selector" class="period_selector">
                                      	<option value="2019">2019</option>
                                        <option value="2018">2018</option>
                                        <option value="2017">2017</option>
                                    </select>
                                    <!-- <span class="lnr icon-arrow-down"></span> -->
                                </div>
                            </div><!-- ends: .dashboard__title -->
                            <div class="dashboard__content">
                                <canvas id="myChart"></canvas>
                                <div class="statistics_data">
                                    <div class="single_stat_data">
                                        <h4 id="thisYearAllResCount" class="single_stat__title"></h4>
                                        <p>今年の<span>予約</span>総数</p>
                                    </div>
                                    <div class="single_stat_data">
                                        <h4 id="thisYearCanResCount" class="single_stat__title color-primary"></h4>
                                        <p>今年の<span>キャンセル</span>総数</p>
                                    </div>
                                    <div class="single_stat_data align-right">
                                        <h4 id="thisYearComResCount" class="single_stat__title color-secondary"></h4>
                                        <p>今年の<span>利用済み</span>総数</p>
                                    </div>
                                </div>
                                
                            </div><!-- ends: .dashboard__content -->
                        </div><!-- ends: .statistics_module -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
         </div>
    </section><!-- ends: .dashboard-area -->
    
     <div class="go_top" style="display: block; text-align:center;">
	    <span class="icon-arrow-up"></span>
	 </div>
	 
	   <!-- inject:js-->
    <script src="vendor_assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="vendor_assets/js/jquery/uikit.min.js"></script>
    <script src="vendor_assets/js/bootstrap/popper.js"></script>
    <script src="vendor_assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- <script src="vendor_assets/js/chart.bundle.min.js"></script>-->
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