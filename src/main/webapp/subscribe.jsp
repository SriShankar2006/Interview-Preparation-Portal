<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Premium Subscription | Interview Prep Portal</title>
<link rel="stylesheet" href="style.css">
<script src="script.js" defer></script>
</head>
<body>
<nav class="navbar"><a href="index.jsp">Home</a></nav>
<main class="form-page">
<div class="form-box subscription-box">
<h2>Premium Mock Interview Pass</h2>
<p>Unlimited premium mock interviews and resume review.</p>
<div class="price">$15 <span>/ month</span></div>
<% if (request.getParameter("error") != null) { %><p class="error"><%= request.getParameter("error") %></p><% } %>
<p id="ajaxErrorText" class="error"></p>
<ul class="feature-list"><li>Mock interview library</li><li>Resume review</li><li>Priority support</li></ul>
<form id="subscriptionForm" action="SubscriptionServlet" method="post">
<input type="hidden" name="plan" value="PREMIUM_MEMBER">
<input type="hidden" name="price" value="15.00">
<button type="submit" onclick="checkSessionAndSubmit(event)" class="btn full-width">Upgrade to Premium</button>
</form>
<br><a href="index.jsp" class="muted-link">&larr; Back to home</a>
</div>
</main>
</body>
</html>
