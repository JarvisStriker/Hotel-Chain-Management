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
      
      body::-webkit-scrollbar { 
       display: none; 
      }
           
      #info {
          position: fixed;
          bottom: 120px;
          right: 10px;
          width: 300px;
          height: 150px;
          border: 1px solid white;
          border-radius: 0.3em;
          overflow: auto;
          box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 1), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          color: white;
          padding-left: 15px;
      }
      #note{
          position: fixed;
          bottom: 300px;
          right: 10px;
          width: 300px;
          height: 160px;
          border: 1px solid white;
          border-radius: 0.3em;
          box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 1), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          color: white;
      }
      
      #confirm{
          position: fixed;
          right: 10px;
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
      .foodD{
         -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: blueviolet;;
             padding: 12px 30px;
             color: white;
             font-size: 16px;
             border: 2px solid blueviolet;
             box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 5px 10px 0 rgba(0,0,0,0.19);
             border-radius: 4px; 
      }
      .foodD:hover{
             color: white;
              box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
      }
      .buttonConfirm{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: #4CAF50;;
             padding: 12px 30px;
             color: white;
             font-size: 16px;
             border: 2px solid #4CAF50;
             box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 5px 10px 0 rgba(0,0,0,0.19);
             border-radius: 4px;
         } 
          .buttonConfirm:hover {
             background-color: green;
             color: white;
             border: 2px solid green;
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
    <p class="navbar-text" style="color: white;">Hotel Radiant - Services</p>
  </div>
</nav>
<br>

<div style="padding-left: 40px;">
 
    
    
<form name="services" method="post" onSubmit="return check(services)" role="form" action="./registerServices.jsp">    


<div style="color: white;">Select the Room Number: </div>

 <%Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from customer where hotel like 'Radiant'"); %>
<select id="dropdown" name="dropdown">
    <option value="" data-name="" selected disabled hidden>Choose here</option>
<%    
while(rs.next())
{
 %>
 
 <option value="<%=rs.getInt("room_no")%>" data-name="<%=rs.getString("name")%>" data-room="<%=rs.getInt("room_no")%>" data-phone="<%=rs.getString("phone")%>">
       <%=rs.getInt("room_no")%>
    </option>
 
 <%
}
%>
</select>


    <p id="roomError" style="display: none;color:white; text-align: left; padding-left: 1px; padding-top: 1px; font-size: 11px;">Choose the room</p>
    <p id="serviceError" style="display: none;color:white; text-align: left; padding-left: 1px; padding-top: 1px; font-size: 11px;">select atleast 1 service</p>
   
    <br><br>
    <div class="row">
    <div id="laundry" class="col-sm-3" style="color: white; border: 2px; border-color: white;">
        <h3>Laundry</h3>
        <h5>Enter the number of clothes</h5>
        <input type="number" min="0" id="service1" name="service1" value="0" style="color: #950740; text-align: center;"/>
    </div>
    
    <div id="locker" class="col-sm-3" style="color: white;">
        <h3>Locker Facility</h3>
        <h5>Enter the number of lockers requested</h5>
        <input type="number" min="0" id="service2" name="service2" value="0" style="color: #950740; text-align: center;"/>
    </div>
    
    <div id="bed" class="col-sm-3" style="color: white;">
        <h3>Extra Bed</h3>
        <h5>Enter the number of beds</h5>
        <p>( 2 being max ) <input type="number" min="0" max="2" id="service3" name="service3" value="0" style="color: #950740; text-align: center;"/></p>
    </div>
    </div>
    <br><br>
    
    <div class="row">
    <div id="hall" class="col-sm-3" style="color: white;">
        <h3>Conference Hall</h3>
        <h5>Enter the number of hours requested</h5>
        <p>( 12 being max ) <input type="number" min="0" max="12" id="service4" name="service4" value="0" style="color: #950740; text-align: center;"/></p>
    </div>
        
    <div id="baby" class="col-sm-4" style="color: white;">
        <h3>Baby Sitting Services</h3>
        <h5>Enter the number of hours requested</h5>
        <p>( 12 being max ) <input type="number" min="0" max="12" id="service5" name="service5" value="0" style="color: #950740; text-align: center;"/></p>
    </div>        
    </div>
    
    <br><br>
    <div class="row">
       <div id="dinner" class="col-sm-4" style="color: white;">
        <h3>Private and Exclusive Canopy Candlelight dinners</h3>
        <h5>Enter the number of people</h5>
        <p>( 8 being max ) <input type="number" min="0" max="8" id="service6" name="service6" value="0" style="color: #950740; text-align: center;"/></p>
        </div>
        <div id="food" class="col-sm-4" style="color: white;">
            <h3>Food Delivery</h3>
            <a href="./food.jsp">
                <button class="foodD" type="button">Order Food</button></a>
        </div>
    </div>   
        
<div id="note"> 
    <h3 align="center"> Note</h3>
    <p align="center">
        All clothes are subjected to same <br>
        price for laundry.<br>
        Baby sitting services available<br>
        on select days only.
    </p>
</div>

<div id="info"> 
    <h3 align="center"> Customer Information</h3> 
    <br>
</div>

<div id="confirm">
    <center>
        <button class="buttonConfirm" type="submit">Confirm</button>
    </center>
</div>

</form>

</div>


<script>
    $("#customerTable").show();
    
   
    
    function check(myform){
        var s1=myform.service1.value;
        var s2=myform.service2.value;
        var s3=myform.service3.value;
        var s4=myform.service4.value;
        var s5=myform.service5.value;
        var s6=myform.service6.value;
        
        
        var room=myform.dropdown.value;
        if(s1==0 && s2==0 && s3==0 && s4==0 && s5==0 && s6==0){
         $("#serviceError").show();
            return false;}
        
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
         box();
    });
        
    function box(){
        var box_content=document.getElementById("info");
        box_content.innerHTML="";
        box_content.insertAdjacentHTML('beforeend','<h3 align="center"> Customer Information</h3><p>');
        box_content.insertAdjacentText('beforeend',"Room number: "+room);
        box_content.insertAdjacentHTML('beforeend','<br>');
        box_content.insertAdjacentText('beforeend',"Name: "+name);
        box_content.insertAdjacentHTML('beforeend','<br>');
        box_content.insertAdjacentText('beforeend',"Phone: "+phone);
        box_content.insertAdjacentHTML('beforeend','</p>');
    }
</script>


</body>
</html>
