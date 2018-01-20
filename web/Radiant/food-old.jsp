<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
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
  <script src="../Stylize/js/newStyle.js"></script>
  <script src="../Stylize/js/jquery-3.2.1.js"></script>
  <script src="../Stylize/js/newStyle.min.js"></script>
  <style>
      body{
          background-color: #950740;
      }
      #foodInput,#customerInput {
        width: 70%;
        font-size: 16px;
        padding: 12px 20px 12px 20px;
        border: 1px solid #950740;
        margin-bottom: 12px;
        border-radius: 0.3em;
      }

      #foodTable,#customerTable {
        border-collapse: collapse;
        background-color: white;
        width: 70%;
        border: 1px solid #950740;
        font-size: 18px;
        margin-bottom: 20px;
        border-radius: 0.3em;
      }

      #foodTable th, #foodTable td,#customerTable th,#customerTable td{
        text-align: left;
        padding: 12px;
      }

      #foodTable tr,#customerTable tr{
        border-bottom: 1px solid #950740;
      }

      #foodTable tr:hover, #customerTable tr:hover {
        background-color: #950740;
        color: white;
      }
      
      #foodTable tr:first-child:hover, #customerTable tr:first-child:hover {
        background-color: white;
        color: black;
      }
      
      #add{
          background-color: #950740;
          color: white;
          padding: 5px 20px 5px 20px;
      }
      
      #add:hover{
          background-color: white;
          color: black;
      }
      #items {
          position: fixed;
          bottom: 10px;
          right: 10px;
          width: 300px;
          height: 300px;
          border: 1px solid white;
          border-radius: 0.3em;
          overflow: auto;
          box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 1), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          color: white;
          padding-left: 15px;
      }
      #non-veg{
          position: fixed;
          bottom: 330px;
          right: 10px;
          width: 300px;
          height: 160px;
          border: 1px solid white;
          border-radius: 0.3em;
          box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 1), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          color: white;
      }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-static-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../index.html">
      	<img width="45px" style="margin-top: -7px;" src="../Photos/whiteLogo.png" alt="KGH">
      </a>
    </div>
    <p class="navbar-text" style="color: white;">Hotel Radiant - Food</p>
  </div>
</nav>
<br>

<div style="padding-left: 40px;">
 
<input type="text" id="customerInput" onkeyup="customerFunction()" autofocus placeholder="Enter Room Number or Customer Name ..." >    

<table id="customerTable" style="display:none;" border="2" >
<tr>
<th>Room Number</th>
<th>Name</th>
<th>Phone Number</th>
</tr>
 <%Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from customer");    
while(rs.next())
{
%>
<tr onclick="row(this)" id="row1"><td><%=rs.getInt("room_no") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("phone") %></td>
</tr>
 <%
}
%>
</table>

<input type="text" id="foodInput" onkeyup="foodFunction()" placeholder="Search For Food Items ...">
<table id=foodTable border="2">
<tr>
<th>Items</th>
<th>Type</th>
<th colspan="2">Amount</th>
</tr>
<%
rs=st.executeQuery("select * from food"); 
while(rs.next())
{
%>
<tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;<%=rs.getString("name") %></td>
        <td><%=rs.getString("type") %></td>
        <td><%=rs.getInt("amount") %>.00</td>
        <td><center><button id="add" class="btn" onclick="items(this)">add</button></center></td>
</tr>
        <%
}
%>
 
<div id="non-veg"> 
    <h3 align="center"><img src="../Photos/nonveg.png" width="15" style="padding-bottom: 3px;"> Non Vegetarian</h3>
    <p align="center">
        All non-vegetarian food are out-sourced.<br>
        Please tell the customer to contact<br>
        <strong>145</strong> on intercom<br>
        to place an order
    </p>
</div>

<div id="items"> 
    <h3 align="center"> Items Selected</h3> 
    <br>
    Room Number: 
</div>


</div>
<script>
  function row(obj){
      var x= $(obj).attr('id');
      alert(x);
  } 
    
function foodFunction() {
  var input, filter, table, tr, td, td1, i;
  input = document.getElementById("foodInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("foodTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    td1= tr[i].getElementsByTagName("td")[1];
    if (td || td1) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1 ) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
 }
  
  
  function customerFunction(){
    $("#customerTable").show();
    var input, filter, table, tr, td, td1, i;
    input = document.getElementById("customerInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("customerTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[0];
      td1= tr[i].getElementsByTagName("td")[1];
      if (td || td1) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td1.innerHTML.toUpperCase().indexOf(filter) > -1 ) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }       
    }
  }
</script>

</body>
</html>
