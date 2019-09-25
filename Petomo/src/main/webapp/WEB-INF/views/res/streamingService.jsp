<!-- 해야할거
자기아이디 오른쪽정렬, 창 사이즈 줄이기 , css수정, 프로필사진 위에만 넣기?
채팅 받아올때 로케이션이랑 연동하기>매퍼 hashmap 수정,행동은 아이콘 넣기 등
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">

  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="/webjars/sockjs-client/sockjs.min.js"></script>
  <script src="/webjars/stomp-websocket/stomp.min.js"></script>
  <script>
  $(function () {
// 		스트리밍		
		var vlc0 = document.getElementById('vlc0');/* 바로밑에꺼까지 영상스트리밍 */
		vlc0.playlist.playItem( vlc0.playlist.add('rtsp://203.233.196.14:1935/petlive01/myStream') );
		
// 		소켓
		var socket = new SockJS('/websocket');  
		stompClient = Stomp.over(socket);  
		
		stompClient.connect({}, function() { 
			  stompClient.subscribe('/topic/chatin', function(msg) { 
				  var data = JSON.parse(msg.body);
			  	var str = '<div class="conversation"><div class="head"><div class="chat_avatar">';
			  	str += '<img src="img/notification_head5.png" alt="Notification avatar">';
			  	str += '</div><div class="name_time"><div>';
			  	str += '<h5>'+data.chat_sender+'</h5><p>'+data.chat_date+'<p></div></div></div><div class="body">';
		        str += data.chat_content + '</div></div>'; 
		        $("#chatForm").append(str);
			  });			
			
			  $("#sendMessageBtn").click(function() {
		    	  var sender="${sessionScope.loginId}";
		    	  var content=$("#sendMessageText").val();
		    	  var receiver="${sitter.st_id}"; 
		    	  var res='res1';      //나중에수정
		    		  stompClient.send('/app/chatin', {}, JSON.stringify({'res_id':res,'chat_sender':sender,'chat_receiver':receiver, 'chat_content':content}));
		      });
			
		});
		
// 		스크롤밑으로내리기
		$(".s_chatlist").scrollTop($(".s_chatlist").height());
  });
  </script>
  
</head>

<body class="preload">
	<jsp:include page="../menuBar.jsp" /> 
<section class="single-product-desc">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12" style="flex: 0 0 60%; max-width:60%;">
                    <div class="item-preview" sytle="heigth:60%;">
<!--                         스트리밍 -->
                        <div class="item-prev-area">
                            <div class="preview-img-wrapper">
                         		<object type="application/x-vlc-plugin" pluginspage="http://www.videolan.org"
								    version="VideoLAN.VLCPlugin.2" classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/videolan/vlc/0.9.2/win32/axvlc.cab" width="640" height="480" id="vlc0" events="True"> 
								    <param name="Src" value="rtsp://203.233.196.14:1935/petlive01/myStream"></param> <!-- 영상 스트리밍 -->
								    <param name="ShowDisplay" value="True" ></param> 
								    <param name="AutoLoop" value="no"></param> 
								    <param name="AutoPlay" value="yes"></param> 
								    <embed type="application/x-google-vlc-plugin" name="vlcfirefox" autoplay="yes" loop="no" width="400" height="300" target="rtsp://203.233.196.14:1935/petlive01/myStream"></embed> 
								</object>

                            </div><!-- ends: .preview-img-wrapper -->
                        </div><!-- Ends: .item-prev-area -->

<!-- 				지도 -->
                        <div class="item-preview--excerpt">
                        	<div>
	                        	<img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/Penguins.jpg" alt="">                                                                    <img src="img/notification_head.png" alt="">
                        	</div>
                        </div>
                        
                        
                    </div><!-- ends: .item-preview-->
                </div><!-- ends: .col-md-8 -->
                
                
                <div class="col-lg-4 col-md-12" style="flex: 0 0 40%; max-width:40%;">
                    <aside class="sidebar sidebar--single-product">
                        <div class="sidebar-card card-pricing">
	                        <div class="chat_area--conversation" id="chatForm">
	                        	<div class="s_chatlist">
			                        <c:forEach items="${cList}" var="chat">
			                            <div class="conversation">
			                                <div class="head">
			                                    <div class="name_time" >
			                                        <div>
			                                            <h5>${chat.chat_sender}</h5>
			                                            <p>${chat.chat_date}<p>
			                                        </div>
			                                    </div> 
			                                </div> 
			                                <div class="body" style="margin-top: 0px;">
			                                      ${chat.chat_content}
			                                </div> 
			                            </div> 
			                        </c:forEach>
	                        	</div>
	                        </div><!-- ends: .chat_area--conversation -->
	                        
	                     	  <div class="message_composer">
                           		<div class="btns">
                       				<input type="text" id="sendMessageText" style="width: 70%; border:1px solid #515ef4;">
                           		    <button class="btn send btn--sm btn-primary" id="sendMessageBtn">Reply</button>
                     			 </div> 
                     		</div> 
                        </div><!-- end .sidebar--card -->
                    </aside><!-- ends: .sidebar -->
                    
                    
                    
                    
                </div><!-- ends: .col-md-4 -->
            </div><!-- ends: .row -->
        </div><!-- ends: .container -->
    </section><!-- ends: .single-product-desc -->
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxflHHc5FlDVI-J71pO7hM1QJNW1dRp4U"></script>
    <!-- inject:js-->
<!--     <script src="vendor_assets/js/jquery/jquery-1.12.4.min.js"></script> -->
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






<!--     <section class="message_area"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-7 col-md-12"> -->
<!--                     <div class="chat_area cardify"> -->
<!--                         <div class="chat_area--title"> -->
<!--                             <h3>Message with <span class="name">Codepoet</span></h3> -->
<!--                             <div class="message_toolbar"> -->
<!--                                 <a href="#"> -->
<!--                                     <span class="icon-flag"></span> -->
<!--                                 </a> -->
<!--                                 <a href="#"> -->
<!--                                     <span class="icon-trash"></span> -->
<!--                                 </a> -->
<!--                                 <a href="#" id="drop1" class="dropdown-toggle dropdown-trigger" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                                     <img src="img/menu_icon.png" class="dropdown-trigger" alt="Menu icon"> -->
<!--                                 </a> -->
<!--                                 <ul class="dropdown dropdown-menu" aria-labelledby="drop1"> -->
<!--                                     <li> -->
<!--                                         <a href="#">Mark as unread</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="#">Dropdown link</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="#">All Attachments</a> -->
<!--                                     </li> -->
<!--                                 </ul>ends: .dropdown -->
<!--                             </div>ends: .message_toolbar -->
<!--                         </div>ends: .chat_area--title -->
                        
                        
                        
                        
<!--                         <div class="chat_area--conversation" id="chatForm"> -->
<%--                         <c:forEach items="${cList}" var="chat"> --%>
<!--                             <div class="conversation"> -->
<!--                                 <div class="head"> -->
<!--                                     <div class="chat_avatar"> -->
<!--                                         <img src="img/notification_head5.png" alt="Notification avatar"> -->
<!--                                     </div> -->
<!--                                     <div class="name_time" > -->
<!--                                         <div> -->
<%--                                             <h5>${chat.chat_sender}</h5> --%>
<%--                                             <p>${chat.chat_date}<p> --%>
<!--                                         </div> -->
<!--                                     </div>  -->
<!--                                 </div>  -->
<!--                                 <div class="body" style="margin-top: 0px;"> -->
<%--                                       ${chat.chat_content} --%>
<!--                                 </div>  -->
<!--                             </div>  -->
                            
<%--                         </c:forEach> --%>
<!--                         </div>ends: .chat_area--conversation -->
                        
                        
<!--                         <div class="message_composer"> -->
<!--                         	<div class="composer_field" id="trumbowyg-demo"></div> -->
<!--                             	<div class="attached"></div> -->
<!--                             		<div class="btns"> -->
<!--                           				<input type="text" id="sendMessageText" style="width: 70%; border:1px solid #515ef4;"> -->
<!--                             		    <button class="btn send btn--sm btn-primary" id="sendMessageBtn">Reply</button> -->
<!-- <!--                          		    	<label for="att"> --> -->
<!-- <!--                                     	<input type="file" class="attachment_field" id="att" multiple> --> -->
<!-- <!--                                     		<span class="icon-paper-clip"></span> Attachment --> -->
<!-- <!--                                 		</label> --> -->
<!--                            			 </div>  -->
<!--                        			 </div>  -->
<!--                        			 </div> -->
<!--                        			 </div> -->
