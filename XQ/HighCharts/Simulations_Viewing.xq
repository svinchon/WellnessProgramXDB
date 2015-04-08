declare variable $doc external;
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Highcharts Example</title>
		<script type="text/javascript" src="http://xcp:8080/HighCharts/jQuery/jquery.min.js">//keep it</script>
		<script type="text/javascript">
$(function () {{
    $(document).ready(function() {{
    var C1 = new Highcharts.Chart({{
        chart: {{
			renderTo: 'container1',
            zoomType: 'x',
			width: 550,
			height: 270
		}},
        title: {{
            text: 'Impact of needed days above threshold on award count'
        }},
        subtitle: {{
            text: 'based on last 28 days statistics',
            x: -20
        }},
        xAxis: {{
            categories: [{
			fn:string-join(
				for $x in $doc/simulations/simulation/needed_days_impact_chart/item/needed_days
				return
				concat("'", string($x),"'"),",")
			}]
			,labels: {{
	            //rotation: 300
	            //,y:40                
        	}},
			title: {{
                text: 'Days Required'
            }},
			plotLines: [{{
				color: 'red', // Color value
				//dashStyle: 'longdashdot', // Style of the plot line. Default to solid
				//value: 1,
				value: {$doc/simulations/simulation/needed_days/text() - 1}, // (value/ max val /val count -1)
				width: 2 // Width of the line    
			}}],
			plotBands: [{{
				color: 'grey', // Color value
				from: -0.5,
				to: {$doc/simulations/simulation/needed_days/text() - 1}, // (value/ max val /val count -1)
			}}]
		}},
        yAxis: {{
            min: 0,
			title: {{
                text: 'Awards Count'
            }},
            //plotLines: [{{
            //    value: 0,
            //    width: 1,
            //    color: '#808080'
            //}}]
        }},
        tooltip: {{
            valueSuffix: ''
        }},
        legend: {{
            enabled: false
		}},
        /*legend: {{
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        }},*/
        series: [{{
			name: 'award count',
			data: [
				{string-join(
					for $x in $doc/simulations/simulation/needed_days_impact_chart/item/pam
					return
					string($x)
					,","
				)}
			]
		}}]
    }});
    var C2 = new Highcharts.Chart({{
        chart: {{
			renderTo: 'container2',
            zoomType: 'x',
			width: 550,
			height: 270
		}},
        title: {{
            text: 'Impact of threshold on award count'
        }},
        subtitle: {{
            text: 'based on last 28 days statistics',
            x: -20
        }},
        xAxis: {{
            categories: [{
			fn:string-join(
				for $x in $doc/simulations/simulation/threshold_impact_chart/item/threshold
				return
				concat("'", string($x),"'"),",")
			}]
			,labels: {{
	            //rotation: 300
	            //,y:40                
        	}},
			title: {{
                text: 'Index Required'
            }},
 			plotLines: [{{
				color: 'red', // Color value
				//dashStyle: 'longdashdot', // Style of the plot line. Default to solid
				value: {$doc/simulations/simulation/threshold/text() div 700 * 14 -1 }, // Value of where the line will appear
				//value: 3.2, // Value of where the line will appear
				width: 2 // Width of the line    
			}}],
			plotBands: [{{
				color: 'grey', // Color value
				from: -0.5,
				to: {$doc/simulations/simulation/threshold/text() div 700 * 14 -1 }, // (value/ max val /val count -1)
			}}]
       }},
        yAxis: {{
            min: 0,
			title: {{
                text: 'Awards Count'
            }},
       }},
        tooltip: {{
            valueSuffix: ''
        }},
        legend: {{
            enabled: false
		}},
		/*legend: {{
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        }},*/
        series: [{{
			name: 'award count',
			data: [
				{string-join(
					for $x in $doc/simulations/simulation/threshold_impact_chart/item/pam
					return
					string($x)
					,","
				)}
			]
		}}]
    }});
	}});
}});
		</script>
	</head>
	<body style="background-color: white">
<script src="http://xcp:8080/HighCharts/Highcharts-4.0.4/js/highcharts.js">//keep this</script>
<script src="http://xcp:8080/HighCharts/Highcharts-4.0.4/js/modules/exporting.js">//keep that</script>
<div id="content">
	<center>
	<div style="display: table-row">
		<div id="container1" style="display: table-cell; ">www</div>
		<div id="container2" style="display: table-cell; ">www</div>
	</div>
	</center>
</div>
	</body>
</html>