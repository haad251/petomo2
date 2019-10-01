<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<!-- <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> -->

 <script>
  function initialize() {
   var myLatlng = new google.maps.LatLng(-34.397,150.644);
   var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  }
 </script>

<script>
$(function(){
	initialize();
	
	
	google.maps.event.addListener(marker, "click", function (event) {
	    var latitude = event.latLng.lat();
	    var longitude = event.latLng.lng();
	    console.log( latitude + ', ' + longitude );

	    radius = new google.maps.Circle({map: map,
	        radius: 100,
	        center: event.latLng,
	        fillColor: '#777',
	        fillOpacity: 0.1,
	        strokeColor: '#AA0000',
	        strokeOpacity: 0.8,
	        strokeWeight: 2,
	        draggable: true,    // Dragable
	        editable: true      // Resizable
	    });

	    // Center of map
	    map.panTo(new google.maps.LatLng(latitude,longitude));

	}); //end addListener
	
});


</script>
</head>
<body>
	      <div id="map_canvas"style="width:500px; height:300px; margin: auto;"></div>
</body>
</html>