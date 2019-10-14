<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTR-8">
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
    <!-- viewport meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="DigiPro - Digital Products Marketplace ">
    <meta name="keywords" content="marketplace, easy digital download, digital product, digital, html5">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">
    <link rel="stylesheet" href="vendor_assets/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="vendor_assets/css/animate.css">
    <link rel="stylesheet" href="vendor_assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor_assets/css/jquery-ui.css">
    <link rel="stylesheet" href="vendor_assets/css/magnific-popup.css">
    <link rel="stylesheet" href="vendor_assets/css/owl.carousel.css">
    <link rel="stylesheet" href="vendor_assets/css/select2.min.css">
    <link rel="stylesheet" href="vendor_assets/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendor_assets/css/slick.css">
    <link rel="stylesheet" href="vendor_assets/css/trumbowyg.min.css">
    <link rel="stylesheet" href="vendor_assets/css/venobox.css">
    <link rel="stylesheet" href="style.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

 <script>
 $(function () {
		var socket = new SockJS('/petomo/websocket');   //서버에 올릴때는 /petomo/websocket!!!!
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
		
		$("#notibell").mouseover(function(){
			stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/selectNoti', {}, 
					JSON.stringify({'id': "${sessionScope.sessionId}"}));
		});
  });
});
	function upNoti(notid){
		stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/upNoti', {}, 
				JSON.stringify({'id': "${sessionScope.sessionId}" , 'not_id' : notid }));
	}
  
  </script>
</head>
<body>
    <div class="menu-area">
        <div class="top-menu-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="menu-fullwidth">
                            <div class="logo-wrapper">
                                <div class="logo logo-top">
                                    <a href="/petomo/">
                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/logo_small.png"
											alt="logo image" class="img-fluid" height="50px" width="50px"></a>
                                </div>
                            </div>
                         <div class="mobile_content ">
                                    <span class="icon-user menu_icon"></span>
                                    <div class="offcanvas-menu closed">
                                        <span class="icon-close close_menu"></span>
                                         <c:if test="${sessionScope.sessionId == null }">
	   					                  <div class="author-author__info">
                                            <a href="login">Login</a>
	                                      </div>
                                        </c:if>
                               
                                         <c:if test="${sessionScope.sessionId!=null && sessionScope.sessionSitter!=null}">
                                        <div class="author-author__info">
                                            <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                        </div>
                                        <p>${sessionScope.sessionName}</p>
                                        </div>
                                        <!--end /.author-author__info-->
                                        <div class="author__notification_area">
                                            <ul>
                                                <li>
                                                    <a href="notification.html">
                                                        <div class="icon_wrap">
                                                            <span class="icon-bell"></span>
                                                        </div>
                                                    </a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                        <!--start .author__notification_area -->
                                        <div class="dropdown dropdown--author">
                                            <ul>
                                               <li>
                                                    <a href="sitterInfoModi" >
                                                        <span class="icon-user"></span>マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="sitterResList">
                                                        <span class="icon-home"></span>予約照会</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                      
                                            </ul>
                                        </div>
                                         </c:if>
                                    </div>
                                </div>   
                                <!-- end /.mobile_content -->
                        
                            <div class="author-menu">
                                <div class="author-area">
                                    <div class="search-wrapper">
                                        <div class="nav_right_module search_module">
                                            <div class="search_area">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="author__notification_area">
                                       <c:if test="${sessionScope.sessionId != null }">
                                        <ul>
                                            <li class="has_dropdown">
                                                <div class="icon_wrap">
                                                    <span class="icon-bell" id="notibell"></span>
                                                    <div id="notiOn">
<!--                                                     <span class="notification_status noti"></span> -->
													</div>
                                                </div>
                                                <div class="dropdown notification--dropdown">
                                                    <div class="dropdown_module_header">
                                                        <h6>通知</h6>
                                                    </div>
                                                    <div class="notifications_module">
                                                        <div id="notizone" class="notification">
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        </c:if>
                                    </div>
                                    <!--start .author-author__info-->
                                    
                                    <!-- 비로그인시 -->
                                        <c:if test="${sessionScope.sessionId == null }">
	   					                  <div class="author-author__info">
                                            <a href="login">ログイン</a>
	                                      </div>
                                        </c:if>
                                      
<!--                                     멤버로그인 -->
                                   <c:if test="${sessionScope.sessionId!=null && sessionScope.sessionId!='manager' && sessionScope.sessionSitter==null}">
                                     <div class="author-author__info has_dropdown">
                                        <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                            
                                        </div>
                                        <div class="dropdown dropdown--author">
                                            <div class="author-credits d-flex">
                                                <div class="author__avatar">
                                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/member/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                                </div>
                                                 <div class="autor__info">
                                                    <p class="name">
                                                      <a href = "memberProfile"> ${sessionScope.sessionName}</a>
                                                    </p>
<!--                                                     <p class="amount">$20.45</p> -->
                                                </div> 
                                            </div>
                                            <ul>
                                                <li>
                                                    <a href="updateCheck" >
                                                        <span class="icon-user"></span>マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="memberResList">
                                                        <span class="icon-home"></span>予約照会</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                   </c:if>

                                
<!--                                 시터로그인-->
                           			<c:if test="${sessionScope.sessionId!=null && sessionScope.sessionSitter!=null}">
                                     <div class="author-author__info has_dropdown">
                                        <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                        </div>
                                        <div class="dropdown dropdown--author">
                                            <div class="author-credits d-flex">
                                                <div class="author__avatar">
                                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${sessionScope.sessionProfileImg}" alt="user avatar" class="rounded-circle">
                                                </div>
                                                 <div class="autor__info">
                                                    <p class="name">
                                                       ${sessionScope.sessionName}
                                                    </p>
<!--                                                     <p class="amount">$20.45</p> -->
                                                </div> 
                                            </div>
                                            <ul>
                                                <li>
                                                    <a href="sitterInfoModi">
                                                        <span class="icon-user"></span>マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="sitterResList">
                                                        <span class="icon-notebook"></span>予約リスト</a>
                                                </li>
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                            
                                            </ul>
                                        </div>
                                    </div>
                                   </c:if>
                                   
                                   
<!--                                    매니저 로그인 -->
                                <c:if test="${sessionScope.sessionId=='manager'}">
                                     <div class="author-author__info has_dropdown">
                                        <div class="author__avatar online">
                                            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/logo.png" alt="user avatar" class="rounded-circle">
                                        </div>
                                        <div class="dropdown dropdown--author">
                                            <div class="author-credits d-flex">
                                                <div class="author__avatar">
                                                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/logo.png" alt="user avatar" class="rounded-circle">
                                                </div>
                                                 <div class="autor__info">
                                                    <p class="name">
                                                       ${sessionScope.sessionName}
                                                    </p>
<!--                                                     <p class="amount">$20.45</p> -->
                                                </div> 
                                            </div>
                                            <ul>
                                            	<li>
                                                    <a href="managerMyPage">
                                                        <span class="icon-notebook"></span>マネジャー マイページ</a>
                                                </li>
                                                <li>
                                                    <a href="managePetSitter">
                                                        <span class="icon-user"></span>ペッシッター管理</a>
                                                </li>
                                               	<li>
                                                    <a href=manageService>
                                                        <span class="icon-notebook"></span>サービス管理</a>
                                                </li>                                               
                                                <li>
                                                    <a href="logout">
                                                        <span class="icon-logout"></span>ログアウト</a>
                                                </li>
                                            
                                            </ul>
                                        </div>
                                    </div>
                                   </c:if>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
