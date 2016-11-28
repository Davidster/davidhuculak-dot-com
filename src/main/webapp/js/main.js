/**
 * Created by David Huculak on 2016-11-28.
 */
printingDots = true;

$( document ).ready(function() {

    console.log("calling api");

    function reqListener () {
        console.log(this.responseText);
        $("#response-container").append(this.responseText);
        printingDots = false;
    }

    var oReq = new XMLHttpRequest();
    oReq.addEventListener("load", reqListener);
    oReq.open("GET", "http://138.197.6.26:8080/mywebsite/api");
    oReq.send();

    printDots();

});

function printDots(){
    setTimeout(function(){
        if(printingDots){
            $("#response-container").append(". ");
            printDots();
        }
    }, 1000);
}