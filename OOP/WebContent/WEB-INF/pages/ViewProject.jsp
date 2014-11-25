<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="model.*"%>
<%@ page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>


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
<sj:head />

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
							<li><a href="#" data-toggle="collapse" data-target="#team"
								data-parent="#sidenav01" class="collapsed"> <span
									class="glyphicon glyphicon-cloud"></span> Query <span
									class="caret pull-right"></span>
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
							<li><a href="#"><span
									class="glyphicon glyphicon-calendar"></span> Timeline </a></li>
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
				<%
					Project p = (Project) (session.getAttribute("project"));
				%>


				<div class="page-header" style="clear: both">
					<h3>
						<span class="glyphicon glyphicon-th-list"></span>
						<%=p.getName()%>
					</h3>
				</div>
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#sectionA">Project</a></li>
					<li><a data-toggle="tab" href="#sectionB">Task</a></li>
					<li><a data-toggle="tab" href="#sectionC">Team</a></li>
				</ul>
				<div class="tab-content" style="width: 90%">
					<div id="sectionA" class="tab-pane fade in active">
						<br>
						<h4>About This Project</h4>

						<table class="table table-striped center" style="width: 90%">
							<thead>
								<tr>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Last Modified Date</th>
									<th>Project Outcome</th>
									<th>Project Status</th>
								</tr>
							</thead>
							<tr>
								<td><%=Project.dateToStr(p.getStartDate())%></td>
								<td><%=Project.dateToStr(p.getEndDate())%></td>
								<td><%=Project.dateToStr(p.getLastModifiedDate())%></td>
								<td><%=p.getProjectOutcome()%></td>
								<td><%=p.getProjectStatus()%></td>
							</tr>
						</table>
						<table class="table table-striped ">
							<thead>
								<tr>
									<th>Description</th>
								</tr>
							</thead>
							<tr>
								<td><p><%=p.getDescription()%></p></td>
							</tr>
						</table>
					</div>
					<div id="sectionB" class="tab-pane fade">
						<br>
						<h4>Task Details</h4>

						<div style="margin: 20px">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Assigned To</th>
										<th>Description</th>
										<th>Start date</th>
										<th>End date</th>
										<th>Status</th>
									</tr>
								</thead>
								<%
									for (Task t : p.getTasks()) {
								%>
								<tr>
									<td><%=t.getUserintask().getFirstName()%>, <%=t.getUserintask().getLastName()%></td>
									<td><%=t.getDescription()%></td>
									<td><%=Project.dateToStr(t.getStartDate())%></td>
									<td><%=Project.dateToStr(t.getEndDate())%></td>
									<td><%=t.getStatus()%></td>
								</tr>
								<%
									}
								%>

							</table>

							<s:url id="urlValue" action="URLRedirection" encode="true">
								<s:param name="url">createTask</s:param>
							</s:url>
							<s:a href="%{urlValue}" cssClass="btn btn-info "
								style="margin-left:45%">Add a Task</s:a>
						</div>

					</div>
					<div id="sectionC" class="tab-pane fade">
						<br>
						<s:form action="addMemberAction">
							<h5>Add a user to this project:</h5>
							<div style="margin: 20px">
								<table class="table table-striped"
									style="table-layout: fixed; width: 350px;">
									<tr>
										<td><s:url var="remoteurl" action="selectUser" /> <sj:select
												href="%{remoteurl}" id="echo" name="chooseuser"
												list="usrList" emptyOption="false" headerKey="-1"
												headerValue="Select a User" cssClass="form-control"/></td>
										<td><s:submit value="Add" style="width:70px" /></td>
									</tr>
								</table>
							</div>
						</s:form>
						<h4>Team Members</h4>
						<div style="margin: 20px">
							<table class="table table-striped">
								<thead>
									<tr>
									<th>User name</th>
										<th>First name</th>
										<th>Last name</th>
										<th>Email</th>
									</tr>
								</thead>
								<%
									for (User u : p.getUsers()) {
								%>
								<tr>
								<td><%=u.getUserName() %></td>
									<td><%=u.getFirstName()%></td>
									<td><%=u.getLastName()%></td>
									<td><a href="mailto:<%=u.getEmail()%>"><%=u.getEmail()%></a></td>
								</tr>
								<%
									}
								%>

							</table>


						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
