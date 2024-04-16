<%-- 
    Document   : Ads
    Created on : Mar 15, 2024, 3:26:08 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="Header.jsp" %>


    <body>  
        <div id="tab" align="center">
            <form method="post">

                <table border="1" align="center">

                    <tr>
                        <td>Select Region</td>
                        <td>
                            <select name="selDistrict" required="">
                                <option value="">--select--</option>
                                <%
                                    String selQry = "select * from tbl_place";
                                    ResultSet rs = con.selectCommand(selQry);
                                    while (rs.next()) {
                                %>

                                <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
                                <%
                                    }
                                %>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Job Type   </td>
                        <td>
                            <select name="selJob" required="">
                                <option value="">--select--</option>
                                <%
                                    String selQryl = "select * from tbl_type";
                                    ResultSet js = con.selectCommand(selQryl);
                                    while (js.next()) {
                                %>

                                <option value="<%=js.getString("type_id")%>"><%=js.getString("type_name")%></option>
                                <%
                                    }
                                %>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_save" value="Search">
                        </td>
                    </tr>
                </table>
            </form>
            <h2 align="center">Ads</h2>
            <table align="center">
                <tr>
                    <%
                        if (request.getParameter("accept") != null) {

                            String insQry = "insert into tbl_request (ads_id,user_id,request_date) values ('" + request.getParameter("accept") + "','" + session.getAttribute("uid") + "',curdate())";
                            if (con.executeCommand(insQry)) {

                                 %>
                                <script>
                                    alert("Accepted")
                                    window.location = "Ads.jsp";
                                </script><%                                    }
                    }

                    int i = 0;
                    String selQry1 = "select * from tbl_ads a inner join tbl_type t on a.type_id=t.type_id where ads_status=1";
                    if (request.getParameter("btn_save") != null) {
                        String district = request.getParameter("selDistrict");
                        String type = request.getParameter("selJob");

                        selQry1 += " and place_id='"+district+"' and t.type_id='"+type+"'";
                    }

                    ResultSet rss = con.selectCommand(selQry1);
                    while (rss.next()) {

                        i++;

                %>
                <td >
                    <table border="1" style="margin: 20px">
                        <tr>
                            <td>TITLE</td>
                            <td ><%=rss.getString("ads_title")%></td> </tr>
                        <tr>
                            <td >MODE</td> 
                            <td ><%=rss.getString("ads_mode")%></td>   </tr>
                        <tr>
                            <td>DETAILS</td>  
                            <td ><%=rss.getString("ads_details")%></td> </tr>
                        <tr>
                            <td>WAGE</td> 
                            <td ><%=rss.getString("ads_wage")%></td>   </tr>
                        <tr>
                            <td>TYPE</td>
                            <td ><%=rss.getString("type_name")%></td>   </tr>
                        <tr>
                            <td colspan="2" align="center" >
                                <a href="Ads.jsp?accept=<%=rss.getString("ads_id")%>">Apply</a>
                            </td>     
                        </tr>
                    </table>
                </td>
                <%

                        if (i == 4) {
                            out.println("</tr><tr>");
                            i = 0;
                        }

                    }


                %>
            </table>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>

