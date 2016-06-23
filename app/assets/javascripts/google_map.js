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

function addUser(lat, lng) {
    map.addMarker({
        lat: lat,
        lng: lng,
        title: 'You are here',
        click: function(e) {
            alert('You clicked in this marker');
        }
    });
}

function addRestaurantMarkers(data){
    console.log(data);
    data.forEach(function(rest){
        map.addMarker({
            lat: rest.latitude,
            lng: rest.longitude,
            title: rest.name,
            click: function(e) {
                alert('You clicked in this marker');
            }
        });
    })
}