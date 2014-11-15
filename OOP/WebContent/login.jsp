<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>

<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="css/login.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<s:head />
</head>
<body>
	<div>
		<img alt="Logo.jpg" src="img/FIL Logo.jpg" hspace="200">
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<h1 class="text-center login-title">Sign in to Frugal
					Innovation Lab</h1>
				<div class="account-wall">
					<img class="profile-img"
						src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
						alt="">
					<s:form action="Login" cssClass="form-signin">
						<s:textfield name="userName" cssClass="form-control"
							placeholder="Account"  />
						<s:password name="password" cssClass="form-control"
							placeholder="Password" />
						<s:submit value="Login"
							cssClass="btn btn-lg btn-primary btn-block" />
						<label class="checkbox pull-left"> <input type="checkbox"
							value="remember-me"> Remember me
						</label>
						<a href="#" class="pull-right need-help">Need help? </a>
						<span class="clearfix"></span>
					</s:form>
				</div>
				<a href="#" class="text-center new-account">Create an account </a>
			</div>
		</div>
	</div>
</body>
</html>
