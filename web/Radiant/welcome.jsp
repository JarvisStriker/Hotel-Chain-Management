<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="icon" type="image/png" href="../Photos/whiteLogo.png">
  <title>Hotel Radiant</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../Stylize/css/style.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle.min.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle-theme.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle-theme.min.css">
  <link rel="stylesheet" href="../Stylize/css/bg_anim.css">
  <script src="../Stylize/js/newStyle.js"></script>
  <script src="../Stylize/js/jquery-3.2.1.js"></script>
  <script src="../Stylize/js/newStyle.min.js"></script>
  <style>
      
      body::-webkit-scrollbar { 
       display: none; 
      }
      
      .col-container {
    display: table; 
    width: 80%;
    border: 1px solid white;
        }

       .col {
            display: table-cell;
            padding: 30px 15px;
             border: 1px solid white;
        }
        .buttonCheckIn{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: white;
             padding: 14px 40px;
             color: black;
             font-size: 16px;
             border: 2px solid #4CAF50;
             border-radius: 4px;
         } 
          .buttonCheckIn:hover {
             background-color: #4CAF50;
             color: white;
              box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
         }
         .buttonCheckOut{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: white;
             padding: 14px 40px;
             color: black;
             font-size: 16px;
             border: 2px solid #950740;
             border-radius: 4px;
         } 
         .buttonCheckOut:hover {
             background-color: #950740;
             color: white;
              box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
         }
         .buttonServices{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: white;
             padding: 14px 40px;
             color: black;
             font-size: 16px;
             border: 2px solid #9400D3;
             border-radius: 4px;
         } 
         .buttonServices:hover {
             background-color: #9400D3;
             color: white;
              box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
         }
         
  </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-static-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="./welcome.jsp">
      	<img width="45px" style="margin-top: -7px;" src="../Photos/whiteLogo.png" alt="KGH">
      </a>
    </div>
    <p class="navbar-text" style="color: white;">Hotel Radiant</p>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="../stats.jsp" style="color: white;"><span class="glyphicon glyphicon-stats"></span> &nbsp; Statistics &nbsp; </a></li>  
      <li><a href="./history.jsp" style="color: white;"><span class="glyphicon glyphicon-list"></span> &nbsp; History &nbsp; </a></li>
      <li><a href="../index.html" style="color: white;"><span class="glyphicon glyphicon-log-out"></span> &nbsp; Logout</a></li>
    </ul>
  </div>
</nav>

<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from rooms_radiant"); 
int count = 0;
while (rs.next()) {
    ++count;
}
%>
    
    
<br>
<center>
<div class="jumbotron" style="width:80%; background-color: #950740; color: white; ">
    <h4> Rooms Available : </h4><br>
     <div class="col-container">
        
          <% 
         rs=st.executeQuery("select * from rooms_radiant where room_type like 'twin'"); 
         count = 0;
         while (rs.next()) {
            ++count;
        }
        %>
         
        <div class="col">
            <p style="font-size: 30px;"><% out.println(80-count); %></p><br>
            <p>Standard</p>
        </div>
         
          <% 
         rs=st.executeQuery("select * from rooms_radiant where room_type like 'king'"); 
         count = 0;
         while (rs.next()) {
            ++count;
        }
        %>
         
        <div class="col">
          <p style="font-size: 30px;"><% out.println(75-count); %></p><br>
            <p> King size </p>
        </div>
         
        <% 
         rs=st.executeQuery("select * from rooms_radiant where room_type like 'master suite'"); 
         count = 0;
         while (rs.next()) {
            ++count;
        }
        %>
        
        <div class="col">
          <p style="font-size: 30px;"><% out.println(30-count); %></p><br>
            <p>Master Suite</p> 
        </div>
      </div>
</div>
    <br>
    <a href="checkin.html">
        <button class="buttonCheckIn">Customer Check In</button></a>&nbsp;&nbsp;&nbsp;
    <a href="services.jsp">
        <button class="buttonServices">Customer Services</button></a>&nbsp;&nbsp;&nbsp;
    <a href="checkout.jsp">
        <button class="buttonCheckOut">Customer Check Out</button></a>

    <br><br><br>
    </center>
    

</body>
</html>
