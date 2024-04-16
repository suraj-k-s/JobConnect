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

            if (request.getParameter("btn_save") != null) {
                String districtName = request.getParameter("txtname");
                String insQry = "insert into tbl_district(district_name)values('" + districtName + "') ";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "District.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "District.jsp";
        </script>
        <%
                }
            }

        %>


        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_district where district_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("District.jsp");
            }

        %>

        <form method="POST" name="frmCal">
            <table border="1" align="center">
                <tr>
                    <td>District</td>
                    <td><input type="text" name="txtname" placeholder="Enter District" required=""></td>
                </tr>

                <tr>

                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="Save">
                        <input type="reset" name="btnMin" value="Cancel">

                    </td>
                </tr>

            </table>
        </form>
                   </div>
    </body>
</html>

<br>
<br>
<br>
<br>
<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_district";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("district_name")%></td>
        <td ><a href="District.jsp?del=<%=rs.getString("district_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
            <%@include file="Footer.jsp" %>
