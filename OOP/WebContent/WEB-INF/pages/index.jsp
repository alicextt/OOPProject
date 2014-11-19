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
<body >
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
							<li class="active"><a href="#" data-toggle="collapse"
								data-target="#toggleDemo0" data-parent="#sidenav01"
								class="collapsed">
									<h4>
										Homepage <br> <small>${user.getLastName()},
											${user.getFirstName()} <span class="caret"></span>
										</small>
									</h4>
							</a>
								<div class="collapse" id="toggleDemo0" style="height: 0px;">
									<ul class="nav nav-list">
										<li><a href="#">My Task</a></li>
										<li><a href="#">Finished Task</a></li>
										<li><a href="#">Upcoming Task</a></li>
									</ul>
								</div></li>
							<li><a href="#" data-toggle="collapse"
								data-target="#team" data-parent="#sidenav01"
								class="collapsed"> <span class="glyphicon glyphicon-cloud"></span>
									Query <span class="caret pull-right"></span>
							</a>
								<div class="collapse" id="team" style="height: 0px;">
									<ul class="nav nav-list">
										<li><a href="#">Query by name</a></li>
										<li><a href="#">Query by project</a></li>
									</ul>
								</div></li>
							<li class="active"><a href="#" data-toggle="collapse"
								data-target="#project" data-parent="#sidenav01"
								class="collapsed"> <span class="glyphicon glyphicon-lock"></span>
									Project <span class="caret pull-right"></span>
							</a>
								<div class="collapse" id="project" style="height: 0px;">
									<ul class="nav nav-list">
										<li><a href="#">My projects</a></li>
										<li><a href="#">Create Project</a></li>
										<li><a href="#">Edit Project</a></li>
									</ul>
								</div></li>
							<li><a href="#" data-toggle="collapse"
								data-target="#communication" data-parent="#sidenav01"
								class="collapsed"><span class="glyphicon glyphicon-inbox"></span>
									Communications <span class="caret pull-right"></span></a>
								<div class="collapse" id="communication" style="height: 0px;">
									<ul class="nav nav-list">
										<li><a href="#">Communicaitons</a></li>
										<li><a href="#">Record a communicaiton</a></li>

									</ul>
								</div></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-calendar"></span> Timeline </a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span>
									My Profile</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
		<div class="col-sm-9 col-md-10 affix-content">
			<div class="container">
				<div>
					<img alt="Logo.jpg" src="img/FIL Logo.jpg" hspace="0">
				</div>
				<div class="page-header">
					<h3>
						<span class="glyphicon glyphicon-th-list"></span> Open projects
					</h3>
				</div>

				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Mauris lectus orci, viverra nec neque non, tincidunt commodo leo.
					Nullam eleifend velit purus, id aliquam elit venenatis sit amet.
					Cras vel nisl eget eros tempus viverra. Phasellus in enim et nulla
					tempor blandit. Donec at lectus sit amet velit faucibus tincidunt
					quis sed est. Mauris placerat purus odio. In egestas, velit quis
					congue sodales, turpis lacus pellentesque neque, quis accumsan orci
					nibh sed mauris. Sed sit amet pulvinar felis. Aliquam consequat
					tellus non ligula elementum, at egestas quam vestibulum. Duis sed
					urna sit amet quam rutrum malesuada sed eu risus. Cras sit amet
					velit a neque tincidunt cursus sed ac nunc. Donec ac auctor purus.
					Proin viverra turpis sit amet dui sagittis, quis tempor elit
					suscipit. Curabitur rutrum lacus et diam lacinia, vel ullamcorper
					libero vulputate. Phasellus sem ligula, pharetra sed nisl sed,
					facilisis sagittis ante. Nullam egestas turpis et mauris aliquet
					cursus. Nullam vel eleifend neque.</p>

			</div>
		</div>
	</div>

</body>
</html>
