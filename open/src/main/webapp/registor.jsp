<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer registraiont</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<script type="text/javascript">
	function validate() {
		if (document.StudentRegistration.textnames.value == "") {
			alert("Please provide your Name!");
			document.StudentRegistration.textnames.focus();
			return false;
		}
		if (document.StudentRegistration.fathername.value == "") {
			alert("Please provide your Father Name!");
			document.StudentRegistration.fathername.focus();
			return false;
		}

		if (document.StudentRegistration.paddress.value == "") {
			alert("Please provide your Postal Address!");
			document.StudentRegistration.paddress.focus();
			return false;
		}
		if (document.StudentRegistration.personaladdress.value == "") {
			alert("Please provide your Personal Address!");
			document.StudentRegistration.personaladdress.focus();
			return false;
		}
		if ((StudentRegistration.sex[0].checked == false)
				&& (StudentRegistration.sex[1].checked == false)) {
			alert("Please choose your Gender: Male or Female");
			return false;
		}
		if (document.StudentRegistration.City.value == "-1") {
			alert("Please provide your City!");
			document.StudentRegistration.City.focus();
			return false;
		}
		if (document.StudentRegistration.Course.value == "-1") {
			alert("Please provide your Course!");

			return false;
		}
		if (document.StudentRegistration.District.value == "-1") {
			alert("Please provide your Select District!");

			return false;
		}
		if (document.StudentRegistration.State.value == "-1") {
			alert("Please provide your Select State!");

			return false;
		}
		if (document.StudentRegistration.pincode.value == ""
				|| isNaN(document.StudentRegistration.pincode.value)
				|| document.StudentRegistration.pincode.value.length != 6) {
			alert("Please provide a pincode in the format ######.");
			document.StudentRegistration.pincode.focus();
			return false;
		}
		var email = document.StudentRegistration.emailid.value;
		atpos = email.indexOf("@");
		dotpos = email.lastIndexOf(".");
		if (email == "" || atpos < 1 || (dotpos - atpos < 2)) {
			alert("Please enter correct email ID")
			document.StudentRegistration.emailid.focus();
			return false;
		}
		if (document.StudentRegistration.dob.value == "") {
			alert("Please provide your DOB!");
			document.StudentRegistration.dob.focus();
			return false;
		}
		if (document.StudentRegistration.mobileno.value == ""
				|| isNaN(document.StudentRegistration.mobileno.value)
				|| document.StudentRegistration.mobileno.value.length != 10) {
			alert("Please provide a Mobile No in the format 123.");
			document.StudentRegistration.mobileno.focus();
			return false;
		}
		return (true);
	}
</script>
</head>
<body>
<body>
	<div id="container">

		<header>
		<h1 style="background-color: #d63847c2;">SP Bus Booking</h1>
		</header>

		<nav>
		<div class="width">
			<ul>
				<!-- 					<li class="start selected"><a href="index.html">Home</a></li> -->
				<!-- 					<li class=""><a href="examples.html">Examples</a></li> -->
				<!-- 					<li><a href="two-column.html">Two column</a></li> -->
				<!-- 					<li><a href="#">Solutions</a></li> -->
				<!-- 					<li class="end"><a href="#">Contact</a></li> -->
				<form method="get" class="searchform" action="#">
					<li class="start"><input type="text" placeholder="FROM"
						name="from" style="margin: 10px;" /></li>
					<li class="start"><input type="text" placeholder="TO"
						name="TO" style="margin: 10px;" /></li>
					<li class="start"><input type="button" value="GO"
						style="margin: 10px; color: #fff; background-color: #d63847; display: inline-block; border-bottom-color: #215DA1; padding: 8px 15px; text-decoration: none; text-transform: uppercase;" /></li>
				</form>
			</ul>
		</div>
		</nav>

		<div id="body" class="width">


			<aside class="sidebar small-sidebar left-sidebar">

			<ul>
				<li>
					<h4>Blocklist</h4>
					<ul class="blocklist"><li><a class="selected" href="index.jsp">Home Page</a></li>
						<li><a href="routeDetails.jsp">Route Details</a></li>
						<li><a href="busDetails.jsp">Bus Details</a></li>
						<li><a href="driverDetails.jsp">Drive Details</a></li>
						<li><a href="conductorDetails.jsp">Conductor Details</a></li>					</ul>
					
				</li>
			</aside>

			<section id="content" class="three-column"> <article>


			<h2>Regitration Passenger</h2>
			<h4>${result}</h4>
			<div class="article-info"></div>
			<form action="Passenger" name="StudentRegistration"
				onSubmit="return(validate());">

				<table cellpadding="2" width="20%" bgcolor="99FFFF" align="center"
					cellspacing="2">


					<tr>

						<td colspan=2>

							<center>
								<font size=4><b>Passenger Registration Form</b></font>
							</center>

						</td>

					</tr>


					<tr>

						<td>Name</td>

						<td><input type=text name="name" id="textname" size="30" required></td>

					</tr>
					<tr>

						<td>Address</td>

						<td><input type="text" name="address" id="paddress"
							size="30" required></td>

					</tr>
					<tr>

						<td>Gender</td>

						<td><input type="radio" name="gender" value="male" size="10">Male

							<input type="radio" name="gender" value="Female" size="10">Female</td>

					</tr>



					<tr>

						<td>EmailId</td>

						<td><input type="text" name="email" id="emailid" size="30" required></td>

					</tr>
					<tr>

						<td>MobileNo</td>

						<td><input type="text" name="phoneno" id="mobileno"
							size="30" required></td>

					</tr>
					<tr>

						<td>Adhar No</td>

						<td><input type="text" name="adhar" id="pincode" size="30" required>
<!-- 						<a href="verify?name="><input type="button" value="Verify"></a> -->
						<form action="verify" method="get">
						<input type="submit" value="Verify">
						</form>
						</td>
    

					</tr>
					<tr>

						<td>User Name</td>

						<td><input type="text" name="userName" id="userName"
							size="30" required></td>


					</tr>
					<tr>

						<td>Password</td>

						<td><input type="text" name="pass" id="pass" size="30" required></td>


					</tr>
					<tr>

						<td>Re-type Password</td>

						<td><input type="text" name="pass2" id="pass2" size="30" required></td>


					</tr>
					<tr>

						<td><input type="reset"></td>

						<td colspan="2"><input type="submit" value="Submit Form" /></td>

					</tr>

				</table>

			</form>







			</article> </section>

			<aside class="sidebar small-sidebar right-sidebar"> </aside>
			<div class="clear"></div>
		</div>
		<footer>
		<div class="footer-content width">
			<h4>About us</h4>

			<p style="margin: 0;">
				Aenean nec massa a tortor auctor sodales sed a dolor. Duis vitae
				lorem sem. Proin at velit vel arcu pretium luctus. <a href="#"
					class="readmore">Read More &raquo;</a>
			</p>


			<div class="clear"></div>
		</div>
		<div class="footer-bottom">
			<p>&copy;copyright are resereved @ AkshayD</p>
		</div>
		</footer>
	</div>
</body>
</html>
