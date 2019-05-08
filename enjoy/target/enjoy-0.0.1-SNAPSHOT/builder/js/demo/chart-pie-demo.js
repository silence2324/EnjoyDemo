// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
//["<20岁", "21~35岁", "36~55岁", ">55岁"]
var pieLabels = [];
var pieData = [];
var strtemp = document.getElementById("agePie").value;
strtemp = strtemp.replace("[","");
strtemp = strtemp.replace("]","");
var reg1 = new RegExp("total=","g");
strtemp = strtemp.replace(reg1,"");
var reg2 = new RegExp("age_temp=","g");
strtemp = strtemp.replace(reg2,"");
var reg3 = new RegExp("{","g");
strtemp = strtemp.replace(reg3,"");
var reg4 = new RegExp("}","g");
strtemp = strtemp.replace(reg4,"");
var reg5 = new RegExp(" ","g");
strtemp = strtemp.replace(reg5,"");
var strArray = strtemp.split(",");
for(var i=0;i<strArray.length;i++){
  i%2==0?pieData.push(strArray[i]):pieLabels.push(strArray[i]+"岁");
}
console.log(pieLabels);
console.log(pieData);
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: pieLabels,
    datasets: [{
      data: pieData,
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
    }],
  },
});
