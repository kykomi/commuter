window.onload = function() {
    var ctx = document.getElementById("myChart").getContext("2d");
    var ciResult = ci.csvToGraphSource("count.csv");
    var data = {
        labels: ciResult.labels,
        datasets: [
            {
                label: "Errors",
                fillColor: "rgba(240,20,20,0.2)",
                strokeColor: "rgba(240,20,20,1)",
                pointColor: "rgba(255,3,3,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: ciResult.errorData
            },
            {
                label: "Warnings",
                fillColor: "rgba(250,210,20,0.2)",
                strokeColor: "rgba(250,210,20,1)",
                pointColor: "rgba(255,180,5,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: ciResult.warningData
            }
        ]
    };
    var myChart = new Chart(ctx).Line(data, ci.graphOptions());
    $('#commuter_error').text(ciResult.latestErrorCount);
    $('#commuter_warning').text(ciResult.latestWarningCount);
}

var ci = ci || {};
/**
 *  return graph datasource object
 * 
 *  properties
 *    - label: String
 *    - labels: Array Of String 
 *    - errorData: Array Of Number
 *    - warningData: Array Of Number
 */  
ci.csvToGraphSource = function(path) {    
    var data = new XMLHttpRequest();
    data.open("GET", path, false);
    data.send(null);
    
    var LF = String.fromCharCode(10);
	var lines = data.responseText.split(LF);
    var labels = Array()
    var errorData = Array()
    var warningData = Array()
	for (var i = 0; i < lines.length; ++i) {
		var cells = lines[i].split(",");
		if( cells.length == 2 ) {
            labels.push("");
			errorData.push(cells[0]);
            warningData.push(cells[1]);
		}
	}   
	return {
        label: path,
        labels: labels,
        errorData: errorData,
        warningData: warningData,
        latestErrorCount: errorData[errorData.length - 1],
        latestWarningCount: warningData[warningData.length - 1]
    } 
}

ci.graphOptions = function() {
    return {
        responsive : true,
    }
}