<%-- 
    Document   : Category
    Created on : Feb 2, 2024, 5:07:56 PM
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
                String CategoryName = request.getParameter("txtname");
                String insQry = "insert into tbl_category(category_name)values('" + CategoryName + "') ";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Category.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Category.jsp";
        </script>
        <%
                }
            }

        %>

        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_category where category_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Category.jsp");
            }

        %>


        <form method="POST" name="frmCal">
            <table>
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" name="txtname" placeholder="Enter Category" required=""></td>
                </tr>

                <tr>

                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="btncancel" value="Cancel">

                    </td>
                </tr>

            </table>
        </form>
       </div>
    </body>
</html>

<table border="1" align="center ">


    <tr >
        <th >Sl.No</th>
        <th >Category</th>
        <th >Action</th>
    </tr>


    <%        int i = 0;
        String selQry = "select * from tbl_category";
        ResultSet rs = con.selectCommand(selQry);
        while (rs.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rs.getString("category_name")%></td>
        <td ><a href="Category.jsp?del=<%=rs.getString("category_id")%>">Delete</a></td>
    </tr>
    <%                      }


    %>


</table>
        <%@include file="Footer.jsp" %>
