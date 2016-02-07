window.onload = function() {
    var ctx = document.getElementById("myChart").getContext("2d");
    var ciResult = ci.csvToGraphSource("count.csv");
    console.log(ciResult);
    var data = {
        labels: ciResult.labels,
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: ciResult.errorData
            },
            {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: ciResult.warningData
            }
        ]
    };
    var myChart = new Chart(ctx).Line(data, {});
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
        warningData: warningData        
    } 
}  