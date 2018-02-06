<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
<head>
<title>Bus-Route Details</title>
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
			<h2>
			</h2>
			<table>
				<tr>
					<td><b>Bus No</b></td>
					<td><b>Route</b></td>
					<td><b>Conductor</b></td>
					<td><b>Driver</b></td>
					<td><b>Date</b></td>
					<td><b>Price</b></td>
					<td><b>Bus Type</b></td>
					<td><b>Available Seat</b></td>
					<td><b>Book Ticket</b></td>
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
					String s = request.getParameter("from");
					String d = request.getParameter("to");
					String date = request.getParameter("date");
					Connection connection = null;
					Statement statement = null;
					ResultSet resultSet = null;
				%>
				<%
					try {
						connection = DriverManager.getConnection(connectionUrl, userId, password);
						statement = connection.createStatement();
						String sql = "SELECT bus.bno,route.source,route.destination,conductor.cname,driver.dname,seat2,date,bus.price,bus.btype,bus.bid,bus.dtime,route.rid from conductor,bus,driver,route,b2_r2 WHERE bus.bid=b2_r2.bid and conductor.cno=b2_r2.cno and driver.dno=b2_r2.dno and route.rid=b2_r2.rid AND route.source='"
								+ s + "' and route.destination='" + d + "' and b2_r2.date='"+date+"';";

						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
				%>
				<tr>
					<td><%=resultSet.getString(1)%></td>
					<td><%=resultSet.getString(2)%>-<%=resultSet.getString(3)%></td>
					<td><%=resultSet.getString(4)%></td>
					<td><%=resultSet.getString(5)%></td>
					<td><%=resultSet.getString(7)%></td>
					<td><%=resultSet.getString(8)%></td>
					<td><%=resultSet.getString(9)%></td>
					<td><%=resultSet.getString(6)%></td>
					<td><a href="bookTicket.jsp?bno=<%=resultSet.getString(1)%>&source=<%=resultSet.getString(2)%>&destinaton=<%=resultSet.getString(3)%>&bid=<%=resultSet.getString(10)%>&con=<%=resultSet.getString(4)%>&driver=<%=resultSet.getString(5)%>&date=<%=resultSet.getString(7)%>&price=<%=resultSet.getString(8)%>&btype=<%=resultSet.getString(9)%>&as=<%=resultSet.getString(6)%>&dtime=<%=resultSet.getString(11)%>&rid=<%=resultSet.getString(12)%>"><button>Book Ticket</button></a></td>
				</tr>
				<%
					}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
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
			<p>&copy;copyright are resereved @ AkshayD</p>
		</div>
		</footer>
	</div>

</body>
</html>
