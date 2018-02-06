<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
	String driverName = "org.postgresql.Driver";
	String connectionUrl = "jdbc:postgresql://localhost:5432/bookingdemo";
	String dbName = "bookingdemo";
	String userId = "postgres";
	String password = "root";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<html>
<head>
<script type="text/javascript">


</script>
<title>Add Bus Route</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
<body>

	<div id="container">

		<header>
		<h1 style="background-color: #d63847c2;">SP Bus Booking</h1>
		</header>

		<nav>
		<div class="width"></div>
		</nav>

		<div id="body" class="width">


			<aside class="sidebar small-sidebar left-sidebar">

			<ul>
				<li>
					<h4>Blocklist</h4>
					<ul class="blocklist">
						<li><a class="selected" href="index.jsp">Home Page</a></li>
						<li><a href="routeDetails.jsp">Route Details</a></li>
						<li><a href="busDetails.jsp">Bus Details</a></li>
						<li><a href="driverDetails.jsp">Drive Details</a></li>
						<li><a href="conductorDetails.jsp">Conductor Details</a></li>
					</ul>
				</li>
			</aside>

			<section id="content" class="three-column"> <article>
			<h2>Bus Route Add</h2>
			<div class="article-info"></div>
			<form action="addBusRoute" name="" onSubmit="return(validate());">

				<table cellpadding="2" width="20%" bgcolor="99FFFF" align="center"
					cellspacing="2">


					<tr>

						<td colspan=2>

							<center>
								<font size=4><b>Bus_Route</b></font>
							</center>

						</td>

					</tr>


					<tr>

						<td>Bus No</td>

						<td><select name="bno">
								<option value="0" >Select Bus No</option>
								<%
									try {
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select * from bus";

										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
								<option value="<%=resultSet.getString(1)%>"><%=resultSet.getString(2)%></option>
								<%
									}
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</select></td>

					</tr>
					<tr>

						<td>Route No</td>

						<td><select name="rno">
								<option value="-1">Select Route No</option>
								<%
									try {
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select * from route";

										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
								<option value="<%=resultSet.getString(1)%>">(<%=resultSet.getString(2)%>-<%=resultSet.getString(3)%>)</option>
								<%
									}
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</select></td>

					</tr>
					<tr>

						<td>Conductor Name</td>

						<td><select name="cno">
								<option value="-1">Select Conductor</option>
								<%
									try {
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select * from conductor";

										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
								<option value="<%=resultSet.getString(1)%>"><%=resultSet.getString(2)%></option>
								<%
									}
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</select></td>

					</tr>
					<tr>

						<td>Driver Name</td>

						<td><select name="dno">
								<option value="-1">Select Bus No</option>
								<%
									try {
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select * from driver";

										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
								<option value="<%=resultSet.getString(1)%>"><%=resultSet.getString(2)%></option>
								<%
									}
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</select></td>

					</tr>
					<tr>

						<td>Seat</td>

						<td><input type="text" name="seat" id="paddress" size="30"></td>

					</tr>
					<tr>

						<td>Date</td>

						<td><input type="date" name="bdate" id="paddress" size="30"></td>

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
