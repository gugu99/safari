/**
 * 
 */
 
 var $primary = "#00b5b8",
  $secondary = "#2c3648",
  $success = "#0f8e67",
  $info = "#179bad",
  $warning = "#ffb997",
  $danger = "#ff8f9e"

var $themeColor = [$primary, $success, $warning, $info, $danger, $secondary]
 
 var pieDonutSimpleChart = {
  chart: {
    height: 350,
    type: 'donut',
  },
  series: [44, 55, 41, 17, 15],
  responsive: [{
    breakpoint: 1200,
    options: {
      chart: {
        width: 300
      },
      legend: {
        position: 'bottom'
      }
    }
  }, {
    breakpoint: 768,
    options: {
      chart: {
        width: 520
      },
      legend: {
        position: 'right'
      }
    }
  }, {
    breakpoint: 620,
    options: {
      chart: {
        width: 450
      },
      legend: {
        position: 'right'
      }
    }
  }, {
    breakpoint: 480,
    options: {
      chart: {
        width: 250
      },
      legend: {
        position: 'bottom'
      }
    }
  }],
  fill: {
    colors: $themeColor
  }
}

 
 // Initializing Pie Donut Simple Chart
var pie_donut_simple_chart = new ApexCharts(
  document.querySelector("#pie-donut-simple-chart"),
  pieDonutSimpleChart
);
pie_donut_simple_chart.render();
