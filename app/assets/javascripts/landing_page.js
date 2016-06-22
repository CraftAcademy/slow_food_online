$(document).ready(function () {
    $("#category").change(function () {
        modifyPage();
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
        $.each(json.matches, function (i, val) {
            $('#list').append('<p>' + val.name + '</p>');
        });
    }
}

function modifyPage() {
    $('#results').css('height','auto');
}
