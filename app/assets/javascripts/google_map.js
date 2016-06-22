function initMap() {
    var mapDiv = $('#map')[0];
    var map = new google.maps.Map(mapDiv, {
        center: {lat: 59.3293235, lng: 18.0685808},
        zoom: 12,
        styles: styles,
        zoomControl: true,
        disableDefaultUI: true
    });
    //addMarkers(i, marker_data);
}
var marker_data = [{
    name: 'test',
    lat: 59.3293235,
    lng: 18.0685808
}];

var addMarkers = function (i, marker_data) {
    console.log(marker_data[i]);
    map.addMarker({
        category: 'charity',
        lat: marker_data[i].lat,
        lng: marker_data[i].lng,
        animation: google.maps.Animation.DROP,
        infoWindow: infoWindowDisplay(marker_data[i].name),
        click: function (event) {
            this.infoWindow.open(this.map, this);
            $('.search-box').fadeOut(1000);
        }
    });
};

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
