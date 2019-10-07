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
 
<!--  구글맵 키 없음-->
 
 
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
			  
			  $("#notibell").mouseover(function(){
					stompClient.send('/app/noti/'+"${sessionScope.sessionId}"+'/selectNoti', {}, 
							JSON.stringify({'id': "${sessionScope.sessionId}"}));
				});
			  
  });
  
/* 스트리밍 시작 및 스트리밍 종료 버튼 스크립트 */ 
  $(function(){
		$("#streamingStart").on("click",function(){
			var memberid = "${res.mb_id}";
			$.ajax({
				url: 'streamingStart',
				type: 'GET',
				data:{
					"mb_id" : memberid
					},
				success: function startStream(resp){
					if(resp.length == 0){
						alert("エラー発生");
						return false;
					}
					else{
						alert("ストリーミングが始まりました。");
						return false;
					}
				}
				}); 
		
			});
		$("#streamingEnd").on("click",function(){
			var memberid = "${res.mb_id}";
			$.ajax({
				url: 'streamingEnd',
				type: 'GET',
				data:{
					"mb_id" : memberid
					},
				success: function startStream(resp){
					if(resp.length == 0){
						alert("エラー発生");
						return false;
					}
					else{
						alert("ストリーミングが終わりました。");
						return false;
					}
				}
				}); 
		
			});
	});
  /* 여기까지 스트리밍 시작및 스트리밍 종료 버튼 스크립트 */
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	
	<script>
	
    var map, infoWindow;
    var markerPosition;
    var action = "nothing"; // 버튼이 눌릴때 action 값 생성 기본은 아무것도 하지 않은
    var currLat=.0; //현재 위도(Latitude)
    var currLng=.0; // 현재 경도 (Longitude)
    var historyLoc = new Array(); // 지금까지의 경로를 polyline으로 그리기 위한 배열s
    var watchID;
    
    $(function(){
    
        //시터 - 화면을 로딩하자마자 본인의 위치가 파악가능
        //고객 - 본인의 위치가 아닌 돌봄이 이뤄지고 있는 장소를 중심으로 봐야한다.
        
  	  $(document).on("click","#startWalking",function(){
  		 alert("동작중");
  		 alert(currLat);
  		 setLocData();
  	  });
  	  
  	  $(document).on("click","#loc_action",function(){
  		  loc_action = $(this).attr("value");
  		  action = loc_action;
 		  alert(currLat); //작동 잘 되는지 확인
 		  alert(action);
 		  setLocData(); //현재 위치와 action을 ajax로 DB에 넣기
  	  });
  	
	  $(document).on("click","#stopWalking",function(){
  		  alert("동작중");
  		  setLocData();
  		  stopWatch();
  	  });
  
	  initMap(); // 지도 부르기
	  
    });
 
    // 구글 초기 지도 (시터 입장)  - watchPosition으로 자동으로 위치가 변경됨
 	function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
        infoWindow = new google.maps.InfoWindow;
        
        // 모든 지도 데이터 가져와서 마크 찍어주기
        allLocData();
        
        
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
        	watchID =  navigator.geolocation.watchPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            
            //실시간으로 바뀌는 위치를 반영(action이나 start, stop버튼 누를때 위치 확인)
            currLat = position.coords.latitude; 
            currLng = position.coords.longitude;
            
            infoWindow.setPosition(pos);
            infoWindow.setContent('현재 위치!'); //예약한 회원의 강아지 프로필 사진이 보이도록 하면 좋을듯
            infoWindow.open(map);
            
            map.setCenter(pos);
            map.panTo(pos); //실시간 위치에 따른 지도 이동
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
        
     }
    
	
	// 위치 정보를 DB에 넣음
	function setLocData(){
		$.ajax({
			url:"setWalkingLoc"
			,type:"post"
			,data:{
				loc_lat:currLat
				,loc_long:currLng
				,res_id:"${res.res_id}"
				,loc_action:action
			}
			,success:function(serverData){
				if(serverData == 1){
					alert("현재 위치 정보가 저장되었습니다.");
				}
				else
					alert("현재 위치 정보가 저장 실패되었습니다.");
			}
		});
	}
	
	//DB에 저장된 모든 지역 정보 불러와서 지도 전체에 마크랑 패스 찍어주기
	function allLocData(){
		$.ajax({
			url:"allLocData"
			,type:"post"
			,data:{
				res_id:"${res.res_id}"
			}
			,success:function(serverData){
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
					else if(serverData[i].loc_action == "pee")
						urlRoot = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/pee.png';
					else if(serverData[i].loc_action == "meetFriends")
						urlRoot = 'https://scitpet.s3.ap-northeast-2.amazonaws.com/main/meetFriends.png';
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
							scaledSize: new google.maps.Size(50, 50), // scaled size
						    origin: new google.maps.Point(0,0), // origin
						    anchor: new google.maps.Point(0, 0) // anchor
						}
					});
					
				
				}
		        
				// 패스 데이터 잘 들어 갔는지 확인
				console.log(historyLoc);
				
			
			}
		});
	}
	
	// 실시간 위치 추적 중단
	function stopWatch() {
	  console.log(watchID);
	  if (watchID != null) {
          navigator.geolocation.clearWatch(watchID);
          watchID = null;
          
          if (infoWindow != null) {
        	  infoWindow.close();
          }
      }
	  console.log(watchID);
	}
    </script>
  
  
  
  
</head>

<body class="preload">
<jsp:include page="../menuBarNo.jsp" /> 
<section class="single-product-desc">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-12" style="flex: 0 0 40%; max-width:100%;">
	                        <div class="chat_area--conversation" >
			                 	<div class="conversation" id="chatForm" style = "height : 200px;">
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
						<button id="startWalking">start walking</button>
						<button id="loc_action" name="loc_action" value="poop">poop</button>
						<button id="loc_action" name="loc_action" value="pee">pee</button>     
						<button id="loc_action" name="loc_action" value="meetFriends">meet friends</button>     
						<button id="loc_action" name="loc_action" value="water">water</button>
						<button id="stopWalking">stop walking</button>
						<div id="map" style= "height:280px; width:344px;"></div>
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
    <script src="theme_assets/js/map.js"></script>
    <!-- endinject-->
</body>

</html>