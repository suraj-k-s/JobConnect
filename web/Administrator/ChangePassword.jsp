<%-- 
    Document   : ChangePassword
    Created on : Mar 3, 2024, 9:35:32 PM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChangePassword</title>
    </head>
            <%@include file="Header.jsp" %>
                   <div id="tab" align="center">

    <%
        String id = session.getAttribute("aid").toString();
        if (request.getParameter("btn_save") != null) {
            String db_password = request.getParameter("");
            String current_password = request.getParameter("txtcpass");
            String newpass = request.getParameter("txtnpass");
            String Repass = request.getParameter("txtrpass");
            String selQry = "select * from tbl_admin where admin_id='" + id + "'";
            ResultSet rs = con.selectCommand(selQry);
            if (rs.next()) {

                db_password = rs.getString("admin_password");
            }
            if (current_password.equals(db_password)) {
                if (newpass.equals(Repass)) {
                    String updQry = "update tbl_admin SET admin_password='" + newpass + "' where admin_id='" + session.getAttribute("aid") + "'";

                    if (con.executeCommand(updQry)) {
    %>
    <script>
        alert("Updated Successfully")
        window.location.href = "../Guest/Login.jsp"
    </script>
    <% }
             } else { %>
    <script>
        alert("new Password Mismatched")
        window.location.href = "../Login.jsp"
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert("new Password Mismatched")
        window.location.href = "../Login.jsp"
    </script>
    <%
            }
        }
    %>
    <body>
       <form method="POST" name="frmCal">
            <table border="1" align="center">
                <tr>
                    <td>CurrentPassword</td>
                    <td><input type="text" name="txtcpass"  required=""></td>
                </tr>
                <tr>
                    <td>NewPassword</td>
                    <td><input type="text" name="txtnpass" required=""></td>
                </tr>
                <tr>
                    <td>Re-Password</td>
                    <td><input type="text" name="txtrpass" required=""></td>
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
        <%@include file="Footer.jsp" %>

