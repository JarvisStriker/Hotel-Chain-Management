<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
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
    body{
          background-color: #950740;
      }
    #customerInput {
        width: 80%;
        font-size: 16px;
        padding: 12px 20px 12px 20px;
        border: 1px solid #950740;
        margin-bottom: 12px;
        border-radius: 0.3em;
      }

    #customerTable {
        border-collapse: collapse;
        background-color: white;
        width: 80%;
        border: 1px solid #950740;
        font-size: 18px;
        margin-bottom: 20px;
        border-radius: 0.3em;
      }

      #customerTable th, #customerTable td {
        text-align: left;
        padding: 12px;
      }

      #customerTable tr{
        border-bottom: 1px solid #950740;
      }

      
</style>

</head>


<nav class="navbar navbar-inverse navbar-static-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="./welcome.jsp">
      	<img width="45px" style="margin-top: -7px;" src="../Photos/whiteLogo.png" alt="KGH">
      </a>
    </div>
    <p class="navbar-text" style="color: white;">Hotel Blue Moon - History</p>
  </div>
</nav>


    <center>
<input type="text" id="customerInput" onkeyup="customerFunction()" autofocus placeholder="Enter Room Number or Customer Name ..." >    

<table id="customerTable" style="display:none;" border="2" >
    <tr>
        <th>Room Number</th>
        <th>Name</th>
        <th>Mail ID</th>
        <th>Billed Amount</th>
        <th>Checked-in</th>
        <th>Checked-out</th>
    </tr>
<%Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from history where hotel like 'Blue Moon'"); 
while(rs.next())
{ 
 %>
 <tr><td><%=rs.getString("room_no")%> </td>
     <td><%=rs.getString("name")%> </td>
     <td><%=rs.getString("mail_id")%> </td>
     <td><%=rs.getString("amt")%> </td>
     <td><%=rs.getString("in_date")%> </td>
     <td><%=rs.getString("out_date")%> </td>
 </tr>
<%
 } %>
        </table>
    

 
        
        
    </center>
           
 <script>
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
    

</html>