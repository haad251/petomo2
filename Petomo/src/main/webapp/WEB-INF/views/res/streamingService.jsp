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
  });
  </script>
  
</head>

<body class="preload">
	<jsp:include page="../menuBar.jsp" /> 


    <section class="message_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12">
                    <div class="chat_area cardify">
                        <div class="chat_area--title">
                            <h3>Message with <span class="name">Codepoet</span></h3>
                            <div class="message_toolbar">
                                <a href="#">
                                    <span class="icon-flag"></span>
                                </a>
                                <a href="#">
                                    <span class="icon-trash"></span>
                                </a>
                                <a href="#" id="drop1" class="dropdown-toggle dropdown-trigger" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="img/menu_icon.png" class="dropdown-trigger" alt="Menu icon">
                                </a>
                                <ul class="dropdown dropdown-menu" aria-labelledby="drop1">
                                    <li>
                                        <a href="#">Mark as unread</a>
                                    </li>
                                    <li>
                                        <a href="#">Dropdown link</a>
                                    </li>
                                    <li>
                                        <a href="#">All Attachments</a>
                                    </li>
                                </ul><!-- ends: .dropdown -->
                            </div><!-- ends: .message_toolbar -->
                        </div><!-- ends: .chat_area--title -->
                        
                        <object type="application/x-vlc-plugin" pluginspage="http://www.videolan.org"
    version="VideoLAN.VLCPlugin.2" classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/videolan/vlc/0.9.2/win32/axvlc.cab" width="640" height="480" id="vlc0" events="True"> 
    <param name="Src" value="rtsp://203.233.196.14:1935/petlive01/myStream"></param> <!-- 영상 스트리밍 -->
    <param name="ShowDisplay" value="True" ></param> 
    <param name="AutoLoop" value="no"></param> 
    <param name="AutoPlay" value="yes"></param> 
    <embed type="application/x-google-vlc-plugin" name="vlcfirefox" autoplay="yes" loop="no" width="400" height="300" target="rtsp://203.233.196.14:1935/petlive01/myStream"></embed> 
</object>
                        
                        
                        <div class="chat_area--conversation" id="chatForm">
                        
                        <c:forEach items="${cList}" var="chat">
                            <div class="conversation">
                                <div class="head">
                                    <div class="chat_avatar">
                                        <img src="img/notification_head5.png" alt="Notification avatar">
                                    </div>
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
                        </div><!-- ends: .chat_area--conversation -->
                        
                        
                        <div class="message_composer">
                            <div class="composer_field" id="trumbowyg-demo"></div><!-- ends: .trumbowyg-demo -->
                            <div class="attached"></div>
                            <div class="btns">
                            <input type="text" id="sendMessageText" style="width: 70%; border:1px solid #515ef4;">
                                <button class="btn send btn--sm btn-primary" id="sendMessageBtn">Reply</button>
<!--                                 <label for="att"> -->
<!--                                     <input type="file" class="attachment_field" id="att" multiple> -->
<!--                                     <span class="icon-paper-clip"></span> Attachment -->
<!--                                 </label> -->
                            </div><!-- ends: .message_composer -->
                        </div><!-- ends: .message_composer -->
                    </div><!-- ends: .chat_area -->
                </div><!-- ends: .col-md-7 -->
            </div><!-- ends: .row -->
        </div><!-- ends: .container -->
    </section><!-- ends: .message_area -->
</body>
</html>