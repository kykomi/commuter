var ci = ci || {};
ci.detail = ci.detail || {};
ci.detail.renderSummary = function() {
    $.getJSON("./lintsummary.json", function(data){
        console.log(data);
        for (i = 0; i < data.length; i++) {
            console.log(i);
        }
    })
}

$(document).ready( function() {
    ci.detail.renderSummary();
});

