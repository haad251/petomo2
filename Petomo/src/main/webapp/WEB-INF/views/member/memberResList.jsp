<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
<script>
	$(function(){
		$(".res_review_btn").on("click",function(){
			var res = $(this).attr("data-res");
			$("#hiddenResId").val(res);
		});
	});
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
                        <h2 class="page-title">Member Statement</h2>
                        <div class="breadcrumb">
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
                                <a href="memberProfile"><span class="lnr icon-home"></span>Dashboard</a>
                                  
                            </li>
                           <li class="active">
                                <a href="memberResList"><span class="lnr icon-basket"></span>予約確認 </a>
                            </li>
                            <li>
                                <a href="signupPet"><span class="lnr icon-note"></span>ペット登録</a>
                            </li>
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
        <div class="dashboard_contents dashboard_statement_area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="dashboard_title_area">
                            <div class="dashboard__title">
                                <h3>予約確認</h3>
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
                                        <th>日付</th>
                                        <th>時間</th>
                                        <th>シッター</th>　
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
	                                        <td>${res.st_id}</td>　
	                                        <td>${res.service_name}</td>
    	                                    <td>${res.res_amount}</td>
            	                            <td>${res.res_memo}</td>
            	                           	<td class="type">
            	                           	 <c:choose>
										         <c:when test = "${res.res_status=='予約待機'}">
										           	<span class="sale">
														${res.res_status}
    	        	                           		</span>
										         </c:when>
										         <c:when test ="${res.res_status=='キャンセル'}">
										           <span class="withdrawal">
														${res.res_status}
													</span>	   
										         </c:when>
										         <c:when test ="${res.res_status=='予約完了'}">
										           <span class="purchase">
														${res.res_status}
													</span>	
										         </c:when>										         
										         <c:when test ="${res.res_status=='利用済み' && res.res_rate==null}">
										           <span class="credited">
														<a href="#" class="res_review_btn"
														data-target="#myModal1" data-toggle="modal"
														data-res="${res.res_id}" style="color:yellow;">
														レビュー作成</a>
													</span>	   
										         </c:when>
										         <c:when test ="${res.res_status=='利用済み'  && res.res_rate!=null}">
										           <span class="credited">
														レビュー作成済み
													</span>	   
										         </c:when>
										      </c:choose>
            	                           	</td>
	                                        <td class="action">
	                                            <a href="endedService?res_id=${res.res_id}">go</a>
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
    </section><!-- ends: .dashboard-area -->
    
    <!-- Modal Rating -->
    <div class="modal fade rating_modal" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="rating_modal">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="rating_modal">レビューを作成</h3>
                </div>
                <!-- end /.modal-header -->
                <div class="modal-body">
                    <form action="insertReview">
                    <input type="hidden" id="hiddenResId" name="res_id" >
                        <ul>
                            <li>
                                <p>評価</p>
                                <div class="right_content btn btn--round btn--white btn--md">
                                    <select name="res_rate" class="give_rating">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </li>
                        </ul>
                        <div class="rating_field">
                            <label for="rating_field">コメント</label>
                            <textarea name="res_review" id="rating_field" class="text_field" placeholder="コメントを書いてください"></textarea>
                        </div>
                        <button type="submit" class="btn btn-md btn-primary">登録</button>
                        <button class="btn modal_close" data-dismiss="modal">キャンセル</button>
                    </form>
                    <!-- end /.form -->
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