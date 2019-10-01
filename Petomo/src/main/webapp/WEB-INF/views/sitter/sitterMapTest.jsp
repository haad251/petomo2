<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASEJ-WyBnN_SJbqsGUQpfMgLXWMjeTixI&callback=initMap"async defer></script>
  	
  	
<title>Insert title here</title>
<script>
    $(function(){
        var map, infoWindow;

        
    	alert("SSS");
    	map = new google.maps.Map(document.getElementById('sittermap'), {
    		center: {lat: -34.397, lng: 150.644},
            zoom: 15
          });
          infoWindow = new google.maps.InfoWindow;
    	
    	
    	
// 	google.maps.event.addListener(marker, "click", function (event) {
//     var latitude = event.latLng.lat();
//     var longitude = event.latLng.lng();
//     console.log( latitude + ', ' + longitude );

//     radius = new google.maps.Circle({map: map,
//         radius: 100,
//         center: event.latLng,
//         fillColor: '#777',
//         fillOpacity: 0.1,
//         strokeColor: '#AA0000',
//         strokeOpacity: 0.8,
//         strokeWeight: 2,
//         draggable: true,    // Dragable
//         editable: true      // Resizable
//     });

//     // Center of map
//     map.panTo(new google.maps.LatLng(latitude,longitude));

// }); //end addListener
    });

</script>

</head>
<body>
    <div id="sittermap"></div>

</body>
</html>