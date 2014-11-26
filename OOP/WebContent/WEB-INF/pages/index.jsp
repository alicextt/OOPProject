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
										<li><s:url id="urlValue" action="URLRedirection">
												<s:param name="url">index</s:param>
											</s:url> <s:a href="%{urlValue}">My Tasks</s:a></li>

										<li><a href="#">Edit Task</a></li>
									</ul>
								</div></li>
							<li><a href="#" data-toggle="collapse" data-target="#query"
								data-parent="#sidenav01" class="collapsed"> <span
									class="glyphicon glyphicon-cloud"></span> Query <span
									class="caret pull-right"></span>
							</a>
								<div class="collapse" id="query" style="height: 0px;">
									<ul class="nav nav-list">
										<li><s:url id="urlValue" action="URLRedirection" encode="true">
												<s:param name="url">queryprojects</s:param>
											</s:url> <s:a href="%{urlValue}">By name</s:a></li>
										<li><s:url id="urlValue" action="URLRedirection" encode="true">
												<s:param name="url">queryprojects</s:param>
											</s:url> <s:a href="%{urlValue}">By project</s:a></li>
									</ul>
								</div>
							</li>
							<li class="active"><a href="#" data-toggle="collapse"
								data-target="#project" data-parent="#sidenav01"
								class="collapsed"> <span class="glyphicon glyphicon-lock"></span>
									Project <span class="caret pull-right"></span>
							</a>
								<div class="collapse" id="project" style="height: 0px;">
									<ul class="nav nav-list">

										<li><s:url id="urlValue" action="URLRedirection"
												encode="true">
												<s:param name="url">viewmyprojects</s:param>
											</s:url> <s:a href="%{urlValue}">My Projects</s:a></li>
										<li><s:url id="urlValue" action="URLRedirection"
												encode="true">
												<s:param name="url">createprojects</s:param>
											</s:url> <s:a href="%{urlValue}">Create Project</s:a></li>
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

							<li><a href="#"><span class="glyphicon glyphicon-cog"></span>
									My Profile</a></li>
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
				<p>Here are your task status</p>
				<%
					User u = (User) (session.getAttribute("user"));
				%>
				<table class="table table-striped" style="width: 90%">
					<thead>
						<tr>
							<!--  		<th>Project Id</th>  -->
							<th>Project Name</th>
							<th>Task Description</th>
							<th>Task Start Date</th>
							<th>Task End Date</th>
							<th>Task Status</th>
						</tr>
					</thead>
					<%
						for (Task s : u.getTasks()) {
					%>
					<tr>
						<!--  	<td><%=s.getProjectintask().getIdProject()%></td>-->
						<td><%=s.getProjectintask().getName()%></td>
						<td><%=s.getDescription()%></td>
						<td><%=Project.dateToStr(s.getStartDate())%></td>
						<td><%=Project.dateToStr(s.getEndDate())%></td>
						<td><%=s.getStatus()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
