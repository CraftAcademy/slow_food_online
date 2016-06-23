$(document).ready(function () {
    $("#category").change(function () {
        $("select option:selected").each(function () {
            var value = $(this).text();
            var message = value + " joints near you";
            $('#selection').html(message);
        });
        $('#list').html('');
        var cat = $('#category option:selected').val();
        $.ajax({
            dataType: "json",
            url: '/search_restaurants?category=' + cat,
            success: function (response) {
                displayMatches(response);
            }
        });
    });
});


function displayMatches(json) {
    if (json.matches.length === 0) {
        $('#list').html('<h4>No matches were found</h4>');
    } else {
        var list = $("#list").append('<ul></ul>').find('ul');
        $.each(json.matches, function (i, val) {
            console.log(val);
            list.append("<li><a href='/restaurants/" + val.id + "'>" + val.name + "</a></li>");
        });
        var count = $('#list ul').children("li").length;
        var height = count * 80 + 'px';
        modifyPage(height);
    }
}

function modifyPage(height) {

    $('#results').css('height', height).css('z-index','10');

}
