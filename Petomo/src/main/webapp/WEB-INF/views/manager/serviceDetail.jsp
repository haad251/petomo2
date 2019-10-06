<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <!-- viewport meta -->
	<meta charset="UTF-8">
	<title>Service Detail</title>
	 <!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script>
    
     $(function(){
    	 var service_id = $("#service_id").attr("value");
    	 selectAllResBySerId();
    	 function selectAllResBySerId(){
    	     	$.ajax({
    	     		url:"selectAllResBySerId"
    	     		,type:"post"
    	     		,data:{
    	     			"service_id":service_id
    	     		}
    	     		,success:function(serverData){
    	     			var totalIncome = 0; // 총 수익
	    				var tatalcomIncome = 0;// 총 수익 - 예약 취소된 금액
	    				var totalcanIncome = 0; // 예약 취소된 내역만 계산
    	     			$("#ReservationList").html('<thead><tr><th>予約ナンバー</th><th>担当ペットシッター</th><th>顧客</th><th>サービス進行状況</th><th>日付</th></tr></thead>');
    	    			for(var i = 0 ; i < serverData.length ; i++){
    	    				var str = "";
    	    				str += '<tbody>';
    	    				str += '<tr>';
    	    				str += '<td>'+serverData[i].res_id+'</td>';
    	    				str += '<td><a href="sitterDetail?st_id='+serverData[i].st_id+'">'+serverData[i].st_id+'</a></td>';
    	    				str += '<td>'+serverData[i].mb_id+'</td>';
    	    				if(serverData[i].res_status=="利用済み"){
    	    					str += '<td class="type"><span class="credited">'+serverData[i].res_status+'</span></td>';
    	    					totalIncome += parseInt(serverData[i].res_amount);
    	    				}else if(serverData[i].res_status=="予約完了"){
    	    					str += '<td class="type"><span class="sale">'+serverData[i].res_status+'</span></td>';
    	    					totalIncome += parseInt(serverData[i].res_amount);
    	    				}else if(serverData[i].res_status=="キャンセル"){
    	    					str += '<td class="type"><span class="withdrawal">'+serverData[i].res_status+'</span></td>';
    	    					totalIncome += parseInt(serverData[i].res_amount);
    	    					totalcanIncome += parseInt(serverData[i].res_amount);
    	    				}else if(serverData[i].res_status=="予約待機"){
    	    					str += '<td class="type"><span class="purchase">'+serverData[i].res_status+'</span></td>';
    	    					totalIncome += parseInt(serverData[i].res_amount);
    	    				}
    	    				str += '<td>'+serverData[i].res_date+'</td>';
    	    				str += '</tr>';
    	    				str += '</tbody>';
    	    				$("#ReservationList").append(str);
    	    			}
    	    			tatalcomIncome = totalIncome - totalcanIncome;
	    				$("#tatalcomIncome").append(tatalcomIncome+"￥");
	    				$("#totalcanIncome").append(totalcanIncome+"￥");
	    				$("#totalIncome").append(totalIncome+"￥");
    	     		}
    	     	});
    	     }
     });
     
    </script>
</head>
<body>

    <jsp:include page="../menuBar.jsp" /> 
    <jsp:include page="../managerMenuBar.jsp" /> 
        
 <section class="dashboard-area">
        <div class="dashboard_contents section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="">
                                <div class="dashboard__title">
                                    <h3>${service.service_name}</h3>
                                </div>
                            </div>
                            <div class="ml-auto">
                            	<form action="modifyService" method="get">
                            		<input type="hidden" id="service_id" name="service_id" value="${service.service_id}">
                            		<button class="btn btn--icon btn-sm btn--round btn-secondary">
                                    <span class="icon-settings"></span>修整
                                </button>
                                	<!-- <button class="btn btn-sm btn-primary">修整</button> -->
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
                                   <!--  <h4>サービスの情報</h4> -->
                                    <p>サービスのナンバー  ${service.service_id}</p>
                                </div>
                            </div><!-- ends: .invoice__head -->
                            <div class="invoice__meta">
                                <div class="address">
                                    <h5 class="bold">タイプ</h5>
                                    <p>${service.service_type}</p>
                                    <h5 class="bold">価格</h5>
                                    <p>${service.service_price}￥</p>
                                    <h5 class="bold">ランタイム</h5>
                                    <p>${service.service_time}分</p>
                               <!--  </div>
                                <div class="date_info"> -->
                                	<h5 class="bold">説明</h5>
                                    <p>${service.service_info}</p>
                                </div>
                            </div><!-- ends: .invoice__meta -->
                            
 
                            <!-- 각 서비스의 매출 볼 수 있는 영역 만들 거임 -->
                            <div class="table-responsive invoice__detail">
                                <table id="ReservationList" class="table">
                                    <!-- <thead>
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
                                    </tbody> -->
                                </table>
                                <div class="pricing_info">
                                	<p>総額</p>
                                	<p id="totalIncome"></p>
                                    <p>キャンセル金額</p>
                                    <p id="totalcanIncome"></p>
                                    <p class="bold"  style="color:red">総収益</p>
                                    <p id="tatalcomIncome" class="bold" style="color:red"></p>
                                </div>
                            </div><!-- ends: .invoice_detail -->
                        </div><!-- ends: .invoice -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
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