<%@page import="java.sql.ResultSet"%>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="../Assets/Template/Login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
        <div id="tab" align="center">
	            <%

                if (request.getParameter("btnsave") != null) {
                    String email = request.getParameter("txtemail");
                    String password = request.getParameter("txtpswd");
                    
                    String selQry = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    
                      String selQryA = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
                    ResultSet rsA = con.selectCommand(selQryA);

                    
                      String selQryS = "select * from tbl_shop where shop_email='" + email + "' and shop_password='" + password + "'";
                    ResultSet rsS = con.selectCommand(selQryS);


                    if (rs.next()) {
                        session.setAttribute("uid", rs.getString("user_id"));
                        session.setAttribute("uname", rs.getString("user_name"));
                        response.sendRedirect("../User/HomePage.jsp");

                    }
                    else if (rsA.next()) {
                        session.setAttribute("aid", rsA.getString("admin_id"));
                        session.setAttribute("aname", rsA.getString("admin_name"));
                        response.sendRedirect("../Administrator/HomePage.jsp");

                    }
                    else if (rsS.next()) {
                        session.setAttribute("sid", rsS.getString("shop_id"));
                        session.setAttribute("sname", rsS.getString("shop_name"));
                        response.sendRedirect("../Shop/HomePage.jsp");

                    }
                      else {
                        out.println("incorrect password");
                    }
                }
            %>
            <p align="left"><a href="../index.html">Home</a>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('../Assets/Template/Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Account Login
				</span>
                            <form class="login100-form validate-form p-b-33 p-t-5" method="post">

					<div class="wrap-input100 validate-input" data-validate = "Enter email">
						<input class="input100" type="email" name="txtemail" placeholder="User email">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="txtpswd" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
                                            <button type="submit" name='btnsave' class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="../Assets/Template/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/daterangepicker/moment.min.js"></script>
	<script src="../Assets/Template/Login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../Assets/Template/Login/js/main.js"></script>
        </div>
</body>

</html>