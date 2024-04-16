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


    <%    if (request.getParameter("accept") != null) {

            DB.mailconnection m = new DB.mailconnection();
            String mailid[] = {request.getParameter("email")};

            String updQry = "update tbl_request SET request_status=1 where ads_id='" + request.getParameter("accept") + "'";
            con.executeCommand(updQry);
            String name = request.getParameter("name");
            String subject = "Confirmation";
            String text = "Respected " + name + ", \r\n \r\n"
                    + " We are pleased to offer you the position of "+request.getParameter("title")
                    + " at "+request.getParameter("sname")+" We feel confident that you will contribute your skils and experience towards the growth of our organization."
                    + " Please confirm your acceptance by visiting our office head soon within a week"
                    + " This is from Job Connect \r\n"
                    + " Team Job Connect.";
            boolean b = m.sendMail(mailid, subject, text);
            if(b)
            {
                response.sendRedirect("ViewRequest.jsp");
            }
        }

        if (request.getParameter("reject") != null) {

            String updQry = "update tbl_request SET request_status=2 where ads_id='" + request.getParameter("reject") + "'";
            con.executeCommand(updQry);
        }

    %>
    <body>

        <div id="tab" align="center">
            <table border="2" align="center">


                <tr >
                    <th>Sl.No</th>
                    <th> USER_NAME </th>
                    <th>Resume</th>
                    <th> DATE </th>
                    <th> ADS NAME</th>
                    <th>Action</th>

                </tr>


                <%        int i = 0;
                    String selQry1 = "select * from tbl_request r inner join tbl_ads a  on r.ads_id=a.ads_id inner join tbl_shop s on s.shop_id=a.shop_id inner join tbl_user u on u.user_id=r.user_id";
                    ResultSet rss = con.selectCommand(selQry1);
                    while (rss.next()) {

                        i++;

                %>
                <tr>
                    <td ><%=i%></td>
                    <td ><%=rss.getString("user_name")%></td>
                    <td ><a href="../Assets/Files/<%=rss.getString("user_proof")%>" download>Download</a></td>
                    <td ><%=rss.getString("ads_date")%></td>
                    <td ><%=rss.getString("ads_title")%></td>
                    <td ><% if (rss.getString("request_status").equals("0")) {%>
                        <a href="ViewRequest.jsp?accept=<%=rss.getString("ads_id")%>&email=<%=rss.getString("user_email")%>&name=<%=rss.getString("user_name")%>&sname=<%=rss.getString("shop_name")%>&title=<%=rss.getString("ads_title")%>">Accept/</a>
                        <a href="ViewRequest.jsp?reject=<%=rss.getString("ads_id")%>">reject</a></td> 
                        <%  } else if (rss.getString("request_status").equals("1")) { %>
                    Accepted
                    <% } else if (rss.getString("request_status").equals("2")) { %>
                    Rejected
                    <% } %>
                </tr>

                <%                      }


                %>


            </table>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>

