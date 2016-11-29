$( document ).ready(function() {

    $(".label").on('click', function() {
        $("#hey-thats-pretty-good").text($(this).text());
    });

});