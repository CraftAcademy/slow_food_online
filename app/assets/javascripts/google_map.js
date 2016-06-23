function initMap() {
    var lat, lng, map;
    fetchBrowserLocation(function (data) {
        lat = data.lat;
        lng = data.lng;
        map = generateMap(lat, lng);
        addUser(lat, lng);
    });

}


var generateMap = function (latitude, longitude) {
    map = new GMaps({
        div: '#map',
        lat: latitude,
        lng: longitude,
        zoom: 12,
        zoomControl: true,
        disableDefaultUI: true
    });
};

function fetchBrowserLocation(callback) {
    navigator.geolocation.getCurrentPosition(function (position) {
        var browserCoordinates;
        browserCoordinates = {lat: position.coords.latitude, lng: position.coords.longitude};
        //console.log(browserCoordinates);
        callback(browserCoordinates);
    });
}
var gold_star = {
    path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
    fillColor: 'green',
    fillOpacity: 0.8,
    scale: 0.1,
    strokeColor: 'gold',
    strokeWeight: 1
};

function addUser(lat, lng) {
    map.addMarker({
        lat: lat,
        lng: lng,
        icon: gold_star,
        infoWindow: {
            content: '<p>You are here!</p>'
        }
    });
    // Center on users location
    //map.setCenter(lat, lng);
    // During dev let's center on Stockholm
    map.setCenter(59.3293235, 18.0685808);
}

function addRestaurantMarkers(data){
    console.log(data);
    data.forEach(function(rest){
        map.addMarker({
            lat: rest.latitude,
            lng: rest.longitude,
            title: rest.name,
            infoWindow: {
                content: getRestInfo(rest)
            }

        });
    })
}

function getRestInfo(object) {
    message = '<h4>' + object.name +'</h4>';
    message += '<p>' + object.address + '</p>';
    message += '<p>Phone: ' + object.phone + '</p>';
    return message;
}