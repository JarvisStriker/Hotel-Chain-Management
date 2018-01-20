<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="icon" type="image/png" href="../Photos/whiteLogo.png">
  <title>Hotel Eva</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../Stylize/css/style.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle.min.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle-theme.css">
  <link rel="stylesheet" href="../Stylize/css/newStyle-theme.min.css">
  <script src="../Stylize/js/newStyle.js"></script>
  <script src="../Stylize/js/jquery-3.2.1.js"></script>
  <script src="../Stylize/js/newStyle.min.js"></script>
 <style>
      #snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
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
    <p class="navbar-text" style="color: white;">Hotel Eva</p>
  </div>
</nav>

    
    
    <center>
    <div class="lds-css ng-scope" style="width: 200px; height: 200px;" id="spinner">
        Registering ...<br><br>
        <div style="width:100%;height:100%" class="lds-eclipse">
    <div></div>
            </div>
<style type="text/css">@keyframes lds-eclipse {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  50% {
    -webkit-transform: rotate(180deg);
    transform: rotate(180deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-webkit-keyframes lds-eclipse {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  50% {
    -webkit-transform: rotate(180deg);
    transform: rotate(180deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
.lds-eclipse {
  position: relative;
}
.lds-eclipse div {
  position: absolute;
  -webkit-animation: lds-eclipse 1.8s linear infinite;
  animation: lds-eclipse 1.8s linear infinite;
  width: 160px;
  height: 160px;
  top: 20px;
  left: 20px;
  border-radius: 50%;
  box-shadow: 0 6px 0 0 #950740;
  -webkit-transform-origin: 80px 83px;
  transform-origin: 80px 83px;
}
.lds-eclipse {
  width: 200px !important;
  height: 200px !important;
  -webkit-transform: translate(-100px, -100px) scale(1) translate(100px, 100px);
  transform: translate(-100px, -100px) scale(1) translate(100px, 100px);
}
</style></div></center>
<script>
    $("#spinner").delay(3600).fadeOut(300);
    setTimeout(function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
},3800);
    </script>
    
   

<%
    int error=0;
String customerName=request.getParameter("name"); 
session.setAttribute("customerName",customerName); 
String customerAadhaar=request.getParameter("aadhaar");
String customerEmail=request.getParameter("email");
String customerPhone=request.getParameter("phone");
String customerPin=request.getParameter("pin");
String customerRoomType=request.getParameter("room");
String customerRoomNo=request.getParameter("roomNo");
int rn=Integer.parseInt(customerRoomNo);
String customerCheckIn=request.getParameter("checkIn");
String customerGender=request.getParameter("gender");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from customer where hotel like 'Eva' and room_no="+rn+";");
while(rs.next())
    error++;
if(error==0)
{
int i=st.executeUpdate("insert into customer values ('" + customerRoomNo + "','Eva','" + customerName + "','" + customerAadhaar + "','" + customerEmail + "','" + customerPhone + "','" + customerGender + "',CURDATE())");
int j=st.executeUpdate("insert into rooms_eva(room_no,room_type) values('"+customerRoomNo+"','"+customerRoomType+"')");


   %>
    <div id="snackbar">Successfully Registered</div>
    <script>
        
        setTimeout(function(){
            location.href="./welcome.jsp";
        },5000);
    </script>    
    <%}
    else {%>
    <div id="snackbar">Error in Registering<br> "Room not vacant"</div>  
    <script>
        
        setTimeout(function(){
            location.href="./checkin.html";
        },6000);
    </script>   
    <%}%>


</body>
</html>
