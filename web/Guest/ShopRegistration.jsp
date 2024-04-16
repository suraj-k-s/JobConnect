<%-- 
    Document   : ShopRegist
    Created on : Feb 28, 2024, 1:50:19 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShopRegisteration</title>
    </head>
    <body>
            <%@include file="Header.jsp" %>
    <div id="tab" align="center">

        <form action="../Assets/ActionPages/ShopUploadAction.jsp" method="post" enctype="multipart/form-data" >
            <table border="2" align='center'>
                <tr>
                    <th colspan="2">Shop Registration</th>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select id="district" name="district" required onchange="getPlace(this.value)">
                            <option value="">Select District</option>
                            <%String insQrya = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(insQrya);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Place</td>
                    <td>
                        <select id="sel_place" name="sel_place" required>
                            <option value="">Select Place</option>
                        </select>
                    </td>

                </tr>

                <tr>
                    <td>Shop Name</td>
                    <td><input type="text" name="txt_shopname"  required=""/></td>
                    </td>                </tr>
                <tr>

                    <td>Shop Contact</td>
                    <td><input type="int" name="txt_contact"  required="" pattern="[0-9]{10,10]" required=""/></td>
                </tr>
                <tr>

                    <td>Shop Address</td>
                    <td><textarea name="txt_address"></textarea></td>
                </tr>




                <tr>
                    <td>Shop Email</td>
                    <td><input type="email" name="txt_email" required=""></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_password" required=""></td>

                </tr>
                <tr>
                    <td>Photo</td>
                    <td> <input type="file" name="file_photo"></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td> <input type="file" name="file_proof"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="btncancel" value="Cancel">
                </tr>
            </table>
        </form>
    </div>
    </body>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                            function getPlace(did)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                    success: function(result) {
                                        $("#sel_place").html(result);

                                    }
                                });
                            }</script>

</html>
<%@include file="Footer.jsp" %>