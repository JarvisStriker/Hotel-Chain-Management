<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
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
      body{
          background-color: #950740;
          font-family: 'Trajan', serif;
      }
      
      body::-webkit-scrollbar { 
       display: none; 
      }
           
      #info {
          position: fixed;
          bottom: 100px;
          right: 10px;
          width: 600px;
          height: 300px;
          border: 1px solid white;
          border-radius: 0.3em;
          overflow: auto;
          box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 1), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          color: white;
          padding-left: 15px;
      }
      
      #confirm{
          position: fixed;
          left: 0px;
          width: 300px;
          height: 40px;
          bottom: 60px;
          color: #4CAF50;
      }
      #dropdown{
        width: 30%;
        font-size: 16px;
        padding: 12px 20px 12px 20px;
        border: 1px solid #950740;
        margin-bottom: 12px;
        border-radius: 0.3em;
      }
      
      .buttonConfirm{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: green;
             padding: 12px 30px;
             color: white;
             font-size: 16px;
             box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 5px 10px 0 rgba(0,0,0,0.19);
             border: 2px solid green;
             border-radius: 4px;
         } 
          .buttonConfirm:hover {
             background-color: green;
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
    <p class="navbar-text" style="color: white;">Hotel Eva - Check out</p>
  </div>
</nav>
<br>

<div style="padding-left: 40px;">
 
    
    
<form name="services" method="post" onSubmit="return check(services)" role="form" action="./bill.jsp">    


<div style="color: white;">Select the Room Number: </div>

 <%Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from customer where hotel like 'Eva'"); %>
<select id="dropdown" name="dropdown">
    <option value="" data-name="" selected disabled hidden>Choose here</option>
<%    
while(rs.next())
{
 %>
 
 <option value="<%=rs.getInt("room_no")%>" data-mail="<%=rs.getString("mail_id")%>" data-in="<%=rs.getString("in_date")%>" data-name="<%=rs.getString("name")%>" data-room="<%=rs.getInt("room_no")%>" data-phone="<%=rs.getString("phone")%>">
       <%=rs.getInt("room_no")%>
    </option>
 
 <%
}
%>
</select>


    <p id="roomError" style="display: none;color:white; text-align: left; padding-left: 1px; padding-top: 1px; font-size: 11px;">Choose the room</p>
    

<div id="info"> 
    <h3 align="center"> Customer Information</h3> 
    <br>
</div>
 
    <br>
    <button class="buttonConfirm">Generate Bill</button>
    <!--button class="buttonOk" id="btnok" type="submit" style="display: none;">Confirm!</button-->

</form>

</div>


<script>  
    
    function check(myform){       
        
        var room=myform.dropdown.value;
                
        if(room==""){
         $("#roomError").show();
            return false;
        }
            
        return true;
    }
     
    var name,room,phone;
     $("#dropdown").change(function () {
         name= $(this).find('option:selected').data('name');
         room= $(this).find('option:selected').data('room');
         phone= $(this).find('option:selected').data('phone');
         mail= $(this).find('option:selected').data('mail');
         in_date= $(this).find('option:selected').data('in');
        box();
    });
        
    function box(){
        var box_content=document.getElementById("info");
        box_content.innerHTML="";
        box_content.insertAdjacentHTML('beforeend','<h3 align="center"> Customer Information</h3><p>');
        box_content.insertAdjacentText('beforeend',"Room number: "+room);
        box_content.insertAdjacentHTML('beforeend','<br><br>');
        box_content.insertAdjacentText('beforeend',"Name: "+name);
        box_content.insertAdjacentHTML('beforeend','<br><br>');
        box_content.insertAdjacentText('beforeend',"Phone: "+phone);
        box_content.insertAdjacentHTML('beforeend','<br><br>');
        box_content.insertAdjacentText('beforeend',"Mail ID: "+mail);
        box_content.insertAdjacentHTML('beforeend','<br><br>');
        box_content.insertAdjacentText('beforeend',"Check in date: "+in_date);
        box_content.insertAdjacentHTML('beforeend','<br><br>');
        box_content.insertAdjacentHTML('beforeend','</p>');
    }
</script>


</body>
</html>
