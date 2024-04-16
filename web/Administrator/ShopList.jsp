<%-- 
    Document   : ShopList
    Created on : Mar 3, 2024, 11:02:21 PM
    Author     : PSST
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopList</title>
    </head>
            <%@include file="Header.jsp" %>
 <div id="tab" align="center">
    <body>

        <%
            if (request.getParameter("del") != null) {
                String DelQry = "delete from tbl_shop where shop_id='" + request.getParameter("del") + "'";
                con.executeCommand(DelQry);

            }

        %>
        <table border="3">
            <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Email</th>
                <th>Place</th>
                <th>District</th>
                <th>Photo</th>
                <th>Proof</th>
                <th>Action</th>
            </tr>
            <%        int i = 0;
                String selQry1 = "select * from tbl_shop u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id";
                ResultSet rs1 = con.selectCommand(selQry1);
                while (rs1.next()) {

                    i++;

            %>
            <tr>
                <td ><%=i%></td>
                <td ><%=rs1.getString("shop_name")%></td>
                <td ><%=rs1.getString("shop_contact")%></td>
                <td ><%=rs1.getString("shop_address")%></td>
                <td ><%=rs1.getString("shop_email")%></td>
                <td ><%=rs1.getString("place_name")%></td>
                <td ><%=rs1.getString("district_name")%></td>
                <td><img src="../Assets/Files/<%=rs1.getString("Shop_photo")%>" width="50" height="50"></td>
                <td><img src="../Assets/Files/<%=rs1.getString("Shop_proof")%>" width="50" height="50"></td>

                <td><a href="ShopList.jsp?del=<%=rs1.getString("shop_id")%>">Delete</a></td>


            </tr>
            <%                      }


            %>


            <tr>
                <td></td>
            </tr>
        </table>
 </div>
</html>
        <%@include file="Footer.jsp" %>

