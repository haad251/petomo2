<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">


	<meta charset="UTF-8">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <script>
  
  $(window).on("load",function(){
// 		소켓
		var socket = new SockJS('/websocket');   //서버에 올릴때는 /petomo/websocket!!!!
		stompClient = Stomp.over(socket);  
		stompClient.connect({}, function() { 
			  stompClient.subscribe('/topic/noti', function(msg) { 
				  alert("dz");
// 				  var data = JSON.parse(msg.body);
// 				  var str = '';
// 					  str += data.chat_date + '</p></div>';    
// 		        $("#chatForm").append(str);
			  });
		});
		
		 $("#testbtn").click(function() {
	    	  var content='testing now';
	    	  var mb_id = 
	    	  stompClient.send('/app/noti', {}, JSON.stringify({
	    		  'not_message':content}));
		  });
		
  });
  </script>


 <script>
//   function initialize() {
//    var myLatlng = new google.maps.LatLng(-34.397,150.644);
//    var mapOptions = {
//         zoom: 17,
//         center: myLatlng,
//         mapTypeId: google.maps.MapTypeId.ROADMAP
//    }
//    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
//   }
 </script>

<script>
// $(function(){
// 	initialize();
	
	
// 	google.maps.event.addListener(marker, "click", function (event) {
// 	    var latitude = event.latLng.lat();
// 	    var longitude = event.latLng.lng();
// 	    console.log( latitude + ', ' + longitude );

// 	    radius = new google.maps.Circle({map: map,
// 	        radius: 100,
// 	        center: event.latLng,
// 	        fillColor: '#777',
// 	        fillOpacity: 0.1,
// 	        strokeColor: '#AA0000',
// 	        strokeOpacity: 0.8,
// 	        strokeWeight: 2,
// 	        draggable: true,    // Dragable
// 	        editable: true      // Resizable
// 	    });

// 	    // Center of map
// 	    map.panTo(new google.maps.LatLng(latitude,longitude));

// 	}); //end addListener
	
// });


</script>
</head>
<body>
<div id="map_canvas"style="width:500px; height:300px; margin: auto;"></div>
<button id="testbtn">dd</button>
</body>
</html>