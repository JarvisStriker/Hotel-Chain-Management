<%@ page import="java.text.SimpleDateFormat"%>
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
         background-color: black;
     }
     hr{
         display: block;
         border-width: 1px;
         border-color: black;
     }
           .buttonFinal{
            -webkit-transition-duration: 0.4s; /* Safari */
             transition-duration: 0.4s;
             cursor: pointer;
             background-color: red;
             padding: 12px 30px;
             color: white;
             font-size: 16px;
             border: 2px solid red;
             border-radius: 4px;
         } 
          .buttonFinal:hover {
             background-color: red;
             color: white;
              box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
         }
         .bill{
             font-family: 'Trajan Pro Regular', Serif;
         }
         .table{
             border-collapse: collapse;
             width: 70%;
             font-size: 18px;
             margin-bottom: 20px;
             border-radius: 0.3em;
         }
         .box{
             border: 2px solid #950740;
                
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
    <p class="navbar-text" style="color: white;">Hotel Blue Moon - Bill</p>
  </div>
</nav>

 

<%
String room=request.getParameter("dropdown");
//out.println(room);
int room_no=Integer.parseInt(room);
//int room_no=1;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select c.room_no, c.hotel, name, phone, mail_id, "
        + "in_date, room_type, r.amt, "
        + "datediff(curdate(),c.in_date) as days from customer c, rooms_bluemoon r "
        + "where c.room_no="+room_no+" and "
                + "c.room_no=r.room_no and "
                + "c.hotel like 'Blue Moon';"); 
//ResultSet rs=st.executeQuery("select c.room_no, c.hotel, name, phone, mail_id, in_date, room_type, r.amt as total, type, s.amt  from customer c, rooms_radiant r, services s where c.room_no="+room_no+" and c.room_no=r.room_no and c.room_no=s.room_no and c.hotel like 'Radiant' and s.hotel like 'Radiant';"); 

//ResultSet srvcs=st.executeQuery("select * from services where room_no="+room_no+" and hotel like 'Radiant';");

String name="";
String mail="";
String phone="";
String in_date="";
String room_type="";
String srvcs_type="";
int srvcs_amt=0;
int total=0;
int days=0;

while(rs.next())
{
    name=rs.getString("name");
    mail=rs.getString("mail_id");
    phone=rs.getString("phone");
    in_date=rs.getString("in_date");
    room_type=rs.getString("room_type");
    days=rs.getInt("days");
    days++;
}

rs=st.executeQuery("select * from services where room_no="+room_no+" and hotel like 'Blue Moon';");

%>
<div class="container">
<div class="jumbotron">
    <center><p>Invoice</p>
        <hr><br><br><div>
            <p align='left'>
                Name: &nbsp;&nbsp;<strong class="bill"><%out.println(name);%></strong><br>
                Mail ID: &nbsp;&nbsp;<strong><%out.println(mail);%></strong><br>
                Phone: &nbsp;&nbsp;<strong class="bill"><%out.println(phone);%></strong><br>
                Room Number: &nbsp;&nbsp; <strong class="bill"><%out.println(room_no);%></strong><br>
                Room Type:  &nbsp;&nbsp; <strong class="bill"><%out.println(room_type);%></strong><br>
                Checked in on &nbsp;&nbsp; <strong class="bill"><%out.println(in_date);%></strong><br>
                In-Time: <strong class="bill"><%out.println(days);%> Day/s</strong><br>
                <br>
                Rent for 1 day: 
                <%
       int room_amt=0;
      
       if(room_type.equalsIgnoreCase("Twin")){
           room_amt=5000;
           total+=(room_amt*days);
       }
       else if(room_type.equalsIgnoreCase("Master Suite")){
           room_amt=15000;
           total+=(room_amt*days);
       }
       else if(room_type.equalsIgnoreCase("King")){
           room_amt=22000;
           total+=(room_amt*days);
       }
       
%><strong class="bill"><%out.println(room_amt);%> .00 </strong><br><br>
Room Rent payable: <strong class="bill"><%out.println(room_amt);%> * <%out.println(days);%> = <%out.println(total);%> .00</strong>
<br><br>
<strong>Services availed:</strong><br><br>
            </p>
            
            <table class="table">
                <tr>
                    <th>Service Type</th>
                    <th>Service Amount</th>
                </tr>
   
               
                <%
 while(rs.next())
 {
   srvcs_type=rs.getString("type");
   srvcs_amt=rs.getInt("amt");
   total+=srvcs_amt;%>
   <tr>
       <td><strong class="bill"><%out.println(srvcs_type);%></strong></td>
       <td><strong class="bill"><%out.println(srvcs_amt);%> .00</strong></td>
   </tr>
   
   
   <%
    }
   %>
   </table>
   <br><br>
   <div class="box"><p>
       <strong class="bill">Total amount payable: <%out.println(total);%>.00</strong>
   </p>
   </div>
            
        </div></center>
</div>
</div>
<br>
<center>
    <form name="checkout" method="post" role="form" action="final.jsp">
        <input id="total" name="total" style="display: none;" value="<%=total%>"/>
        <input id="room" name="room" style="display: none;" value="<%=room_no%>"/>
    <br><br><a href="./final.jsp">
        <button class="buttonFinal" id="rdrbtn" type="submit">Check out</button>
    </a></form></center><br><br>
</body>
</html>

<!--CREATE DEFINER=`root`@`localhost` PROCEDURE `bill`(
		in room_para int(11),
        in hotel_para varchar(45),
        in amount_para int(11)
)
BEGIN
	delete from customer where hotel like hotel_para and room_no=room_para;
    if hotel_para = 'Radiant' then
    	delete from rooms_radiant where room_no=room_para;
	elseif hotel_para = 'Eva' then
		delete from rooms_eva where room_no=room_para;
	elseif hotel_para = 'Bluemoon' then
		delete from rooms_bluemoon where room_no=room_para;
    end if;
    update history set amt=amount_para where hotel like hotel_para and room_no=room_para;
    delete from services where hotel like hotel_para and room_no=room_para;
    
END -->