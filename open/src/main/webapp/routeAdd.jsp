<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Route Add</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
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
					<ul class="blocklist">
						<li><a class="selected" href="index.jsp">Home Page</a></li>
						<li><a href="routeDetails.jsp">Route Details</a></li>
						<li><a href="busDetails.jsp">Bus Details</a></li>
						<li><a href="driverDetails.jsp">Drive Details</a></li>
						<li><a href="conductorDetails.jsp">Conductor Details</a></li>					</ul>
				</li>
			</aside>

			<section id="content" class="three-column"> <article>


			<h2>Regitration Passenger</h2>
			<div class="article-info"></div>
			<form action="Route" name=""
				onSubmit="return(validate());">

				<table cellpadding="2" width="20%" bgcolor="99FFFF" align="center"
					cellspacing="2">


					<tr>

						<td colspan=2>

							<center>
								<font size=4><b>Route</b></font>
							</center>

						</td>

					</tr>


					<tr>

						<td>Source</td>

						<td><input type=text name="source" id="textname" size="30"></td>

					</tr>
					<tr>

						<td>Destination</td>

						<td><input type="text" name="destination" id="paddress"
							size="30"></td>

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
