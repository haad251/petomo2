<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
  
    <style>
      #map {
        height: 100%;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	
	<script>
	
    var map, infoWindow;
    var markerPosition;
    var lastLat=.0; //마지막 위도(Latitude)
    var lastLng=.0; //마지막 경도 (Longitude)   
 	var historyLoc = new Array(); // 지금까지의 경로를 polyline으로 그리기 위한 배열s
    var watchID;
    var pos;
    
    $(function(){
    
  	
	  initMap(); // 지도 부르기
	  
    });
 
 	function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
        infoWindow = new google.maps.InfoWindow;
        
        // 모든 지도 데이터 가져와서 마크 찍어주기
        allLocData();
        
        //console.log(lastLat);
        
       /*  lastLocData();
        
        pos = {
                lat: lastLat,
                lng: lastLng
        };
        
        
              
        infoWindow.setPosition(pos);
        infoWindow.setContent('현재 위치!'); //예약한 회원의 강아지 프로필 사진이 보이도록 하면 좋을듯
        infoWindow.open(map);
        map.setCenter(pos); */
     }

	
	//DB에 저장된 모든 지역 정보 불러와서 지도 전체에 마크랑 패스 찍어주기
	function allLocData(){
		$.ajax({
			url:"allLocData"
			,type:"post"
			,data:{
				res_id:'res1'
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
				        strokeColor: "#6E4FF6",
				        strokeOpacity: 0.8,
				        strokeWeight: 5
				     });
				      
					walkingPath.setMap(map);
					
				
					//각 action별 icon이 있는 파일 표시를 위한 변수 명명
					var urlRoot ;
					
					if(serverData[i].loc_action == "poop")
						urlRoot = 'img/poop.png';
					else if(serverData[i].loc_action == "pee")
						urlRoot = 'img/pee.png';
					else if(serverData[i].loc_action == "meetFriends")
						urlRoot = 'img/meetFriends.png';
					else if(serverData[i].loc_action == "water")
						urlRoot = 'img/water.png';
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
				 
				infoWindow.setPosition(pos);
			    infoWindow.setContent('현재 위치!'); //예약한 회원의 강아지 프로필 사진이 보이도록 하면 좋을듯
			    infoWindow.open(map);
			    map.setCenter(pos);
			
			}
		});
	}
	
    </script>
</head>
<body>
    <div id="map"></div>
	 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASEJ-WyBnN_SJbqsGUQpfMgLXWMjeTixI&callback=initMap"async defer></script>
  </body>
</html>