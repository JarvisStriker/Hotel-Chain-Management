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
    <p class="navbar-text" style="color: white;">Hotel Eva</p>
  </div>
</nav>

    
    
    <center>
    <div class="lds-css ng-scope" style="width: 200px; height: 200px;" id="spinner">
        Placing Order ...<br><br>
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

String temp=request.getParameter("food1"); 
int fd1=Integer.parseInt(temp);

temp=request.getParameter("food2"); 
int fd2=Integer.parseInt(temp);

temp=request.getParameter("food3"); 
int fd3=Integer.parseInt(temp);

temp=request.getParameter("food4"); 
int fd4=Integer.parseInt(temp);

temp=request.getParameter("food5"); 
int fd5=Integer.parseInt(temp);

temp=request.getParameter("food6"); 
int fd6=Integer.parseInt(temp);

temp=request.getParameter("food7"); 
int fd7=Integer.parseInt(temp);

temp=request.getParameter("food8"); 
int fd8=Integer.parseInt(temp);

temp=request.getParameter("food9"); 
int fd9=Integer.parseInt(temp);

temp=request.getParameter("food10"); 
int fd10=Integer.parseInt(temp);

temp=request.getParameter("food11"); 
int fd11=Integer.parseInt(temp);

temp=request.getParameter("food12"); 
int fd12=Integer.parseInt(temp);

temp=request.getParameter("food13"); 
int fd13=Integer.parseInt(temp);

int total=0;
int i=0;

if(fd1!=0)
    total+=(fd1*105);
if(fd2!=0)
    total+=(fd2*100);
if(fd3!=0)
    total+=(fd3*75);
if(fd4!=0)
    total+=(fd4*60);
if(fd5!=0)
    total+=(fd5*240);
if(fd6!=0)
    total+=(fd6*220);
if(fd7!=0)
    total+=(fd7*30);
if(fd8!=0)
    total+=(fd8*100);
if(fd9!=0)
    total+=(fd9*80);
if(fd10!=0)
    total+=(fd10*280);
if(fd11!=0)
    total+=(fd11*220);
if(fd12!=0)
    total+=(fd12*265);
if(fd13!=0)
    total+=(fd13*210);

//out.println(total);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from rooms_eva where room_no="+room_no+";"); 
while(rs.next()){
    i=rs.getInt("amt");
    i+=total;    
}
int j1=st.executeUpdate("insert into services values("+room_no+",'Eva','Food',"+total+");");
int j=st.executeUpdate("update rooms_eva set amt="+i+" where room_no="+room_no+";"); 
%>
<div id="snackbar">Successfully Placed order</div>
<br><br><br>
<center>Amount payable with final bill: <%out.println(total);%>.00 
    <br><br><a href="./welcome.jsp">
<button class="buttonGoMain" id="rdrbtn" style="display: none;">Go to management page</button>
    </a></center>
</body>
</html>
