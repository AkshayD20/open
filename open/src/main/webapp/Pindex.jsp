<html>
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
<head>
<title>SP Bus Booking</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
	<%
		if(session.getAttribute("name")==null){
			response.sendRedirect("index.jsp");
		}
	%>

	<div id="container">

		<header>
			<h1 style="background-color: #d63847c2;">SP Bus Booking</h1>
		</header>

		<nav>
			<div class="width">


				<ul>
					<form method="get" class="searchform" action="SearchRoute.jsp">
						<li class="start"><select name="from">
								<option value="0" >Source</option>
								<%
									try {
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select * from route";

										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
								<option value="<%=resultSet.getString(2)%>"><%=resultSet.getString(2)%></option>
								<%
									}
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</select></li>
						<li class="start"><select name="to">
								<option value="0" >Destination</option>
								<%
									try {
										connection = DriverManager.getConnection(connectionUrl, userId, password);
										statement = connection.createStatement();
										String sql = "select * from route";

										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
								<option value="<%=resultSet.getString(3)%>"><%=resultSet.getString(3)%></option>
								<%
									}
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
						</select></li>
						<li class="start"><input type="date" placeholder="Date"
							name="date" style="margin: 10px;" required="true" /></li>
						<li class="start"><input type="submit" value="GO"
							style="margin: 10px; color: #fff; background-color: #d63847; display: inline-block; border-bottom-color: #215DA1; padding: 8px 15px; text-decoration: none; text-transform: uppercase;" /></li>
						<li class="start"
							style="margin: 10px; color: #fff; background-color: #d63847; display: inline-block; border-bottom-color: #215DA1; padding: 8px 15px; text-decoration: none; text-transform: uppercase;">WellCome
							${name}</li>
							<li class="start" style="margin: 10px; color: #fff; background-color: #d63847; display: inline-block; border-bottom-color: #215DA1; padding: 8px 15px; text-decoration: none; text-transform: uppercase;"><a href="LogOut"><button>LogOut</button></a></li>
					</form>
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
							<li><a class="selected" href="ticketDetails.jsp">Book History Details</a></li>
						</ul>
					</li>
			
				</ul>

			</aside>

			<section id="content" class="three-column">

				<article>


					<h2>${result}<br>Introduction Sp Bus Booking
					</h2>
					<div class="article-info">
						Posted on
						<time datetime="2013-05-14">14 May</time>
						by <a href="#" rel="author">Joe Bloggs</a>
					</div>

					<p>
						Welcome to monopoly, a free valid CSS3 &amp; HTML5 responsive web
						template from <a href="http://zypopwebtemplates.com/"
							title="ZyPOP">ZyPOP</a>. This template is completely <strong>free</strong>
						to use permitting a link remains back to <a
							href="http://zypopwebtemplates.com/" title="ZyPOP">http://zypopwebtemplates.com/</a>.
						Should you wish to use this template unbranded you can buy a
						template license from our website for 8.00 GBP, this will allow
						you remove all branding related to our site, for more information
						about this see below.
					</p>

					<p>This template has been tested in:</p>


					<ul class="styledlist">
						<li>Firefox</li>
						<li>IE</li>
						<li>Safari</li>
						<li>Chrome</li>
					</ul>

					<a href="#" class="button">Read more</a> <a href="#"
						class="button button-reversed">Comments</a>



				</article>


			</section>

			<aside class="sidebar small-sidebar right-sidebar">

				<ul>
					<li>
					
						<ul>
							<li class="text">

								<p>

								</p>


							</li>
						</ul>
					</li>

					<li>
						<h4>News</h4>
						<ul class="newslist">
							<li>
								<p>
									<span class="newslist-date">Jul 21</span> Quisque hendrerit
									lorem sit amet dui viverra dictum. Phasellus imperdiet magna
									sit amet arcu tristique ultricies ut in dui.
								</p>
							</li>

							<li>
								<p>
									<span class="newslist-date">May 09</span> Mauris et felis
									semper, congue dui ac, iaculis ipsum. Fusce non rhoncus risus,
									quis luctus nisl. Donec vitae velit tincidunt, tincidunt felis
									eu, suscipit nibh.
								</p>

							</li>
						</ul>
					</li>


				</ul>

			</aside>
			<div class="clear"></div>
		</div>
		<footer>
			<div class="footer-content width">
				<!-- 				<ul> -->
				<!-- 					<li><h4>Proin accumsan</h4></li> -->
				<!-- 					<li><a href="#">Rutrum nulla a ultrices</a></li> -->
				<!-- 					<li><a href="#">Blandit elementum</a></li> -->
				<!-- 					<li><a href="#">Proin placerat accumsan</a></li> -->
				<!-- 					<li><a href="#">Morbi hendrerit libero </a></li> -->
				<!-- 					<li><a href="#">Curabitur sit amet tellus</a></li> -->
				<!-- 				</ul> -->

				<!-- 				<ul> -->
				<!-- 					<li><h4>Condimentum</h4></li> -->
				<!-- 					<li><a href="#">Curabitur sit amet tellus</a></li> -->
				<!-- 					<li><a href="#">Morbi hendrerit libero </a></li> -->
				<!-- 					<li><a href="#">Proin placerat accumsan</a></li> -->
				<!-- 					<li><a href="#">Rutrum nulla a ultrices</a></li> -->
				<!-- 					<li><a href="#">Cras dictum</a></li> -->
				<!-- 				</ul> -->

				<!-- 				<ul> -->
				<!-- 					<li><h4>Iaculis amet</h4></li> -->
				<!-- 					<li><a href="#">Nam cursus nisi nec</a></li> -->
				<!-- 					<li><a href="#">Integer lacinia risus </a></li> -->
				<!-- 					<li><a href="#">Mauris eget ante ut elit</a></li> -->
				<!-- 					<li><a href="#">Vivamus quis orci et </a></li> -->
				<!-- 					<li><a href="#">Nam eget tellus</a></li> -->

				<!-- 				</ul> -->

				<!-- 				<ul class="endfooter"> -->
				<!-- 					<li><h4>Suspendisse</h4></li> -->
				<!-- 					<li><a href="#">Morbi hendrerit libero </a></li> -->
				<!-- 					<li><a href="#">Proin placerat accumsan</a></li> -->
				<!-- 					<li><a href="#">Rutrum nulla a ultrices</a></li> -->
				<!-- 					<li><a href="#">Curabitur sit amet tellus</a></li> -->
				<!-- 					<li><a href="#">Donec in ligula nisl.</a></li> -->
				<!-- 				</ul> -->

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