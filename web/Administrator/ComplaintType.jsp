<%-- 
    Document   : ComplaintType
    Created on : Feb 28, 2024, 2:40:00 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ComplaintType</title>
    </head>
            <%@include file="Header.jsp" %>
                   <div id="tab" align="center">

    <body>
        <%
            if (request.getParameter("btnsave") != null) {

                String ComplaintType = request.getParameter("txtcomplainttype");
                String insQry = "insert into tbl_complainttype (complaintType_name) values ('" + ComplaintType + "')";

                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved")
            window.location = "ComplaintType.jsp";
        </script>
        <%
                }
            }

        %>
        
        <%
           if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_complainttype where complaintType_id ='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("ComplaintType.jsp");
            }

        %>

        
        %>
        <form method="post">
            <table border="2"><tr>
                    <td>ComplaintType Name </td>
                    <td><input type="text" name="txtcomplainttype" placeholder="Enter ComplaintType" required=""></td>
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
<table border="1" align="center">


    <tr >
        <th >Sl.No</th>
        <th >Name</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_complainttype";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("complaintType_name")%></td>
        <td ><a href="ComplaintType.jsp?del=<%=rs.getString("complaintType_id")%>">Delete</a></td>
    </tr>
      <%                      }


    %>
</table>
        <%@include file="Footer.jsp" %>

