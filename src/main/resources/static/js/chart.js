$(function() {

  var dataChart = [];
  var labelChart = [];

  for(var i=0;i<list.length;i++) {
    dataChart.push(list[i].totalWatch);
    labelChart.push(list[i].nameBrand);
  }
  var doughnutPieData = {

    datasets: [{
      data: dataChart,
      backgroundColor: [
        'rgba(255,0,0,0.7)',
        'rgba(0,149,255,0.7)',
        'rgba(255,203,0,0.8)',
        'rgba(26,255,2,0.7)',
        'rgba(153, 102, 255, 0.8)',
        'rgba(255, 159, 64, 0.8)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgb(81,238,81)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)'
      ],
    }],

    labels: labelChart
  };

  var doughnutPieOptions = {
    responsive: true,
    animation: {
      animateScale: true,
      animateRotate: true
    }
  };
  if ($("#barChart").length) {
    var barChartCanvas = $("#barChart").get(0).getContext("2d");
    var barChart = new Chart(barChartCanvas, {
      type: 'polarArea',
      data: doughnutPieData,
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true,
            }
          }]
        }
      },
    });
  }
  if ($("#doughnutChart").length) {

    var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
    var doughnutChart = new Chart(doughnutChartCanvas, {
      type: 'doughnut',
      data: doughnutPieData,
      options: doughnutPieOptions
    });
  }
});
