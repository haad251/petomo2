<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>

<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">

<script>
	$(function(){
		$(".res_status_btn").on("click",function(){
			var res = $(this).attr("data-res");
			$("#hiddenRes").val(res);
		});
		
		$("#res_confirm_btn").on("click",function(){
			$("#resModalForm").attr("action", "confirmReservation");
			$("#resModalForm").submit();
		});
		
		$("#res_cancel_btn").on("click",function(){
			$("#resModalForm").attr("action", "cancelReservation");
			$("#resModalForm").submit();
		});
		
		
	});
</script>
    
    
</head>

<body class="preload">
	<jsp:include page="../menuBar.jsp" /> 
	<jsp:include page="sitterMenuBar.jsp" /> 
	
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
	                                        <td>${res.res_start}~${res.res_end}</td>
	                                        <td>${res.mb_id}</td>　
	                                        <td>${res.service_name}</td>
    	                                    <td>${res.res_amount}</td>
            	                            <td>${res.res_memo}</td>
            	                           	<td class="type">
            	                           	 <c:choose>
										         <c:when test = "${res.res_status=='予約待機'}">
										           	<span class="sale">
	            	                           			<a href="#" class="res_status_btn" data-target="#myModal2" 
    	        	                           			data-toggle="modal" data-res="${res.res_id}"
    	        	                           			style="color:yellow;">${res.res_status}</a>
    	        	                           		</span>
										         </c:when>
										         <c:when test ="${res.res_status=='キャンセル'}">
										           <span class="withdrawal">
													${res.res_status}
													</span>	   
										         </c:when>
										         <c:when test ="${res.res_status=='利用済み'}">
										           <span class="credited">
													${res.res_status}
													</span>	   
										         </c:when>										         
										         <c:when test ="${res.res_status=='予約完了'}">
										           <span class="purchase">
													${res.res_status}
													</span>	
										         </c:when>										         
										      </c:choose>
            	                           	</td>
	                                        <td class="action">
	                                            <a href="streamingService?res_id=${res.res_id}">go</a>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                
                                </tbody>
                            </table>
                        </div><!-- ends: .statement_table -->
                    </div>
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    
      <!-- Modal Delete -->
    <div class="modal fade delete_modal" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal2">
        <div class="modal-dialog modal modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title">予約情報</h3>
                    	대충정보뿌려주기
                </div>
               		 <div class="modal-body">
<!-- 		                <div id="res_status_form"> -->
               		 		 <form id="resModalForm" method="POST"> 
               		 		 	<input type="hidden" id="hiddenRes" name="res_id" >
	               				 <button id="res_confirm_btn" type="button" class="btn btn-danger btn-md">予約承認</button>
    	           		   		 <button id="res_cancel_btn" class="btn modal_close" data-dismiss="modal">予約キャンセル</button>
               	   			 </form>
<!--         		       	</div> -->
               		 </div>
                <!-- end /.modal-body -->
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