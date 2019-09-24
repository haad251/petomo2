<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   
   
   
   
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
    			$("#serviceList").html('<thead><tr><th>Service ID</th><th>Service Type</th><th>Service Name</th><th>Service Runtime</th><th></th></tr></thead>');
    			for(var i = 0 ; i < serverData.length ; i++){
    				var str = "";
    				str += '<tbody>';
    				str += '<tr>';
    				str += '<td><a href="serviceDetail?service_id='+serverData[i].service_id+'">'+serverData[i].service_id+'</a></td>';
    				str += '<td>'+serverData[i].service_type+'</td>';
    				str += '<td>'+serverData[i].service_name+'</td>';
    				str += '<td>'+serverData[i].service_time+'</td>';
    				str += '<td><input type="button" id="deleteBtn" name="deleteBtn" data-id="'+serverData[i].service_id+'"value="Delete"></td>';
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
    				alert("[System] 삭제에 성공했습니다.");
    			alert("[System] 삭제에 실패했습니다.");
    		}
    		
    	});
    }
    
  
    </script>
</head>

<body class="preload">
    <jsp:include page="../menuBar.jsp" /> 
    <!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">Service List</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Service List</a>
                                </li>
                            </ul>
                        </div>
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
                                <a href="dashboard.html"><span class="lnr icon-home"></span>Dashboard</a>
                            </li>
                            <li class="active">
                                <a href="dashboard-manage-item.html"><span class="lnr icon-note"></span>Manage Service</a>
                            </li>
                            <li>
                                <a href="dashboard-withdrawal.html"><span class="lnr icon-briefcase"></span>Manage Pet Sitter</a>
                            </li>
                            <li>
                                <a href="dashboard-setting.html"><span class="lnr icon-settings"></span>Setting</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    <section class="p-top-100 p-bottom-70 bgcolor">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="modules__content">
                        <a href="/registerService">Register Service</a>
                        <div class="withdraw_module withdraw_history bg-white">
                            <div class="withdraw_table_header">
                                <h4>Service List</h4>
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