<%-- 
    Document   : Editprofile
    Created on : Mar 3, 2024, 9:30:17 PM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
            <%@include file="Header.jsp" %>
    <div id="tab" align="center">
    <%
        String id = session.getAttribute("sid").toString();
        if (request.getParameter("btn_save") != null) {
            String updatename = request.getParameter("txtname");
            String updateemail = request.getParameter("txtemail");
            String updateaddress = request.getParameter("txt_address");
            String update = "update tbl_shop SET Shop_name='" + updatename + "', Shop_email='" + updateemail + "',Shop_address='" + updateaddress + "' where Shop_id='" + id + "'";
            con.executeCommand(update);
            out.println("Changed");
        }
        String sel = "select * from tbl_shop where Shop_id='" + id + "'";
        ResultSet rs = con.selectCommand(sel);
        if (rs.next()) {

        
            
    %>
    <body>
        <form method="POST" name="frmCal">
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" placeholder="<%=rs.getString("Shop_name")%>" required=""></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" placeholder="<%=rs.getString("Shop_email")%>" required=""></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txt_address" required="" placeholder="<%=rs.getString("Shop_address")%>" ></textarea>></td>
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
     <% }

    %>
</html>
        <%@include file="Footer.jsp" %>
