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

            switch(page){
                case "home":
                    onLoadHome();
                    break;
                case "sms-replier":
                    onLoadSmsReplier();
                    break;
                case "ant-colony-optimization":
                    onLoadACO();
                    break;
                case "celluscope":
                    onLoadCelluscope();
                    break;
                case "myostro":
                    onLoadMyostro();
                    break;
		case "resume":
                    onLoadResume();
                    break;
            }
        };
        xhr.send();
    }
});

function printDots(){
    setTimeout(function(){
        if(printingDots){
            $("#response-container").append(". ");
            printDots();
        }
    }, 1000);
}

function onLoadHome() {

    console.log("onLoadHome");

    var oReq = new XMLHttpRequest();
    oReq.addEventListener("load", function(){
        console.log(this.responseText);
        $("#response-container").append(this.responseText);
        printingDots = false;
    });
    oReq.open("GET", "http://davidhuculak.me/api");
    oReq.send();

    printingDots = true;
    printDots();

}

function onLoadSmsReplier() {
    console.log("onLoadSmsReplier");
}

function onLoadACO() {
    console.log("onLoadACO");
}

function onLoadCelluscope() {
    console.log("onLoadCelluscope");
}

function onLoadMyostro() {
    console.log("onLoadMyostro");
}
function onLoadResume() {
    console.log("onLoadResume");
}
