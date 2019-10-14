<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
	  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
	$(function(){
		var socket = new SockJS('/websocket');   //서버에 올릴때는 /petomo/websocket!!!!
		stompClient = Stomp.over(socket);  
	
		stompClient.connect({}, function() { 
			stompClient.subscribe('/topic/noti/'+"${sessionScope.sessionId}", function(msg) { 
				var data = JSON.parse(msg.body);
				var str = '';
				str += '<div class="alert alert-primary" role="alert">';
				str += data.not_message+'<p class="notitime">'+data.not_time+'</p>';
                str += '<button type="button" onclick="upNoti(this.value)" class="close" data-dismiss="alert" aria-label="Close" value="'+data.not_id+'">';
				str += '<span class="icon-close" aria-hidden="true"></span></button></div>';
				$("#notizone").prepend(str);
				$("#notiOn").html('<span class="notification_status noti"></span>');
			});
				
			stompClient.subscribe('/topic/noti/'+"${sessionScope.sessionId}"+'/selectNoti', function(msg) { 
				var data = JSON.parse(msg.body);
				var str2 ='';
				for(var i in data){
					str2 += '<div class="alert alert-primary" role="alert">';
					str2 += data[i].not_message+'<p class="notitime">'+data[i].not_time+'</p>';
                    str2 += '<button type="button" onclick="upNoti(this.value)" class="close" data-dismiss="alert" aria-label="Close" value="'+data[i].not_id+'">';
					str2 += '<span class="icon-close" aria-hidden="true"></span></button></div>';
				}
				$("#notizone").html(str2);
				if(data.length==0) 
					$("#notiOn").html('');
				else $("#notiOn").html('<span class="notification_status noti"></span>');
			});
			
			
		});
			$("#notibell").mouseover(function(){
				stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/selectNoti', {}, 
						JSON.stringify({'id': "${sessionScope.sessionId}"}));
			});
		
		$(".res_status_btn").on("click",function(){
			var hiddenres = $(this).attr("data-res");
			var hiddenmb_id = $(this).attr("data-mb_id");
			$("#hiddenRes").val(hiddenres);
			$("#hiddenMb").val(hiddenmb_id);
		});
		
		
		$("#res_confirm_btn").on("click",function(){
			var fres = $("#hiddenRes").val();
			var mbid = $("#hiddenMb").val();;
			var stid = "${sessionScope.sessionId}";
			stompClient.send('/app/noti/'+mbid+'/resConfirm', {}, 
					JSON.stringify({'res_id': fres, 'not_receiver':mbid, 'not_sender' : stid}));
			$("#resModalForm").attr("action", "confirmReservation");
			$("#resModalForm").submit();
		});
		
		$("#res_cancel_btn").on("click",function(){
			var fres2 = $("#hiddenRes").val();
			var mbid2 = $("#hiddenMb").val();;
			var stid2 = "${sessionScope.sessionId}";
			stompClient.send('/app/noti/'+mbid2+'/resCancel', {}, 
			JSON.stringify({'res_id': fres2, 'not_receiver':mbid2, 'not_sender' : stid2}));
			$("#resModalForm").attr("action", "cancelReservation");
			$("#resModalForm").submit();
		});
	});
	
	function upNoti(notid){
		stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/upNoti', {}, 
				JSON.stringify({'id': "${sessionScope.sessionId}" , 'not_id' : notid }));
	}
</script>
    
    
</head>

<body class="preload">
	<jsp:include page="../menuBarNo.jsp" /> 
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
                            <li class="active s_jfont">
                                <a href="sitterResList"><span class="lnr icon-notebook"></span>予約リスト</a>
                            </li>
                            <li>
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

        <div class="dashboard_contents dashboard_statement_area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="statement_table table-responsive">
                            <table class="table" style="text-align:center;">
                            		<colgroup>
                            			<col width="7%;">
										<col width="10%;">
										<col width="13%;">
										<col width="10%;">
										<col width="10%;">
										<col width="30%;">
										<col width="10%;">
										<col width="10%;">
									</colgroup>
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
	                                        <td><a href = "sitterMemberCheck?mb_id=${res.mb_id}">${res.mb_id}</a></td>　
	                                        <td>${res.service_name}</td>
    	                                    <td>${res.res_amount}</td>
            	                            <td>${res.res_memo}</td>
            	                           	<td class="type">
            	                           	 <c:choose>
										         <c:when test = "${res.res_status=='予約待機'}">
										           	<span class="sale">
	            	                           			<a href="#" class="res_status_btn" data-target="#myModal2" 
    	        	                           			data-toggle="modal" data-res="${res.res_id}" data-mb_id="${res.mb_id}"
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
      　   　       	            	        		 <c:if test ="${res.res_status=='利用済み' }">
	                                        <td class="action">
	                                            <a href="endedService?res_id=${res.res_id}">go</a>
	                                        </td>
	                                        </c:if>
	                                         <c:if test ="${res.res_status=='予約完了' }">
	                                        <td class="action">
	                                            <a href="sitterStreaming?res_id=${res.res_id}">go</a>
	                                        </td>
	                                        </c:if>            	                           	
	                                    </tr>
                                    </c:forEach>
                                
                                </tbody>
                            </table>
                        </div><!-- ends: .statement_table -->
                    </div>
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->


    <div class="modal fade delete_modal" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal2">
        <div class="modal-dialog modal modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title">予約確認</h3>
        
                </div>
               		 <div class="modal-body">
               		 		 <form id="resModalForm" method="POST"> 
               		 		 	<input type="hidden" id="hiddenRes" name="res_id" >
               		 		 	<input type="hidden" id="hiddenMb" name="mb_id" >
	               				 <button id="res_confirm_btn" type="button" class="btn btn-danger btn-md">予約承認</button>
    	           		   		 <button id="res_cancel_btn" class="btn modal_close" data-dismiss="modal">予約キャンセル</button>
               	   			 </form>
               		 </div>
            </div>
        </div>
    </div>
    
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
</body>
</html>