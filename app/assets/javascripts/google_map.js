function initMap() {
  var mapDiv = document.getElementById('map');
  var map = new google.maps.Map(mapDiv, {
    center: {lat: 59.3293235, lng: 18.0685808}, zoom: 8
  });
}
