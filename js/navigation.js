var printingDots = true;

$( document ).ready(function() {

    setPage("home");

    $(".clickable").on("click", function() {
        var page = $(this).attr("page");
        setPage(page);
    });

    $("#personal-image, #nav-header .fa-user-circle").on("click", function() {
        setPage("home");
        // window.open("https://plus.google.com/u/0/108745335875684184968");
    });

    function setPage(page) {
        var xhr= new XMLHttpRequest();
        xhr.open("GET", "pages/" + page + ".html", true);
        xhr.onreadystatechange= function() {
            if (this.readyState!==4) return;
            if (this.status!==200) return; // or whatever error handling you want
            $("#page-content").html(this.responseText);
        };
        xhr.send();
    }
});
