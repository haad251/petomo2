<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=(KEYHERE)&callback=initMap"async defer></script>
  <script>
  $(function(){
	  $('#chatForm').scrollTop($('#chatForm').prop('scrollHeight'));
		var socket = new SockJS("/websocket");   //서버에 올릴때는 /petomo/websocket!!!!
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
 var mediaNumber =  ${ressize}+55-${res.res_id};
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
</script>
 
  <script>
  var map, infoWindow;
  var markerPosition;
  var lastLat=35.7139888; //마지막 위도(Latitude)
  var lastLng=139.7771283; //마지막 경도 (Longitude)   
	var historyLoc = new Array(); // 지금까지의 경로를 polyline으로 그리기 위한 배열s
  var watchID;
  var pos;
  var image = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/location.png';   
  var nowmarker;

  
  $(function(){
  
	
	  initMap(); // 지도 부르기
	  
  });

	function initMap() {
      map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 35.7139888, lng: 139.7771283},
        zoom: 15
      });
      infoWindow = new google.maps.InfoWindow;
      
      // 모든 지도 데이터 가져와서 마크 찍어주기
      allLocData();
   }
	
	//DB에 저장된 모든 지역 정보 불러와서 지도 전체에 마크랑 패스 찍어주기
	function allLocData(){
		$.ajax({
			url:"allLocData"
			,type:"post"
			,data:{
				res_id:'${res.res_id}'
			}
			,success:function(serverData){
				
				lastLat = Number(serverData[serverData.length-1].loc_lat);
				lastLng = Number(serverData[serverData.length-1].loc_long);
				
				console.log(lastLat);
				pos = {
		                lat: lastLat,
		                lng: lastLng
		        };
				
				for(var i = 0 ; i < serverData.length ; i++){
					//마크를 찍기위한 경도 , 위도
					var hisLatLng = new google.maps.LatLng(serverData[i].loc_lat, serverData[i].loc_long);
					
					//패스를 그리기 위한 경도, 위도 배열에 데이터 담기
					historyLoc[i] = {
							lat:Number(serverData[i].loc_lat),
							lng: Number(serverData[i].loc_long)
					};
					
					//패스(Polyline) 그려주기
					var walkingPath = new google.maps.Polyline({
				        path: historyLoc,
				        strokeColor: "#0000FF",
				        strokeOpacity: 0.8,
				        strokeWeight: 2
				     });
					walkingPath.setMap(map);
				
					//각 action별 icon이 있는 파일 표시를 위한 변수 명명
					var urlRoot ;
					
					if(serverData[i].loc_action == "poop")
						urlRoot = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/poop.png';
					else if(serverData[i].loc_action == "food")
						urlRoot = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/food.png';
					else if(serverData[i].loc_action == "play")
						urlRoot = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/play.png';
					else if(serverData[i].loc_action == "water")
						urlRoot = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/water.png';
					else
						urlRoot = "none"; //action을 하지 않을 ""nothing" 상태에서는 어떻게 할지는 조금 더 생각해봐야할듯
					
					// action에 따른 마크 그려주기
					var marker = new google.maps.Marker({
						position: hisLatLng
						,map : map
						,title : serverData[i].loc_action
						,icon: {
							url : urlRoot,
							scaledSize: new google.maps.Size(45, 45), // scaled size
						    origin: new google.maps.Point(0,0), // origin
						    anchor: new google.maps.Point(0, 0) // anchor
						}
					});
				}
				// 패스 데이터 잘 들어 갔는지 확인
				console.log(historyLoc);

	            nowmarker = new google.maps.Marker({
                    position: pos,
                    map: map,
                    icon: 
	                    {
	    					url : image,
	    					scaledSize: new google.maps.Size(45, 45), // scaled size
	    				}
                });  
            	nowmarker.setMap(map);
			    map.setCenter(pos);
			    map.panTo(pos);
			}
		});
	}
  </script> 
  
</head>

<body class="preload">
<jsp:include page="../menuBarNo.jsp" /> 
<section class="single-product-desc">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12" style="flex: 0 0 60%; max-width:45%; margin-left: 50px;">
                    <div class="item-preview" sytle="heigth:60%;">
								<div id="playerElement" style="width:65; height:0; padding:0 0 65% 0"></div>
  								 <div id="myElement"></div>
		                        
		                        <div class="item-preview">
		                        	    <div id="map">
		                        	    </div>
		                        </div>
                    </div><!-- ends: .item-preview-->
                </div><!-- ends: .col-md-8 -->
                
                <div class="col-lg-4 col-md-12" style="flex: 0 0 40%; max-width:40%;">
                    <aside class="sidebar sidebar--single-product">
                        <div class="sidebar-card card-pricing">
	                        <div class="s_chathead">
	                    	 <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/sitter/${res.st_id}.png" 
	                    	 alt="" class="s_img_chatsitter img-fluid rounded-circle ">
                            <div style="display:inline-block; margin-top:10px;">
                            <h4 >${res.st_id}</h4>
                            	<p class="subtitle">予約日 ${res.res_start}</p>
	                        </div>
	                        </div>
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
</body>

</html>