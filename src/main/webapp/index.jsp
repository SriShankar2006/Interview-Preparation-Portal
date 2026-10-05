<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Interview Prep Portal</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="main-header">
<h1>Interview Prep Portal</h1> 
<p>Simple preparation for confident interviews.</p>
</header>
<nav class="navbar">
<a href="index.jsp">Home</a>
<a href="#about">About</a>
<a href="register.jsp">Register</a>
<a href="feedback.xml">Feedback XML</a>
<a href="#contact">Contact</a>
<% if (session.getAttribute("loggedIn") != null) { %>
    <% if ("PREMIUM_MEMBER".equals(session.getAttribute("subscriptionStatus"))) { %>
        <a href="premium/mock_interviews.jsp" style="color:#ffcc00; font-weight:bold;">Premium Mock Interviews</a>
    <% } else { %>03
        <a href="subscribe.jsp" style="color:#00ff66; font-weight:bold;">Go Premium</a>
    <% } %>
    <a href="LogoutServlet">Logout</a>
<% } %>
</nav>
<% if (request.getParameter("message") != null) { %>
<div style="background-color:#d4edda; color:#155724; padding:12px; text-align:center; font-weight:bold;">
<%= request.getParameter("message") %>
</div>
<% } %>
<% if (session.getAttribute("loggedIn") != null) { %>
<div style="text-align:center; margin:20px;">
<p>Welcome, <strong><%= session.getAttribute("userName") %></strong></p>
</div>
<% } %>
<section class="hero">
<h2>Prepare with purpose</h2>
<p>Register, explore feedback, and unlock premium mock interviews.</p>
<a href="register.jsp" class="btn">Register Now</a>
</section>
<section id="about" class="content-container">
<div class="container">
<h2>About the Portal</h2>
<p>Interview preparation resources for technical and HR rounds.</p>
</div>
</section>
<main class="content-container">
<div class="container">
<h2>What you get</h2>
<ul>
<li>Interview feedback</li>
<li>Premium mock interviews</li>
<li>Focused preparation</li>
</ul>
</div>
<div class="table-box">
<h2>Mock Interview Tracks</h2>
<table>
<thead><tr><th>Track</th><th>Duration</th><th>Timing</th><th>Fee</th></tr></thead>
<tbody>
<tr><td>Technical</td><td>45 Mins</td><td>Mon - Tue</td><td>$19</td></tr>
<tr><td>HR Round</td><td>20 Mins</td><td>Wed - Thu</td><td>Free</td></tr>
<tr><td>System Design</td><td>45 Mins</td><td>Thu - Fri</td><td>$25</td></tr>
</tbody>
</table>
</div>
</main>
<footer class="main-footer" id="contact">
<h3>Contact Us</h3>
<p>prep_portal@gmail.com | Coimbatore, India</p>
<a href="index.jsp">Home</a> | <a href="#about">About</a>
<p>&copy; 2026 Interview Prep Portal</p>
</footer>
</body>
</html>
