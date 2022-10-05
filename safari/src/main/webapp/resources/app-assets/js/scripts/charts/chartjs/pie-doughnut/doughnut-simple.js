/*=========================================================================================
    File Name: doughnut.js
    Description: Chartjs simple doughnut chart
    ----------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Doughnut chart
// ------------------------------
$(window).on("load", function(){

    //Get the context of the Chart canvas element we want to select
    var ctx = $("#simple-doughnut-chart");

    // Chart Options
    var chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        responsiveAnimationDuration:500,
    };

	// 도넛차트 ----------------------------------------------------------------
    // Chart Data
    
    console.log($('#taskPoint').val());
    var chartData = {
        labels: ["0", "1", "2", "3", "4", "5"],
        datasets: [{
            label: "My First dataset",
            data: [$('#taskPoint').val(), $('#taskPoint1').val(), $('#taskPoint2').val(), $('#taskPoint3').val(), $('#taskPoint4').val(), $('#taskPoint5').val()],
            backgroundColor: ['#00A5A8', '#626E82', '#FF7D4D','#FF4558', '#16D39A', '#FFA500'],
        }]
    };

    var config = {
        type: 'doughnut',

        // Chart Options
        options : chartOptions,

        data : chartData
    };

    // Create the chart
    var doughnutSimpleChart = new Chart(ctx, config);

});