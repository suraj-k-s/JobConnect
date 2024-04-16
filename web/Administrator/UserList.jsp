<%-- 
    Document   : AdminRegdidtor
    Created on : Feb 2, 2024, 5:08:40 PM
    Author     : aakte
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobConnect</title>
    </head>
            <%@include file="Header.jsp" %>
 <div id="tab" align="center">
    <body>

        <table border="1" align="center">


            <tr >
                <th >Sl.No</th>
                <th >Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Password</th>
                <th >Address</th>
                <th>Place</th>
                <th>District</th>
            </tr>


            <%        int i = 0;
                String selQry = "select * from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {

                    i++;

            %>
            <tr>
                <td ><%=i%></td>
                <td ><%=rs.getString("user_name")%></td>
                <td ><%=rs.getString("user_contact")%></td>
                <td ><%=rs.getString("user_email")%></td>
                <td ><%=rs.getString("user_address")%></td>
                <td ><%=rs.getString("user_description")%></td>
                <td ><%=rs.getString("place_name")%></td>
                <td ><%=rs.getString("district_name")%></td>

            </tr>
            <%
            
                }
            %>
 </div>
     </html>
<br>
<br>
<br>



</table>
        <%@include file="Footer.jsp" %>
