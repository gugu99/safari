/*=========================================================================================
    File Name: line-logarithmic.js
    Description: Chartjs simple line chart
    ----------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Line Logarithmic chart
// ------------------------------
$(window).on("load", function(){
	//Get the context of the Chart canvas element we want to select
		    var ctx = $("#line-logarithmic");
		
		    var chartOptions = {
		        responsive: true,
		        maintainAspectRatio: false,
		        title:{
		            display:true,
		            text:'Chart.js Line Chart - Logarithmic'
		        },
		        scales: {
		            xAxes: [{
		                display: true,
		                gridLines: {
		                    color: "#f3f3f3",
		                    drawTicks: false,
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString: 'x axis'
		                }
		            }],
		            yAxes: [{
		                display: true,
		                gridLines: {
		                    color: "#f3f3f3",
		                    drawTicks: false,
		                },
		                type: 'logarithmic',
		                scaleLabel: {
		                    display: true,
		                    labelString: 'y axis'
		                }
		            }]
		        }
		    };
		    
		
	
	$.ajax({
		type : 'get',
		url : '/member/projectSummaryChart',
		success : function(json){
			const date = new Array();
			const finishedTaskCnt = new Array();
			const taskCnt = new Array();
	
			// console.log(json);
			
			$(json).each(function(index, item){
				console.log("item.taskPerDate[0]: " + item.taskPerDate[0].date);
				
				for(let i = item.taskPerDate.length - 1; i >= 0; i--){
					date.push(item.taskPerDate[i].date);
					taskCnt.push(item.taskPerDate[i].taskCnt);
					finishedTaskCnt.push(item.taskPerDate[i].finishedTaskCnt)
				}
			});
			
			// console.log("date: " + date);
			// console.log("taskCnt: " + taskCnt);
			
		    var chartData = {
		        labels: date,
		        datasets: [{
		            label: "완료한 업무",
		            data: finishedTaskCnt,
		            fill: false,
		            borderDash: [5, 5],
		            backgroundColor: "#FFF",
		            borderColor: "#FF5722",
		            pointRadius: 4,
		        }, {
		            label: "추가된 업무",
		            data: taskCnt,
		            backgroundColor: "rgba(22,211,154,.5)",
		            borderColor: "transparent",
		            pointBorderColor: "#16D39A",
		            pointBackgroundColor: "#FFF",
		            pointBorderWidth: 2,
		            pointHoverBorderWidth: 2,
		            pointRadius: 4,
		        }]
		    };
		    
		    var config = {
		        type: 'line',
		
		        // Chart Options
		        options : chartOptions,
		
		        // Chart Data
		        data : chartData
		    };
		
		    // Create the chart
		    var logarithmicChart = new Chart(ctx, config);
					
		},
		error : function(error) {
				console.log("Error!");
		}
		
	});

    
});