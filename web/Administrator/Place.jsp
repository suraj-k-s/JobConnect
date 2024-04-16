<%-- 
    Document   : Calculator
    Created on : Feb 1, 2024, 5:19:00 PM
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

        <%

            if (request.getParameter("btnsave") != null) {
                String placename = request.getParameter("txtname");
                 String disid = request.getParameter("selDistrict");
                String insQry = "insert into tbl_place(place_name,district_id)values('" + placename + "','"+disid+"') ";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Place.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Place.jsp";
        </script>
        <%
                }
            }

        %>

<%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_place where place_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Place.jsp");
            }

        %>
       

        <form method="POST" name="frmCal">
            <table border="1" align="center">

                <tr>
                    <td>District</td>
                    <td>
                        <select name="selDistrict">
                             <option value="">--select--</option>
                            <%                                 
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>
                            
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                                %>


                    </td>
                </tr>


                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txtname" placeholder="Enter Place" required=""></td>
                </tr>

                <tr>

                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        

                    </td>
                </tr>

            </table>
        </form>
       </div>
    </body>

</html>
<br>
<br>

<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >District</th>
        <th>Place</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry1 = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
        ResultSet rs1 = con.selectCommand(selQry1);
        while (rs1.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs1.getString("district_name")%></td>
         <td ><%=rs1.getString("place_name")%></td>
        <td ><a href="Place.jsp?del=<%=rs1.getString("place_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
            <%@include file="Footer.jsp" %>
