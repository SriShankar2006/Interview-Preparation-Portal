<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register | Interview Prep Portal</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar"><a href="index.jsp">Home</a></nav>
<main class="form-page">
<div class="form-box">
<h1>Create Account</h1>
<p>Join the interview preparation portal.</p>
<% if (request.getParameter("error") != null) { %>
<p class="error"><%= request.getParameter("error") %></p>
<% } %>
<form id="registrationForm" action="RegisterServlet" method="post">
<label for="userName">Full name</label>
<input id="userName" name="userName" required maxlength="80">
<label for="userEmail">Email</label>
<input id="userEmail" name="userEmail" type="email" required maxlength="120">
<label for="password">Password</label>
<input id="password" name="password" type="password" required minlength="8">
<label for="confirmPassword">Confirm password</label>
<input id="confirmPassword" name="confirmPassword" type="password" required minlength="8">
<label><input id="terms" name="terms" type="checkbox" value="yes" required> I agree to the terms.</label>
<button type="submit">Register</button>
</form>
<p id="message" role="status" aria-live="polite"></p>
</div>
</main>
<script src="registration.js"></script>
</body>
</html>
