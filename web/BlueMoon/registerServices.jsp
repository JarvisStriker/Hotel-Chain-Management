<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="icon" type="image/png" href="../Photos/whiteLogo.png">
  <title>Hotel Blue Moon</title>
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

          .buttonGoMain{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: white;
             padding: 12px 30px;
             color: black;
             font-size: 16px;
             border: 2px solid #950740;
             border-radius: 4px;
         } 
          .buttonGoMain:hover {
             background-color: #950740;
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
    <p class="navbar-text" style="color: white;">Hotel Blue Moon</p>
  </div>
</nav>

    
    
    <center>
    <div class="lds-css ng-scope" style="width: 200px; height: 200px;" id="spinner">
        Confirming availability ...<br><br>
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
    setTimeout( function buttonFunction(){
    //var x = document.getElementsById("rdrbtn");
    $("#rdrbtn").show();    
    },3800);
    </script>
    
   

<%
String room=request.getParameter("dropdown");
//out.println(room);
int room_no=Integer.parseInt(room);
String services="";
String temp=request.getParameter("service1"); 
int s1=Integer.parseInt(temp);

temp=request.getParameter("service2"); 
int s2=Integer.parseInt(temp);

temp=request.getParameter("service3"); 
int s3=Integer.parseInt(temp);

temp=request.getParameter("service4"); 
int s4=Integer.parseInt(temp);

temp=request.getParameter("service5"); 
int s5=Integer.parseInt(temp);

temp=request.getParameter("service6"); 
int s6=Integer.parseInt(temp);


int total=0;
int i=0;

if(s1!=0){
    total+=(s1*15);
    services+=" laundry service";
}
if(s2!=0){
    total+=(s2*500);
    services+=" locker service";
}
if(s3!=0){
    total+=(s3*700);
    services+=" Extra bed";    
}
if(s4!=0){
    total+=(s4*1000);
    services+=" Conference hall";
}
if(s5!=0){
    total+=(s5*500);
    services+=" baby sitting service";
}
if(s6!=0){
    total+=(s6*100);
    services+=" Special dinner venue";
}
//out.println(total);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from rooms_bluemoon where room_no="+room_no+";"); 
while(rs.next()){
    i=rs.getInt("amt");
    i+=total;    
}
int j1=st.executeUpdate("insert into services values("+room_no+",'Blue Moon','"+services+"',"+total+");");
int j=st.executeUpdate("update rooms_bluemoon set amt="+i+" where room_no="+room_no+";"); 
%>
<div id="snackbar">Service order placed</div>
<br><br><br>
<center>Amount payable with final bill: <%out.println(total);%>.00 
    <br><br><a href="./welcome.jsp">
<button class="buttonGoMain" id="rdrbtn" style="display: none;">Go to management page</button>
    </a></center>
</body>
</html>
