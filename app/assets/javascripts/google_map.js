function initMap() {
    var mapDiv = $('#map')[0];
    var map = new google.maps.Map(mapDiv, {
        center: {lat: 59.3293235, lng: 18.0685808},
        zoom: 12,
        styles: styles,
        zoomControl: true,
        disableDefaultUI: true
    });

    var infoWindow = new google.maps.InfoWindow({map: map});

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('You are here.');
            map.setCenter(pos);
        }, function () {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        handleLocationError(false, infoWindow, map.getCenter());
    }
    var input = $('#pac-input')[0];
    var searchBox = new google.maps.places.SearchBox(input);

    map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds());
    });

    var markers = [];
    searchBox.addListener('places_changed', function () {
        var places = searchBox.getPlaces();
        infoWindow.close();

        if (places.length == 0) {
            return;
        }

        markers.forEach(function (marker) {
            marker.setMap(null);
        });
        markers = [];

        var bounds = new google.maps.LatLngBounds();
        places.forEach(function (place) {
            var icon = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(25, 25)
            };

            markers.push(new google.maps.Marker({
                map: map,
                icon: icon,
                title: place.name,
                position: place.geometry.location
            }));

            if (place.geometry.viewport) {
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
        'Error: The Geolocation service failed.' :
        'Error: Your browser doesn\'t support geolocation.');
}


var styles = [
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {"color": "#62a905"}
        ]
    }, {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {"color": "#F9F9F9"}
        ]
    }, {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {"weight": 0.5}
        ]
    }, {
        "featureType": "road.arterial",
        "elementType": "geometry.stroke",
        "stylers": [
            {"weight": 0.5}
        ]
    }, {
        "featureType": "road.local",
        "elementType": "geometry.stroke",
        "stylers": [
            {"weight": 0.2}
        ]
    }, {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {"weight": 0.1},
            {"color": "#362009"}
        ]
    }, {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
            {"visibility": "off"}
        ]
    }, {
        "featureType": "landscape",
        "elementType": "geometry.fill",
        "stylers": [
            {"color": "#EEEEEE"}
        ]
    }, {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {"visibility": "off"}
        ]
    }, {
        "featureType": "poi",
        "elementType": "labels",
        "stylers": [
            {"visibility": "off"}
        ]
    }
];
