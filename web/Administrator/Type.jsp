<%-- 
    Document   : Type
    Created on : Feb 28, 2024, 1:13:23 AM
    Author     : PSST
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Type.jsp</title>
    </head>
            <%@include file="Header.jsp" %>
 <div id="tab" align="center">
    <body>

        <%
            if (request.getParameter("btnsave") != null) {
                String type = request.getParameter("txttype");
                String insQry = "insert into tbl_type(type_name) values('" + type + "')";
                if (con.executeCommand(insQry)) {
        %>

        <script>
            alert("Record Saved");
            window.location = "Type.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Type.jsp";
        </script>
        <%
                }
            }
         %>


        <%
            if (request.getParameter("del") != null) {
                String delQry = "delete  from tbl_type where type_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
            }
        %>
        <form>
            <table border="2"><tr>
                    <td>Type Name </td>
                    <td><input type="text" name="txttype" placeholder="Enter Type" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="btnreset"  value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
 </div>
        
    </body>
</html>

<table border="2" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_type";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("type_name")%></td>
        <td ><a href="Type.jsp?del=<%=rs.getString("type_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
            <%@include file="Footer.jsp" %>
