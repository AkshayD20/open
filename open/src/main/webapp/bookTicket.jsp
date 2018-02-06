<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer registraiont</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<body>
	<%
		if (session.getAttribute("name") == null) {
			response.sendRedirect("registor.jsp");
		}
	%>
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
				<!-- <form method="get" class="searchform" action="#">
					<li class="start"><input type="text" placeholder="FROM"
						name="from" style="margin: 10px;" /></li>
					<li class="start"><input type="text" placeholder="TO"
						name="TO" style="margin: 10px;" /></li>
					<li class="start"><input type="button" value="GO"
						style="margin: 10px; color: #fff; background-color: #d63847; display: inline-block; border-bottom-color: #215DA1; padding: 8px 15px; text-decoration: none; text-transform: uppercase;" /></li>
				</form> -->
			</ul>
		</div>
		</nav>

		<div id="body" class="width">


			<aside class="sidebar small-sidebar left-sidebar">

			<ul>
				<li>
					<h4>Blocklist</h4>
					<ul class="blocklist">
						<li><a class="selected" href="Pindex.jsp">Home Page</a></li>
				</li>
			</aside>

			<section id="content" class="three-column"> <article>


			<h2>Book Ticket</h2>
			<div class="article-info"></div>
			<form action="BookTicket" name="StudentRegistration">

				<table cellpadding="2" width="20%" bgcolor="99FFFF" align="center"
					cellspacing="2">


					<tr>

						<td colspan=2>

							<center>
								<font size=4><b>Book Ticket</b></font>
							</center>

						</td>

					</tr>


					<tr>

						<td>Bus No</td>

						<td><input type="text" name="bno" size="30"
							value="<%=request.getParameter("bno")%>" readonly="false"></td>

					</tr>
					<tr>

						<td>Source</td>

						<td><input type="text" name="source" size="30"
							value="<%=request.getParameter("source")%>" readonly="false"></td>

					</tr>
					<tr>

						<td>Destination</td>

						<td><input type="text" name="destination" id="paddress"
							size="30" value="<%=request.getParameter("destinaton")%>"
							readonly="false"></td>

					</tr>
					<tr>

						<td>Passenger Name</td>

						<td><select name="pid"><option
									value="<%=session.getAttribute("id")%>"><%=session.getAttribute("name")%></option></select>
							<%-- <input type="text" name="pid" id="paddress" size="30"  value="<%=session.getAttribute("id")%>" > --%></td>

					</tr>

					<tr>

						<td>Date</td>

						<td><input type="text" name="date" size="30"
							value="<%=request.getParameter("date")%>" readonly="false"></td>

					</tr>
					<tr>

						<td>departur Time</td>

						<td><input type="text" name="dtime" size="30"
							value="<%=request.getParameter("dtime")%>" readonly="false"></td>


					</tr>
					<tr>

						<td>Price</td>

						<td><input type="text" name="price" size="30"
							value="<%=request.getParameter("price")%>" readonly="false"></td>


					</tr>
					<tr>

						<td>Seat No:-</td>

						<td><select name="sno"><option value="0">Select
									Seat No</option>
								<%
									try {
										int n = Integer.parseInt(request.getParameter("as"));

										List<Integer> snotemp2 = new ArrayList<Integer>();
										List<Integer> snotemp1 = new ArrayList<Integer>();
										for (int i1 = 0; i1 <= n; i1++) {
											snotemp1.add((Integer) i1);
										}
										// 										Iterator itr=snotemp.iterator();
										/* 	List snotemp=new ArrayList();
											for(int i1=0;i1<=n;i1++){
												snotemp.add(i1);
											}
											Iterator itr=snotemp.iterator(); */
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select sno from tickets where date='" + request.getParameter("date") + "' and bno='"
												+ request.getParameter("bno") + "' and dtime='" + request.getParameter("dtime")
												+ "' and source='" + request.getParameter("source") + "' and destination='"
												+ request.getParameter("destinaton") + "' and status='Booked'";
										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
											int temp = Integer.parseInt(resultSet.getString(1));
											System.out.println("HEY" + temp);
											snotemp2.add(temp);
										}
										System.out.println("HII");
										/* Iterator<Integer> itr1 = snotemp1.iterator();
										System.out.println("HII1");
										Iterator<Integer> itr2 = snotemp2.iterator();
										System.out.println("HII2"); */
										for (int c1 = 1; c1 < snotemp2.size(); c1++) {

											for (int c2 = 1; c2 < snotemp1.size(); c2++) {
												if(snotemp1.get(c2)==snotemp2.get(c1)){
													snotemp1.remove(c2);
												}
											}
										}
										for(int c3=1;c3<snotemp1.size();c3++){
								%>
								<option value="<%=snotemp1.get(c3)%>"><%=snotemp1.get(c3)%></option>
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

						<td>Status</td>

						<td><input type="text" name="status" value="Booked"
							readonly="false"> <input type="text" name="bid"
							value="<%=request.getParameter("bid")%>" readonly="false">
							<input type="text" name="rid"
							value="<%=request.getParameter("rid")%>" readonly="false">
							<input type="text" name="as"
							value="<%=request.getParameter("as")%>" readonly="false">
						</td>


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
