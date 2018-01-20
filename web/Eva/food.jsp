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
      }
      
      body::-webkit-scrollbar { 
       display: none; 
      }
      
      #foodTable{
        border-collapse: collapse;
        background-color: white;
        width: 70%;
        border: 1px solid #950740;
        font-size: 18px;
        margin-bottom: 20px;
        border-radius: 0.3em;
      }

      #foodTable th, #foodTable td{
        text-align: left;
        padding: 12px;
      }

      #foodTable tr{
        border-bottom: 1px solid #950740;
      }

      #foodTable tr:hover{
        background-color: #950740;
        color: white;
      }
      
      
      
      #foodTable tr:first-child:hover{
        background-color: white;
        color: black;
      }
      
      
      #info {
          position: fixed;
          bottom: 130px;
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
      #non-veg{
          position: fixed;
          bottom: 340px;
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
          bottom: 40px;
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
             border: 2px solid green;
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
    <p class="navbar-text" style="color: white;">Hotel Eva - Food</p>
  </div>
</nav>
<br>

<div style="padding-left: 40px;">
 
    
    
<form name="food" method="post" onSubmit="return check(food)" role="form" action="./registerFood.jsp">    


<div style="color: white;">Select the Room Number: </div>

 <%Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from customer  where hotel like 'Eva'"); %>
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
    <p id="foodError" style="display: none;color:white; text-align: left; padding-left: 1px; padding-top: 1px; font-size: 11px;">Enter atleast 1 quantity number</p>
    <table id=foodTable border="2">
        <tr><td colspan="4" style="color: #950740;"><center><strong>--- Enter the quantity ---</strong></center></td></tr>
        <tr>
        <th>Items</th>
        <th>Amount</th>
        <th><center>Quantity</center></th>
        </tr>


        <tr>
            <th colspan="3" >Soups</th>
        </tr>

        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Tomato soup</td>
                <td>105.00</td>
                <td><center>
                    <input type="number" min="0" id="food1" name="food1" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>

        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Veg clear soup</td>
                <td>100.00</td>
                <td><center>
                    <input type="number" min="0" id="food2" name="food2" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>

        <tr>
           <th colspan="3" >Chats</th> 
        </tr>

        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Sev puri</td>
                <td>75.00</td>
                <td><center>
                    <input type="number" min="0" id="food3" name="food3" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Masala puri</td>
                <td>60.00</td>
                <td><center>
                    <input type="number" min="0" id="food4" name="food4" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr>
           <th colspan="3" >Chinese Dry Dishes</th> 
        </tr>
        
         <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Spanish manchurian</td>
                <td>240.00</td>
                <td><center>
                    <input type="number" min="0" id="food5" name="food5" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Babycorn manchurian</td>
                <td>220.00</td>
                <td><center>
                    <input type="number" min="0" id="food6" name="food6" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr>
           <th colspan="3" >Indian Breads</th> 
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Roti</td>
                <td>30.00</td>
                <td><center>
                    <input type="number" min="0" id="food7" name="food7" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Stuffed kulcha</td>
                <td>100.00</td>
                <td><center>
                    <input type="number" min="0" id="food8" name="food8" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Butter kulcha</td>
                <td>80.00</td>
                <td><center>
                    <input type="number" min="0" id="food9" name="food9" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr>
           <th colspan="3" >Curries</th> 
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Kaju paneer</td>
                <td>280.00</td>
                <td><center>
                    <input type="number" min="0" id="food10" name="food10" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Methi mutter masala</td>
                <td>220.00</td>
                <td><center>
                    <input type="number" min="0" id="food11" name="food11" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Corn palak</td>
                <td>265.00</td>
                <td><center>
                    <input type="number" min="0" id="food12" name="food12" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
        <tr>
           <th colspan="3" >Rice</th> 
        </tr>
        
        <tr><td><img src="../Photos/veg.png" width="15" style="padding-bottom: 3px;">&nbsp;Tripple schezwan rice</td>
                <td>210.00</td>
                <td><center>
                    <input type="number" min="0" id="food13" name="food13" value="0" style="color: #950740; text-align: center;"/>      
                </center></td>
        </tr>
        
    </table>


 
<div id="non-veg"> 
    <h3 align="center"><img src="../Photos/nonveg.png" width="15" style="padding-bottom: 3px;"> Non Vegetarian</h3>
    <p align="center">
        All non-vegetarian food are out-sourced.<br>
        Please tell the customer to contact<br>
        <strong>145</strong> on intercom<br>
        to place an order
    </p>
</div>

<div id="info"> 
    <h3 align="center"> Customer Information</h3> 
    <br>
</div>

<div id="confirm">
    <center>
        <button class="buttonConfirm" type="submit">Confirm Order</button>
    </center>
</div>
   
</form>

</div>

<!--remove this script if allowing next block -->
<script>
    $("#customerTable").show();
   
    function check(myform){
        var food1=myform.food1.value;
        var food2=myform.food2.value;
        var food3=myform.food3.value;
        var food4=myform.food4.value;
        var food5=myform.food5.value;
        var food6=myform.food6.value;
        var food7=myform.food7.value;
        var food8=myform.food8.value;
        var food9=myform.food9.value;
        var food10=myform.food10.value;
        var food11=myform.food11.value;
        var food12=myform.food12.value;
        var food13=myform.food13.value;
        
        var room=myform.dropdown.value;
        //var food1 is the quantity of item 1
        if(food1==0 && food2==0 && food3==0 && food4==0 && food5==0 && food6==0 && food7==0 && food8==0 && food9==0 && food10==0 && food11==0 && food12==0 && food13==0){
         $("#foodError").show();
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
<!--script>
  
    
function foodFunction() {
     $("#foodTable").show();
  var input, filter, table, tr, td, td2, i;
  input = document.getElementById("foodInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("foodTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    td2= tr[i].getElementsByTagName("td")[2];
    if (td || td2) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td2.getAttribute("data-type").toUpperCase().indexOf(filter) > -1 ) {
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
</script-->

</body>
</html>
