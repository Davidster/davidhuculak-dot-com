$( document ).ready(function() {

    $(".label").on("click", function() {
        $("#hey-thats-pretty-good").text($(this).text());
    });

    $("#personal-image").on("click", function() {
        window.open("https://plus.google.com/u/0/108745335875684184968");
    });

});