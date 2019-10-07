<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		init();
		price();
		var selectbtn = '';
		$("#resDate").datepicker({
			constrainInput : true,
			minDate : new Date(),
			autoSize : true,
			altFormat : "yy-MM-dd",
			dateFormat : "yy-mm-dd",
		});
		
		
		$("#resDate").change( function() { 
			var st_id = '${sitter.st_id}';
			var selectDate = $("#resDate").val();
	 		var userdata = {"st_id" : st_id , "selectDate": selectDate};
	
			$.ajax({
				type : "POST",
				url : "selectTimes",
				data : userdata,
				success : function(data) {
					var str = '';
					var flag = false;
					for (var i = 9; i < 18; i++){
						if(i!=9 && i%3==0) str+='<br>';
						flag = false;
						for(var j = 0 ; j < data.length ; j++){
							if(i == data[j]){
							 str+='<button type="button" class="btn btn-lg btn-light"  value="'+i+'"';
							 str += 'style="background-color: #b2a2f9; color:gray; border-color: white; cursor: auto; padding:0px; width:120px; margin-bottom:10px; margin-right:6px;">'+i+':00</button>';
							 flag = true;
							 break;
							}
						}
						if(flag==true) continue;
						else str += '<button type="button" class="selectbtn btn btn-lg btn-light" onclick="dateSelect(this.value); this.style.color='red';"  value="'+i+'"';
						str += 'style="background-color: #b2a2f9; color:white; border-color: white; padding:0px; width:120px; margin-bottom:10px; margin-right:6px;">'+i+':00</button>';
					}
					$("#timetable").html(str);
					}
			});
		}); 
		
	});
	
	function dateSelect(dateval) {
		$("#res_start_input").val($("#resDate").val());
		var res_end = Number(dateval) + 1;
		res_end += ":00";
		dateval += ":00";
		alert(dateval);
		var timeval = $("#resDate").val();
		var timestart = timeval+" "+ dateval;
		
		var timeend = timeval+" "+res_end;
		$("#res_end_input").val(timeend);
		$("#res_start_input").val(timestart);
	}
	
	function init(){
		var str = '';
		for (var i = 9; i < 18; i++){
			if(i != 9 && i % 3 == 0) str+='<br>';
			 str+='<button type="button" class="btn btn-lg btn-light" value="'+i+':00"'; 
			 str += 'style="background-color: #b2a2f9; color:gray; border-color: white; cursor: auto; padding:0px; width:120px; margin-bottom:10px; margin-right:6px;">'+i+':00</button>';
			}
		$("#timetable").html(str);
	}
	
	function price(){
		var st_level = '${sitter.st_level}';		
		var str='';
		if(st_level=="bronze" ||st_level=="Bronze"){
			str = Number(0.9) * Number(10000);
		}else if(st_level=="silver"||st_level=="Silver"){
				str = Number(10000);
			}else if(st_level=="gold"||st_level=="Gold"){
				str = Number(1.1) * Number(10000);
		}
			$("#res_amount").val(str);
	}
	
	

	
</script>

</head>


<body class="preload">
    <jsp:include page="../menuBar.jsp" />
	<section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">결제화면</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Checkout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
    <section class="dashboard-area p-top-100 p-bottom-70">
    <form action="insertReservation" class="reservation_form" method="post">
        <div class="dashboard_contents">
            <div class="container">
<!--                 	<input type="hidden" name="service_id" value="8"> -->
                	<input type="hidden" name="st_id" value="${sitter.st_id}">
                	<input type="hidden" name="mb_id" value="${sessionScope.sessionId}">
                	<input type="hidden" name="res_start" id="res_start_input">
                	<input type="hidden" name="res_status" value="予約待機"> 
                	<input type="hidden" name="res_amount" id="res_amount"> 
                	<input type="hidden" name="res_end" id="res_end_input">
<!--                 <input type="hidden" name="service_price" value="30000"> -->
                	
                    <div class="row">
                        <div class="col-lg-6 col-md-12" 
                        style="max-width: 100%;flex: 0 0 100%;">
                            <div class="information_module">
                                <div class="toggle_title">
                                    <h4>결제 정보</h4>
                                </div>
                                
                                
                                <div class="information__set">
                                    <div class="information_wrapper form--fields">
                                        <div class="row">
<!-- 											왼쪽 달력-->
											<div class="col-md-6">
													<div class="input_with_icon">
														<input type="text" id="resDate" placeholder="From" >
														<span class="icon-calendar"></span>
													</div>
<!-- 												</form> -->
											</div>
<!-- 											시간표뜨는곳 -->
											<div class="col-md-6" id="timetable">
<%-- 												<c:forEach items="${timeList}" var="time"> --%>
<!-- 													<button type="button" class="btn btn-lg btn-light"  -->
<!-- 													style="background-color: #b2a2f9; color:gray; border-color: white; cursor: auto; padding:0px;  -->
<%-- 													width:120px; margin-bottom:10px; margin-right:6px;">${time}:00</button> --%>
<%-- 												</c:forEach> --%>
											</div>
                                        </div><!-- ends: .row -->
                                        
                                        
                                        <div class="row">
	                                         <div class="col-lg-6 col-md-12"> 
   	    		                                  <!-- xdddd -->
												<div class="">
													<label for="authbio">메모</label>
													<textarea name="res_memo" id="authbio" class="text_field"
														placeholder="comment"></textarea>
												</div>
												<div class="shortcode_modules">
													<div class="modules__content">
														<div class="row">
															<div class="col-md-3">
																<div class="inline">
<!-- 																	강아지 수 -->
<!-- 																	<input type="number" max="3" name="res_amount"><br> -->
																	서비스
																	<input type="number" max="10" name="service_id"><br>
																	
<!-- 																	<a href="#" id="drop2" -->
<!-- 																		class="dropdown-toggle btn btn-outline-primary btn-md" -->
<!-- 																		data-toggle="dropdown" aria-haspopup="true" -->
<!-- 																		aria-expanded="true"> 강아지 수 </a> -->
<!-- 																	<ul  -->
<!-- 																		class="custom_dropdown messaging_dropdown dropdown-menu" -->
<!-- 																		aria-labelledby="drop2"> -->
<!-- 																		<li><a href="#"> <span class=""></span>1 -->
<!-- 																		</a></li> -->
<!-- 																		<li><a href="#"> <span class=""></span>2 -->
<!-- 																		</a></li> -->
<!-- 																		<li><a href="#"> <span class=""></span>3 -->
<!-- 																		</a></li>		 -->
<!-- 																	</ul> -->
<!-- 																	<a href="#" id="drop3" -->
<!-- 																		class="dropdown-toggle btn btn-outline-primary btn-md" -->
<!-- 																		data-toggle="dropdown" aria-haspopup="true" -->
<!-- 																		aria-expanded="true"> 서비스 </a> -->
<!-- 																	<ul  -->
<!-- 																		class="custom_dropdown messaging_dropdown dropdown-menu" -->
<!-- 																		aria-labelledby="drop3"> -->
<!-- 																		<li><a href="#"> <span class=""></span>서비스1 -->
<!-- 																		</a></li> -->
<!-- 																		<li><a href="#"> <span class=""></span>ㅅㅄ2 -->
<!-- 																		</a></li> -->
<!-- 																		<li><a href="#"> <span class=""></span>ㅅㅄ3 -->
<!-- 																		</a></li> -->
<!-- 																		</ul> -->
																		<button type="button" class="btn btn-lg btn-light" value="${sitter.st_level}" style="background-color: white; color:gray; border-color: white; cursor: auto; padding:0px; width:120px; margin-bottom:10px; margin-right:6px;">${sitter.st_level}</button>
																	
																</div>
															</div>
														</div>
													</div>


													<button type="submit" class="btn btn--md btn-primary">예약</button>
												</div>

											</div><!-- end .information__set -->
                            </div><!-- end .information_module -->
                        </div>
                        </div>
                        </div>
                        </div>
          		</div>
            </div>
        </div><!-- ends: .dashboard_contents -->
      </form><!-- ends: form -->
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