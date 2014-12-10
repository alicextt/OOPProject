<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="css/login.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<s:head />
</head>
<body style="background-color:#f0f0f0">
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
						src="http://www.scu.edu/engineering/frugal/images/home-03.jpg?sz=500"
						alt="">
					<s:form action="Login" cssClass="form-signin">
					<!-- this will parse the userName to obejct u directly -->
						<s:textfield name="u.userName" cssClass="form-control"
							placeholder="Account"  />
						<s:password name="u.passWord" cssClass="form-control"
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
				<a href="signup.jsp" class="text-center new-account">Create an account </a>
			</div>
		</div>
	</div>
</body>
</html>
