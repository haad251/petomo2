<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">

<head>
    <meta charset="UTF-8">
       <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script>
    $(function(){
   	init();
	doglist(resp);
});
    function init() {
    var memberId = $("#memberId").val();
    var tag = "";
    	$.ajax({
    		type:'GET'
    		, data : {"mb_id":memberId}
    		, url : 'dogList'
    		, success : function doglist(resp) {
    	    	for (var i = 0; i < resp.length; i++)
    			{ tag += '<tr>';
    				tag += '<td>'+resp[i].pet_name+'</td>';
    				tag += '<td>'+resp[i].pet_type+'</td>';
    				tag += '<td>'+resp[i].pet_breed+'</td>';
    				tag += '<td>'+resp[i].pet_status+'</td;>';
    				tag += '<td>'+resp[i].pet_sex+'</td>';
    				tag += '<td>'+resp[i].pet_weight+'</td>';
    				tag += '<td>'+resp[i].pet_birth+'</td>';
    				tag += '<td>'+resp[i].pet_neuter+'</td>';
    				tag += '<td><input class="del" data-value="'+resp[i].pet_id+'" type="button" value="삭제" id = "delete" />';
    				tag += '    <input class="update"  data-value="'+resp[i].pet_id+'" type="button" value="수정" id = "update" />';
    				tag += '</td>';
    				tag += '</tr>';
    			}
    			$("#dog").html(tag);//#book 태그 밑에 tag추가

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
                        <h2 class="page-title">Member Profile</h2>
                        <div class="breadcrumb">
                           
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
        
    </section><!-- ends: .breadcrumb-area -->
      <div class="dashboard_menu_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button class="menu-toggler d-md-none">
                            <span class="icon-menu"></span> Dashboard Menu
                        </button>
                        <ul class="dashboard_menu">
                            <li class="active">
                                <a href="dashboard.html"><span class="lnr icon-home"></span>Dashboard</a>
                            </li>
                            <li>
                                <a href="memberResList"><span class="lnr icon-basket"></span>예약 확인</a>
                            </li>
                            <li>
                                <a href="signupPet"><span class="lnr icon-note"></span>강아지 정보 작성</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
    <section class="author-profile-area">
    
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="author-profile">
                        <div class="row">
                            <div class="col-lg-5 col-md-7">
                                <div class="author-desc">
                                    <img src="img/author.jpg" alt="">
                                    <div class="infos">
                                        <h4>${sessionScope.sessionName}</h4>
                                        <input type = "hidden" value = "${sessionScope.sessionId}" id = "memberId">
                                        <ul>
                                            <li>
                                                <a href="" class="btn btn-primary btn--xs">Follow</a>
                                            </li>
                                            <li>
                                                <a href="" class="btn btn-danger btn--xs" data-toggle="modal" data-target="#author-contact">
                                                    <span class="icon-envelope-open"></span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="" class="btn btn-secondary btn--xs">
                                                    <span class="icon-globe"></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!-- ends: .author-desc -->
                            </div><!-- ends: .col-lg-5 -->
                            <div class="col-lg-3 order-lg-2 col-md-5 order-md-1">
                                <div class="author-stats">
                                    <ul>
                                        <li class="t_items">
                                            <span>146</span>
                                            <p>강아지 마리수</p>
                                        </li>
                                        <li class="t_sells">
                                            <span>2426</span>
                                            <p>지금까지 이용한 횟수</p>
                                        </li>
                                        <li class="t_reviews">
                               <!--              <div>
                                                <span class="ratings">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </span>
                                                <span class="avg_r">5.0</span>
                                                <span>(226 reviews)</span>
                                            </div> -->
                                            <p>Author Ratings</p>
                                        </li>
                                    </ul>
                                </div><!-- ends: .author-stats -->
                            </div><!-- ends: .col-lg-4 -->
                        </div>
                    </div>
                </div><!-- ends: .col-lg-12 -->
                <div class="dashboard_contents dashboard_statement_area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="dashboard__title">
                                <h3>펫 목록</h3>
                            </div>
                        </div>
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
               
                <div class="row">
                    <div class="col-md-12">
                        <div class="statement_table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>펫 이름</th>
                                        <th>종류</th>
                                        <th>품종</th>
                                        <th>성격</th>
                                        <th>성별</th>
                                        <th>체중</th>
                                        <th>생일</th>
                                        <th>중성화</th>
                                    </tr>
                                </thead>
                                <tbody id = "dog">
                                    <c:forEach items="${petList}" var="petList" varStatus="i">
<tr>
<td><c:out value="${petList.pet_name}"/></td>
<td><c:out value="${petList.pet_type}"/></td>
<td><c:out value="${petList.pet_breed}"/></td>
<td><c:out value="${petList.pet_status}"/></td>
<td><c:out value="${petList.pet_sex}"/></td>
<td><c:out value="${petList.pet_weight}"/></td>
<td><c:out value="${petList.pet_birth}"/></td>
<td><c:out value="${petList.pet_neuter}"/></td>
</tr>
</c:forEach>
                                </tbody>
                            </table>
                        </div><!-- ends: .statement_table -->
                    </div>
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
    </section><!-- ends: .author-profile-area -->
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxflHHc5FlDVI-J71pO7hM1QJNW1dRp4U"></script>
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