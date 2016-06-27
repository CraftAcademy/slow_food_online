$(document).ready(function () {
    $("#category").change(function () {
        $('#list').html('');
        $('#selection').html('');

        $("select option:selected").each(function () {
            var value = $(this).text();
            var message = value + " joints near you";
            $('#selection').html('<h3>' + message + '</h3>');
        });
        queryForRestaurants();
    });
});


function displayMatches(json) {
    if (json.matches.length === 0) {
        $('#list').html('<h4>No matches were found</h4>');
    } else {
        var list = $("#list").append('<ul></ul>').find('ul');
        $.each(json.matches, function (i, val) {
            list.append("<li><a href='/restaurants/" + val.id + "'>" + val.name + "</a>");
            list.append("<img src='https://placeholdit.imgix.net/~text?txtsize=12&txt=" + val.name + "&w=150&h=100'>");
            list.append("<p>" + val.description + "<br/>");
            list.append("<small>" + val.address + ", Phone:" + val.phone + "</small></p>");
            list.append("</li>");
        });
        var count = $('#list ul').children("li").length;
        var height = count * 230 + 'px';
        modifyPage(height);
        addRestaurantMarkers(json.matches);
    }
}


function modifyPage(height) {
    //$('#results').css('height', height);
    $('#results').css('min-height', height)
        .css('z-index', '10')
        .css('margin-bottom', '50px');
}

function queryForRestaurants () {
    var cat = $('#category option:selected').val();
    var center = map.getCenter();
    $.ajax({
        dataType: "json",
        url: '/search_restaurants?category=' + cat + '&lat=' + center.lat() + '&lng=' + center.lng() ,
        success: function (response) {
            displayMatches(response);
        }
    });
}