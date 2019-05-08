// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
// [4215, 5312, 6251, 7841, 9821, 14984]
var hotGoods = [];
var tempStr = document.getElementById("hotGoods").value;
tempStr = tempStr.replace('[','');
tempStr = tempStr.replace(']','');
var strArray = tempStr.split(",");
for(var i=0;i<strArray.length;i++){
    hotGoods.push(strArray[i]);
}
// hotGoodes = eval(tempStr);
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["跑步机", "自用壶铃", "支链氨基酸", "硬拉腰带", "即食鸡胸"],
    datasets: [{
      label: "Top5",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: hotGoods,
    }],
  },
  options: {
    scales: {
      xAxes: [{
        names: {
          unit: 'goods'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 5
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 15000,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
