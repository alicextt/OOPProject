<%@ page import="model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/content.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frugal Innovation Lab</title>
<!-- can not working through the css -->
<style>
.sidebar-nav .navbar li a:hover {
	background-color: #428bca;
	color: white;
}
</style>
</head>
<body>
	<!-- ${user.getLastName()}, ${user.getFirstName()}! You are logged in! -->
	<div class="row affix-row">
		<div class="col-sm-3 col-md-2 affix-sidebar">
			<div class="sidebar-nav">
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".sidebar-navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<span class="visible-xs navbar-brand">Sidebar menu</span>
					</div>
					<div class="navbar-collapse collapse sidebar-navbar-collapse">
						<ul class="nav navbar-nav" id="sidenav01">
							<li class="active"><a class="collapsed">
									<h4>
										Homepage <br> <small>${user.getLastName()},
											${user.getFirstName()} </small>
									</h4>
							</a></li>
							<li><s:url id="urlValue" action="URLRedirection">
									<s:param name="url">pindex</s:param>
								</s:url> <s:a href="%{urlValue}">
									<span class="glyphicon glyphicon-home"></span>  Home</s:a></li>


							<li><a href="#" data-toggle="collapse"
								data-target="#project" data-parent="#sidenav01"
								class="collapsed"> <span class="glyphicon glyphicon-lock"></span>
									Project <span class="caret pull-right"></span>
							</a>
								<div class="collapse" id="project" style="height: 0px;">
									<ul class="nav nav-list">

										<li><s:url id="urlValue" action="URLRedirection"
												encode="true">
												<s:param name="url">pviewmyprojects</s:param>
											</s:url> <s:a href="%{urlValue}">My Projects</s:a></li>
										<li><s:url id="urlValue" action="URLRedirection"
												encode="true">
												<s:param name="url">pcreateprojects</s:param>
											</s:url> <s:a href="%{urlValue}">Create Project</s:a></li>
									</ul>
								</div></li>


							<li><s:url id="urlValue" action="URLRedirection">
									<s:param name="url">pmyprofile</s:param>
								</s:url> <s:a href="%{urlValue}">
									<span class="glyphicon glyphicon-cog"></span>
									My Profile</s:a></li>
							<li><s:url id="urlValue" action="URLRedirection">
									<s:param name="url">logout</s:param>
								</s:url> <s:a href="%{urlValue}">
									<span class="glyphicon glyphicon-off"></span>
									Log Out
							</s:a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
		<div class="col-sm-9 col-md-10 affix-content">
			<div class="container">
				<!-- this is a link to the google folder -->
				<div>
					<img alt="Logo.jpg" src="img/FIL Logo.jpg" hspace="0" vspace="20"
						style="float: left"> <a
						href="https://drive.google.com/a/scu.edu/file/d/0BzYeTJK5yum0dXhpNWZSY09RaG8/view?usp=sharing"
						style="float: right; padding: 30px"><span
						class="glyphicon glyphicon-folder-open" style="padding: 10px"></span>Google
						Folder</a>

				</div>

				<div class="page-header" style="clear: both">
					<h3>
						<span class="glyphicon glyphicon-th-list"></span> Hello,
						${user.getLastName()} ${user.getFirstName()}
					</h3>
				</div>
				<h4>Thank you for being a partener for Frugal Innovation Lab!</h4>
				<p>Frugal innovation is a process of problem solving and a
					game changing strategy that addresses the need for products and
					services in emerging, underdeveloped countries. Features of frugal
					innovation include ruggedization, simplification, sparing use of
					low cost raw materials, an emphasis on earth friendly practices,
					and a philosophy that favors doing more with less in creating
					compassionate, user-centric design.</p>
					<br>
				<p>With the vibrancy of emerging market growth, the School of
					Engineering's Frugal Innovation Lab (FIL) meets this new paradigm
					head-on by offering undergraduate and graduate courses, hosting
					student and faculty research projects, and partnering with
					field-based social entrepreneurs in emerging markets. Impactful
					work is being done in simple yet powerful ways. Projects range from
					designs and prototypes to implemented and utilized products and
					services. Students learn within the lab as well as interact with
					field-based social entrepreneurs and global partners to solve
					real world problems.
					</p>
			</div>
		</div>
	</div>

</body>
</html>
