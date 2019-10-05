<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   	<title>サービス管理</title>
    <script>
    
    var service_id = 0; 
    
    $(function(){
    	
    	selectAllService();
    	
		$(document).on("click","#deleteBtn",function(){
    		service_id =$(this).attr("data-id");
    		deleteOneService();
    		service_id = 0;
    		selectAllService();
    	});
    	
    });
    
    function selectAllService(){
    	$.ajax({
    		url:"selectAllService"
    		,type:"post"
    		,success:function(serverData){
    			$("#serviceList").html('<thead><tr><th>ナンバー</th><th>タイプ</th><th>サービスの名</th><th>ランタイム</th><th></th></tr></thead>');
    			for(var i = 0 ; i < serverData.length ; i++){
    				var str = "";
    				str += '<tbody>';
    				str += '<tr>';
    				str += '<td><a href="serviceDetail?service_id='+serverData[i].service_id+'">'+serverData[i].service_id+'</a></td>';
    				str += '<td>'+serverData[i].service_type+'</td>';
    				str += '<td>'+serverData[i].service_name+'</td>';
    				str += '<td>'+serverData[i].service_time+'</td>';
    				str += '<td><input type="button" id="deleteBtn" class="btn btn-lg btn-danger" name="deleteBtn" data-id="'+serverData[i].service_id+'"value="Delete"></td>';
    				str += '</tr>';
    				str += '</tbody>';
    				$("#serviceList").append(str);
    			}
    		}
    	});
    }
    
    function deleteOneService(){
    	$.ajax({
    		url:"deleteOneService"
    		,type:"post"
    		,data:{
    			service_id:service_id
    		}
    		,success:function(serverData){
    			if(serverData=="ok")
    				alert("[System] サービスの削除に成功");
    			alert("[Error] サービスの削除に失敗");
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
                        <div style="margin-bottom:60px"><a href="/registerService" class="btn btn-lg btn-primary m-right-15">サービス登録</a></div>
                        <div class="withdraw_module withdraw_history bg-white">
                            <div class="withdraw_table_header">
                                <h4>サービスリスト</h4>
                            </div>
                            <div class="table-responsive">
                                <table id="serviceList" class="table withdraw__table">
                                   
                                   
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