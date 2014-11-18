<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign up</title>
<s:head />

</head>
<body style="background-color: #525252">
	<div class="container">
		<div class="row centered-form">
			<div
				class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please sign up for Frugal Lab</h3>
					</div>
					<div class="panel-body">
						<!--  <form role="form">-->
						<s:form action="Register">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<s:textfield name="u.firstName" id="first_name"
											cssClass="form-control input-sm" placeholder="First Name" />
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<s:textfield name="u.lastName" id="last_name"
											cssClass="form-control input-sm" placeholder="Last Name" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<s:textfield name="u.email" id="email"
									cssClass="form-control input-sm" placeholder="Email Address" />
							</div>

							<div class="form-group">
										<s:textfield name="u.userName" id="username"
											cssClass="form-control input-sm" placeholder="Username" />
									
							</div>
									<div class="form-group">
										<s:password name="u.passWord" id="password"
											cssClass="form-control input-sm" placeholder="Password" />
									
							</div>
							<!-- <div class="col-sm-10">
								<div class="checkbox" style="margin-left: 100px;margin-top:-5px">
									<label > <input type="checkbox"> <b>Administrator
									</label>
								</div>
							</div>
 -->

							<s:submit value="Register" cssClass="btn btn-info btn-block" />
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>