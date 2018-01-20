<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="icon" type="image/png" href="Photos/logo.png">
  <title>Kushal Group of Hotels</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="Stylize/css/newStyle.css">
  <link rel="stylesheet" href="Stylize/css/newStyle-theme.css">
  <script src="Stylize/js/newStyle.js"></script>
  <script src="Stylize/js/jquery-3.2.1.js"></script>
   <link rel="stylesheet" href="Stylize/css/style.css"> 
<style>
    .button{
	 -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    background-color: white;
    padding: 14px 40px;
    color: black;
    border: 2px solid #008CBA;
}
.button:hover {
    background-color: #008CBA;
    color: white;
     box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>

</head>
<body>

<nav class="navbar navbar-inverse navbar-static-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.html">
      	<img width="45px" style="margin-top: -7px;" src="Photos/whiteLogo.png" alt="KGH">
      </a>
    </div>
    <p class="navbar-text" style="color: white;">Kushal Group of Hotels</p>
  </div>
</nav>


<br>
<%
String userid=request.getParameter("usr"); 
session.setAttribute("userid",userid); 
String pwd=request.getParameter("pwd"); 
String usrName;
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users where id='"+userid+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
    usrName=rs.getString(3); %>
<center>
    <h3>Welcome <strong><%out.println(usrName);%></strong>, you have successfully logged in</h3> <br><br>
    <a href="selectHotel.html"><button class="button"> Continue </button></a>   
      
</center>    
<% } 
else
{ 
    %>
    <center>
        Invalid Password, Go Back and try again!
    </center>
  <%
} 
}
else
{
    %>
    <center>
        Invalid User ID, Go Back and try again!
    </center>
  <%
}
%>
</body>
</html>