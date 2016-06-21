$(document).ready(function () {
    $("#category").change(function () {
        $("select option:selected").each(function () {
            var value = $(this).text();
            var message = "You have selected " + value;
            $('#selection').html(message);
        });
    })
});
