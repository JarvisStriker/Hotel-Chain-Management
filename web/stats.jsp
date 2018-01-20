<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <link rel="icon" type="image/png" href="Photos/logo.png">
  <title>Kushal Group of Hotels</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="Stylize/css/style.css">
  <link rel="stylesheet" href="Stylize/css/newStyle.css">
  <link rel="stylesheet" href="Stylize/css/newStyle-theme.css">
  <script src="Stylize/js/newStyle.js"></script>
  <script src="Stylize/js/jquery-3.2.1.js"></script>
  <script src="Stylize/js/Chart.js"></script>
</head>


<nav class="navbar navbar-inverse navbar-static-top">
  <div class="container-fluid">
    <div class="navbar-header"> 
        <a class="navbar-brand" href="#">
          	<img width="45px" style="margin-top: -7px;" src="./Photos/whiteLogo.png" alt="KGH">      
        </a>
    </div>
    <p class="navbar-text" style="color: white;">Kushal Group of Hotels - Statistics</p>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="javascript:history.go(-1)" style="color: white;"><span class="glyphicon glyphicon-arrow-left"></span> &nbsp; Go Back</a></li>
    </ul>
  </div>
</nav>

<% Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
String bm="",eva="",rad="";
int flag=0;
ResultSet rs=st.executeQuery("select sum(amt) from history group by hotel order by hotel asc"); 
while(rs.next())
{
    if(flag==0){
        bm=rs.getString("sum(amt)");
        flag++;
        continue;
    }
    if(flag==1){
        eva=rs.getString("sum(amt)");
        flag++;
        continue;
    }
    if(flag==2){
        rad=rs.getString("sum(amt)");
        flag++;
        continue;
    }
}
%>
<canvas id="myChart" style="height: 90%; width: 40%;"></canvas>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Radiant", "Eva", "Blue Moon"],
        datasets: [{
            data: [<%=rad%>, <%=eva%>, <%=bm%>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',                
                'rgba(255, 206, 86, 0.2)',
                'rgba(54, 162, 235, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',               
                'rgba(255, 206, 86, 1)',
                'rgba(54, 162, 235, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        layout: {
            padding: {
                left: 100,
                right: 100,
                top: 10,
                bottom: 0
            }
        },
         legend: {
            display: false
           
        },
        title: {
            display: true,
            text: 'KGH Revenue for year 2017-2018'
        },
        scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true
            }
        }]
    }
        
        
    }
});
</script>
</html>
