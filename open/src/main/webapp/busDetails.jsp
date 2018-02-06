<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page language="java" import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
<head>
<title>Bus Details</title>
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
			${result}
			<h2>
				<a href="busAdd.jsp"><button>Add Bus</button></a>
			</h2>
			<table>
				<tr>
					<td><b>Bus No</b></td>
					<td><b>Bus Type</b></td>
					<td><b>Bus Seat</b></td>
					<td><b>Bus Price</b></td>
					<td><b>Bus Departuer Time</b></td>
					<td><b>Update</b></td>
					<td><b>Delete</b></td>
				</tr>

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
				<%
					try {
						connection = DriverManager.getConnection(connectionUrl, userId, password);
						statement = connection.createStatement();
						String sql = "select * from bus";

						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
				%>
				<tr>
					<td><%=resultSet.getString(2)%></td>
					<td><%=resultSet.getString(3)%></td>
					<td><%=resultSet.getString(4)%></td>
					<td><%=resultSet.getString(5)%></td>
					<td><%=resultSet.getString(6)%></td>
					<td><a href="BusUpdate?action=update&bid=<%=resultSet.getString(1)%>">Update Bus</a></td>
					<td><a href="BusUpdate?action=delete&bid=<%=resultSet.getString(1)%>">Delete Bus</a></td>
				</tr>
				<%
					}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						System.out.println(e);
					}
				%>
			</table>
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
			<p>&copy;copyright are resereved @Shabdali&@Chaitrali</p>
		</div>
		</footer>
	</div>

</body>
</html>
