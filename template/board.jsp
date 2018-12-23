<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/icons/favicon.png">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <title>OOTD</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <!-- Website icon -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!-- CSS ========================================== -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<script src="js/web3.min.js"></script>
	<script src="pay.js"></script>
	<script src="blood.js"></script>
</head>
<body>
<div style="text-align:center;">
	  <div class="bodyContainer">
		<h6>&nbsp;&nbsp;헌혈증 기부 게시판</h6><hr style="border:solid 1px #ff8a65; margin:-5px;">
		<!-- Raised button with ripple -->
				<div style="height:60px; padding:10px;">
					<a class="nav-link" href="openDonation.jsp" data-toggle="modal">
					<button style="margin-top:5px; margin-right:20px;background-color:#ff8a65; color:white;float:right;" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
					  기부글 등록
					</button>
					</a>
				</div>
	    <div>
				<%
					int id;
					int rownum = 0;
					Connection conn = null;
					Statement stmt = null;
					String sql = null;
					ResultSet rs = null;
					
					try {
						Class.forName("com.mysql.jdbc.Driver"); 
						String url = "jdbc:mysql://localhost:3306/ootd_db?characterEncoding=utf8"; 
						conn = DriverManager.getConnection(url,"root","password!"); 
						stmt = conn.createStatement(); 
						sql = "select * from feed_tbl order by id asc "; 
						rs = stmt.executeQuery(sql); 
					}catch(Exception e) {
						out.println("DB 연동 오류입니다. : " + e.getMessage());
					}
					
					 rs.last();
					rownum = rs.getRow();
					rs.beforeFirst(); 
					
					while(rs.next()) {
						id = Integer.parseInt(rs.getString("id"));
				%>
					<div style="float:left; margin:10px;">
					<a class="nav-link" href="feedContents.jsp?id=<%= id %>">
						<!-- Image card -->
						<div class="demo-card-image mdl-card mdl-shadow--2dp" style="background: url('img/<%=id %>.jpg') center / cover;">
						  <div class="mdl-card__title mdl-card--expand"></div>
						  <div class="mdl-card__actions">
						    <span class="demo-card-image__filename"><%=rs.getString("title")%></span>
						  </div>
						</div>
					</a>
					</div>
						
						
				<%if (rs.next()) {
				id = Integer.parseInt(rs.getString("id"));%>
				<div style="float:left; margin:10px;">
					<a class="nav-link" href="./feedContents.jsp?id=<%= id %>">
						<!-- Image card -->
						<div class="demo-card-image mdl-card mdl-shadow--2dp" style="background: url('img/<%=id %>.jpg') center / cover;">
						  <div class="mdl-card__title mdl-card--expand"></div>
						  <div class="mdl-card__actions">
						    <span class="demo-card-image__filename"><%=rs.getString("title")%></span>
						  </div>
						</div>
					</a>
					</div>
					<%} %>
				<%if (rs.next()) {
				id = Integer.parseInt(rs.getString("id"));%>
				<div style="float:left; margin:10px;">
					<a class="nav-link" href="feedContents.jsp?id=<%= id %>">
						<!-- Image card -->
						<div class="demo-card-image mdl-card mdl-shadow--2dp" style="background: url('img/<%=id %>.jpg') center / cover;">
						  <div class="mdl-card__title mdl-card--expand"></div>
						  <div class="mdl-card__actions">
						    <span class="demo-card-image__filename"><%=rs.getString("title")%></span>
						  </div>
						</div>
					</a>
					</div>
					<%}
					} 
					%>
			</div><br/><br/>
				
				
			<%
				stmt.close();
				conn.close();
			%>
	</div>
	</div>
	<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/easing.min.js"></script>
    <script src="js/hoverIntent.js"></script>
    <script src="js/superfish.min.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/hexagons.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/index.js"></script>
</body>
</html>