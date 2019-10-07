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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

  <script>
  
  $(function(){
	  $('#chatForm').scrollTop($('#chatForm').prop('scrollHeight'));
// 		소켓
		var socket = new SockJS('/websocket');   //서버에 올릴때는 /petomo/websocket!!!!
		stompClient = Stomp.over(socket);  
		
		
		stompClient.connect({}, function() { 
			  stompClient.subscribe('/topic/chats/'+"${res.res_id}", function(msg) {
				  var data = JSON.parse(msg.body);
				  var str = '';
				  if(data.chat_sender == "${sessionScope.sessionId}"){
					  str += '<div class="body" style= "margin-right:4px; text-align: right;">';
					  str += '<div style="display:inline-block;"><p class="s_mychat">';
					  str += data.chat_content + '</p></div><p class="s_chatdate">';
					  str += data.chat_date + '</p></div>';    
				  }else{
					  str += '<div class="body">';
					  str += '<p class="s_yourchat">';
					  str += data.chat_content + '</p></div><p class="s_chatdate">';
					  str += data.chat_date + '</p></div>';    
				  }
		        $("#chatForm").append(str);
				$('#chatForm').scrollTop($('#chatForm').prop('scrollHeight'));
			  });
			  
				stompClient.subscribe('/topic/noti/'+"${sessionScope.sessionId}", function(msg) { 
					var data = JSON.parse(msg.body);
					var str = '';
					str += '<div class="alert alert-primary" role="alert">';
					str += data.not_message+'<p class="notitime">'+data.not_time+'</p>';
	                str += '<button type="button" onclick="upNoti(this.value)" class="close" data-dismiss="alert" aria-label="Close" value="'+data.not_id+'">';
					str += '<span class="icon-close" aria-hidden="true"></span></button></div>';
					$("#notizone").prepend(str);
				});
				
//	 			초기화
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
				});
			
			$("#notibell").mouseover(function(){
				stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/selectNoti', {}, 
						JSON.stringify({'id': "${sessionScope.sessionId}"}));
			});
		});

			  $("#sendMessageText").keyup(function(e){
				  if(e.keyCode == 13)  
					  $("#sendMessageBtn").trigger('click');
				  });
			  $("#sendMessageBtn").click(function() {
				  var sender="${sessionScope.sessionId}";
		    	  var content=$("#sendMessageText").val();
		    	  var receiver = '';
		    	  if("${sessionScope.sessionSitter=='on'}"){
			    	  receiver="${res.mb_id}";
		    	  }else 
		    		  receiver = "${res.st_id}";
		    	  var res="${res.res_id}";
		    	  $("#sendMessageText").val('');		     		
		    	  stompClient.send('/app/chats/'+res+'/inChat', {}, JSON.stringify({'res_id':res,'chat_sender':sender,'chat_receiver':receiver, 'chat_content':content}));
			  });
			  
			  function upNoti(notid){
					stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/upNoti', {}, 
							JSON.stringify({'id': "${sessionScope.sessionId}" , 'not_id' : notid }));
				}
			  
  });
  
  </script>
  <script type="text/javascript" src="//player.wowza.com/player/latest/wowzaplayer.min.js"></script>
  <script type="text/javascript">/*비디오 스트리밍*/
 var mediaNumber =  ${res.res_id}-${ressize}-54;
 if(mediaNumber > -1){mediaNumber = "_"+mediaNumber;}
 else{mediaNumber = "";}
 
  var url = "http://203.233.196.14:1935/vod/mp4:myStream"+mediaNumber+".mp4/playlist.m3u8";
WowzaPlayer.create('playerElement',
    {
    "license":"PLAY2-efNfK-A3XXW-kveHU-p3tdP-cc8Za",
    "title":"",
    "description":"",
    "sourceURL": url,
    "autoPlay":false,
    "volume":"75",
    "mute":false,
    "loop":false,
    "audioOnly":false,
    "uiShowQuickRewind":true,
    "uiQuickRewindSeconds":"30"
    }
);
</script><!--여기까지 비디오 스트리밍  -->
  
</head>

<body class="preload">
	<jsp:include page="../menuBar.jsp" /> 
<section class="single-product-desc">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12" style="flex: 0 0 60%; max-width:40%; margin-left: 100px;">
                    <div class="item-preview" sytle="heigth:60%;">
<!--                         스트리밍 -->
                        <div class="item-prev-area">
                            <div class="preview-img-wrapper">
                         	
<div id="playerElement" style="width:65; height:0; padding:0 0 65% 0"></div>

    <div id="myElement"></div>
                            </div><!--ends: .preview-img-wrapper-->
                        </div><!--Ends: .item-prev-area-->

<!-- 				지도 -->
                        <div class="item-preview--excerpt">
                        	<div>
	                        	<img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/Penguins.jpg" alt=""> 
                        	</div>
                        </div>
                    </div><!-- ends: .item-preview-->
                </div><!-- ends: .col-md-8 -->
                
                <div class="col-lg-4 col-md-12" style="flex: 0 0 40%; max-width:40%;">
                    <aside class="sidebar sidebar--single-product">
                        <div class="sidebar-card card-pricing">
	                        <div class="chat_area--conversation" >
			                 	<div class="conversation" id="chatForm">
			                        <c:forEach items="${cList}" var="chat">
				                          		<c:if test="${chat.chat_sender==sessionScope.sessionId}">
					                                <div class="body" style= "margin-right:4px; text-align: right;">
					                                <div style="display:inline-block;">
				                           				<p class="s_mychat" >${chat.chat_content}</p>
				                           			</div>
				                           			<p class="s_chatdate">${chat.chat_date}</p>
				                           			</div>                                                                                                                              
				                           		</c:if>
				                           		<c:if test="${chat.chat_sender!=sessionScope.sessionId}">
				                                    <div class="body">
													<p class="s_yourchat">${chat.chat_content}</p>
													<p class="s_chatdate">${chat.chat_date}</p>
				                           			</div>   
				                           		</c:if>
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