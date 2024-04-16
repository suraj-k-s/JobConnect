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
                String subcategoryName = request.getParameter("txtname");
                String catid = request.getParameter("selCategory");
                String insQry = "insert into tbl_subcategory(subcategory_name,category_id)values('" + subcategoryName + "','" + catid + "') ";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Subcategory.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Subcategory.jsp";
        </script>
        <%
                }
            }

        %>

        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_subcategory where subcategory_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Subcategory.jsp");
            }

        %>


        <form method="POST" name="frmCal">
            <table>
                <tr>
                    <td> Category</td>
                    <td>
                        <select name="selCategory">
                            <%                                String selQry = "select * from tbl_category";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
                            <%
                                }
                            %>


                    </td>
                </tr>

                <tr>
                    <td>Subcategory Name</td>
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
        <th >subcategory</th>
        <th >category</th>
        <th >Action</th>
    </tr>


    <%         int i = 0;
        String selQry1 = "select * from tbl_subcategory c inner join tbl_category s on c.category_id=s.category_id";
        ResultSet rs1 = con.selectCommand(selQry1);
        while (rs1.next()) {

            i++;
    %>
    <tr>

        <td ><%=i%></td>
        <td ><%=rs1.getString("subcategory_name")%></td>
        <td ><%=rs1.getString("category_name")%></td>
        <td ><a href="Subcategory.jsp?del=<%=rs1.getString("subcategory_id")%>">Delete</a></td>

    </tr>
    <%
        }
    %>


</table>
            <%@include file="Footer.jsp" %>

