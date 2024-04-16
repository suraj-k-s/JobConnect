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
    <%    if (request.getParameter("accept") != null) {

            String updQry = "update tbl_ads SET ads_status=1 where ads_id='" + request.getParameter("accept") + "'";
            con.executeCommand(updQry);

    %>
    <script>
        alert("Accepted")
        window.location = "Ads.jsp";
    </script><%                    }

        if (request.getParameter("reject") != null) {

            String updQryl = "update tbl_ads SET ads_status=2 where ads_id='" + request.getParameter("reject") + "'";
            con.executeCommand(updQryl);
    %>
    <script>
        alert("Rejected")
        window.location = "Ads.jsp";
    </script>
    <%
        }

    %>

        <%@include file="Header.jsp" %>

    <body>
        <h2 align="center">Ads</h2>
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
                String selQry1 = "select * from tbl_ads a inner join tbl_type t on a.type_id=t.type_id";
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
                <td ><a href="Ads.jsp?accept=<%=rss.getString("ads_id")%>">Accept/</a>
                    <a href="Ads.jsp?reject=<%=rss.getString("ads_id")%>">reject</a></td>
            </tr>

            <%                      }


            %>


        </table>
        <%@include file="Footer.jsp" %>
