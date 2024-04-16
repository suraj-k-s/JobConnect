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
        <%

            if (request.getParameter("btnsave") != null) {
                String adminName = request.getParameter("txtname");
                String adminPassword = request.getParameter("txtpassword");
                String email = request.getParameter("txtemail");
                String contact = request.getParameter("txtcontact");
                String insQry = "insert into tbl_admin(admin_name,admin_password,admin_contact,admin_email)values('" + adminName + "','" + adminPassword + "','"+contact+"','"+email+"')";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "AdminRegistration.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "AdminRegistration.jsp";
        </script>
        <%
                }
            }

        %>


        <%            if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_admin where admin_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("AdminRegistration.jsp");
            }

        %>


        <form method="POST" name="frmCal">
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" placeholder="Enter Name" required=""></td>
                </tr>
                
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" placeholder="Enter Contact" required=""></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" placeholder="Enter Email" required=""></td>
                </tr>

                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" placeholder="Enter password" required=""></td>
                </tr>

                <tr>

                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="btnMin" value="Cancel">

                    </td>
                </tr>
            </table>
        </form>    
                </div>
        
    </body>

  <br>
</html>>

<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Password</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_admin";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("admin_name")%></td>
        <td ><%=rs.getString("admin_contact")%></td>
        <td ><%=rs.getString("admin_email")%></td>
        <td ><%=rs.getString("admin_password")%></td>
        <td ><a href="AdminRegistration.jsp?del=<%=rs.getString("admin_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
            <%@include file="Footer.jsp" %>

 </div>
            