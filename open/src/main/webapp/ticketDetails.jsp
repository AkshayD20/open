<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page language="java" import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
<head>
<title>Ticket Details</title>
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
							<li><a class="selected" href="Pindex.jsp">Home Page</a></li>

						</ul>
					</li>
			</aside>

			<section id="content" class="three-column">
				<article>
					${result}

					<table>
						<tr>
							<td><b>Ticket No</b></td>
							<td><b>Bus No</b></td>
							<td><b>Route</b></td>
							<td><b>Date</b></td>
							<td><b>Departure Time</b></td>
							<td><b>Price</b></td>
							<td><b>Seat No</b></td>
							<td><b>Status</b><br>Click to cancel</td>
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
								String sql = "select * from tickets";

								resultSet = statement.executeQuery(sql);
								while (resultSet.next()) {
						%>
						<tr>
							<td><%=resultSet.getString(1)%></td>
							<td><%=resultSet.getString(2)%></td>
							<td><%=resultSet.getString(3)%>-<%=resultSet.getString(4)%></td>
							<td><%=resultSet.getString(6)%></td>
							<td><%=resultSet.getString(7)%></td>
							<td><%=resultSet.getString(8)%></td>
							<td><%=resultSet.getString(9)%></td>
							<% 
								if(resultSet.getString(10).equalsIgnoreCase("Canceld")){
							%>
							<td><a href="#"><button><%=resultSet.getString(10)%></button></a></td>
							<% 
								}else{
							%>
							<td><a
								href="Cancel?tid=<%=resultSet.getString(1)%>&date=<%=resultSet.getString(6)%>&bno=<%=resultSet.getString(2)%>&source=<%=resultSet.getString(3)%>&des=<%=resultSet.getString(4)%>"><button><%=resultSet.getString(10)%></button></a></td>
							<%
							}
							%>
						</tr>
						<%
							}
							} catch (Exception e) {
								// TODO Auto-generated catch block
								System.out.println(e);
							}
						%>
					</table>
				</article>
			</section>

			<aside class="sidebar small-sidebar right-sidebar"></aside>
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
