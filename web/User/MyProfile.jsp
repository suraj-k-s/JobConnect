<%-- 
    Document   : MyProfile
    Created on : Mar 3, 2024, 9:40:02 PM
    Author     : PSST
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProfile</title>
    </head>
            <%@include file="Header.jsp" %>
                <div id="tab" align="center">

    <%
    
    String sel = "select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
    ResultSet rs = con.selectCommand(sel);
    rs.next();
            
    %>
    <body>
         <form method="POST" name="frmCal">
            <table border="1" align="center">
                <tr>

                    <td colspan="2" align="center">
                        
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td> <%=rs.getString("user_name")%>  </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>  <%=rs.getString("user_email")%> </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("user_address")%> </td>
                </tr>
                



            </table>
        </form>
                </div>
    </body>
</html>
        <%@include file="Footer.jsp" %>
