<%-- 
    Document   : ViewRequest
    Created on : Mar 16, 2024, 2:12:52 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewRequest</title>
    </head>
            <%@include file="Header.jsp" %>
                <div id="tab" align="center">

    <%    if (request.getParameter("accept") != null) {

            String updQry = "update tbl_request SET request_status=1 where ads_id='" + request.getParameter("ads_idS") + "'";
            con.executeCommand(updQry);
    }

    %>
    <body>
     

<table border="2" align="center">


    <tr >
        <th>Sl.No</th>
        <th> SHOP_NAME </th>
        <th> DATE </th>
        <th> ADS NAME</th>
        <th> STATUS</th>
        
                
    </tr>


    <%        int i = 0;
        String selQry1 = "select * from tbl_request r inner join tbl_ads a  on r.ads_id=a.ads_id inner join tbl_shop u on u.shop_id=a.shop_id where user_id = '"+session.getAttribute("uid")+"'";
          ResultSet rss = con.selectCommand(selQry1);
        while (rss.next()) {

            i++;

    %>
    <tr>
        <td ><%=i%></td>
        <td ><%=rss.getString("shop_name")%></td>
        <td ><%=rss.getString("ads_date")%></td>
        <td ><%=rss.getString("ads_title")%></td>
        <td> <% 
        if(rss.getString("request_status").equals("0")) 
        {
            out.println("Pending");
        }
        else if(rss.getString("request_status").equals("1")) 
        {
            out.println("Accepted");
        }
        else if(rss.getString("request_status").equals("2")) 
        {
            out.println("Rejected");
        }
        %></td>  
        </tr>
    
    <%                      }


    %>


</table>
                </div>
    </body>
</html>
        <%@include file="Footer.jsp" %>

