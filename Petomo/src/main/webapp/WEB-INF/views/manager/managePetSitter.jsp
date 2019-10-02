<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Manage Pet Sitter</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    	
	<script>
	    
	    var st_id = ""
	    var st_check = "" ; //활동 가능 여부 변경을 위한 변수
	    var location; //지역별 펫 시터 목록을 보기 위한 변수
	    
	    $(function(){
	    	
	    	selectAllSitter();
	    	
			$(document).on("click","#activityBtn",function(){
	    		st_id =$(this).attr("data-id");
	    		st_check = $(this).attr("data-check");
	    		alert("제대로 동작 중");
	    		console.log(st_id);
	    		console.log(st_check);
	    		updateSitterCheck();
	    		st_id = "";
	    		st_check = "";
	    		selectAllSitter();
	    	});
	    	
	    });
	    
	    function selectAllSitter(){
	    	$.ajax({
	    		url:"selectAllSitter"
	    		,type:"post"
	    		,success:function(serverData){
	    			$("#sitterList").html('<thead><tr><th>Sitter ID</th><th>Sitter Name</th><th>Sitter email</th><th>Sitter check</th><th></th></tr></thead>');
	    			for(var i = 0 ; i < serverData.length ; i++){
	    				var str = "";
	    				str += '<tbody>';
	    				str += '<tr>';
	    				str += '<td><a href="sitterDetail?st_id='+serverData[i].st_id+'">'+serverData[i].st_id+'</a></td>';
	    				str += '<td>'+serverData[i].st_name+'</td>';
	    				str += '<td>'+serverData[i].st_email+'</td>';
	    				str += '<td>'+serverData[i].st_check+'</td>';
	    				if(serverData[i].st_check=='N'){
	    					str += '<td><input type="button" id="activityBtn" name="activityBtn" data-check="'+serverData[i].st_check+'" data-id="'+serverData[i].st_id+' "value="Accept"></td>';
	    				}else{
	    					str += '<td><input type="button" id="activityBtn" name="activityBtn" data-check="'+serverData[i].st_check+'" data-id="'+serverData[i].st_id+' "value="  Ban  "></td>';
	    				}
	    				str += '</tr>';
	    				str += '</tbody>';
	    				$("#sitterList").append(str);
	    			}
	    		}
	    	});
	    }
	    
	    function updateSitterCheck(){
	    	$.ajax({
	    		url:"updateSitterCheck"
	    		,type:"post"
	    		,data:{
	    			st_id:st_id
	    			,st_check:st_check
	    		}
	    		,success:function(serverData){
	    			if(serverData=="ok")
	    				alert("[System] 활동 상태 업데이트에 성공하였습니다.");
	    			else
	    				alert("[System] 활동 상태 업데이트에 실패하였습니다.");
	    		}
	    		
	    	});
	    }
	    
	  
	</script>
</head>

<body class="preload">
    <jsp:include page="../menuBar.jsp" />
    <jsp:include page="../managerMenuBar.jsp" /> 
  
     
    <section class="p-top-100 p-bottom-70 bgcolor">
  
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="modules__content">
                        <div class="withdraw_module withdraw_history bg-white">
                            <div class="withdraw_table_header">
                                <h4>Sitter List</h4>
                            </div>
                            <div class="table-responsive">
                                <table id="sitterList" class="table withdraw__table">
                                   
                                   
                                </table>
                            </div>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- ends: .row -->
        </div><!-- ends: .container -->
    </section>
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