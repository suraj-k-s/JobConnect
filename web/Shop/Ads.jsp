<%-- 
    Document   : Ads
    Created on : Mar 15, 2024, 2:33:56 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ads</title>
    </head>
    <%@include file="Header.jsp" %>
    <div id="tab" align="center">


        <%

            if (request.getParameter("btn_save") != null) {
                String title = request.getParameter("txttitle");
                String mode = request.getParameter("txtmode");
                String details = request.getParameter("txtdetails");
                String wage = request.getParameter("txtwage");
                String type = request.getParameter("seltype");
                String place = request.getParameter("selplace");

                String insQry = "insert into tbl_ads (ads_title,ads_mode,ads_details,ads_wage,type_id,Shop_id,ads_date,place_id) values('" + title + "','" + mode + "','" + details + "','" + wage + "','" + type + "','" + session.getAttribute("sid") + "',curdate(),'" + place + "')";
                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Record Saved");
            window.location = "Ads.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location = "Ads.jsp";
        </script>
        <%
                }
            }

        %>
        <%    if (request.getParameter("del") != null) {
                String delQry = "delete from tbl_ads where ads_id='" + request.getParameter("del") + "'";
                con.executeCommand(delQry);
                response.sendRedirect("Ads.jsp");
            }

        %>

        <body>
            <form method="POST" name="frmCal">
                <table border="1" align="center">
                    <tr>
                        <td>Title</td>
                        <td><input type="text" name="txttitle"  required=""></td>
                    </tr>
                    <tr>
                        <td>Mode</td>
                        <td><input type="text" name="txtmode" required=""></td>

                    </tr>
                    <tr>
                        <td>Details</td>
                        <td><textarea name="txtdetails" required=""> </textarea></td>
                    </tr>
                    <tr>
                        <td>Wage</td>
                        <td><input type="text" name="txtwage" required=""></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><select name="seltype">
                                <option value="">--select--</option>
                                <%                                String selQry = "select * from tbl_type";
                                    ResultSet rs = con.selectCommand(selQry);
                                    while (rs.next()) {
                                %>

                                <option value="<%=rs.getString("type_id")%>"><%=rs.getString("type_name")%></option>
                                <%
                                    }
                                %>
                            </select></td>
                    </tr><tr>
                        <td>Place</td>
                        <td><select name="selplace">
                                <option value="">--select--</option>
                                <%
                                    String selQryl = "select * from tbl_place";
                                    ResultSet ps = con.selectCommand(selQryl);
                                    while (ps.next()) {
                                %>

                                <option value="<%=ps.getString("place_id")%>"><%=ps.getString("place_name")%></option>
                                <%
                                    }
                                %>
                            </select></td>
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


    <table border="2" align="center">


        <tr >
            <th >Sl.No</th>
            <th >TITLE</th>
            <th >MODE</th>
            <th >DETAILS</th>
            <th >WAGE</th>
            <th >TYPE</th>
            <th> ACTION</th>

        </tr>


        <%        int i = 0;
            String selQry1 = "select * from tbl_ads a inner join tbl_type t on a.type_id=t.type_id where shop_id='" + session.getAttribute("sid") + "'";
            ResultSet rss = con.selectCommand(selQry1);
            while (rss.next()) {

                i++;

        %>
        <tr>
            <td ><%=i%></td>
            <td ><%=rss.getString("ads_title")%></td>
            <td ><%=rss.getString("ads_mode")%></td>
            <td ><%=rss.getString("ads_details")%></td>
            <td ><%=rss.getString("ads_wage")%></td>
            <td ><%=rss.getString("type_name")%></td>
            <td ><a href="Ads.jsp?del=<%=rss.getString("ads_id")%>">Delete</a></td>
        </tr>

        <%                      }


        %>


    </table>
</body>
</html>
<%@include file="Footer.jsp" %>

