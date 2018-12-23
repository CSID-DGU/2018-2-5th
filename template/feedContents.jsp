<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
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
    <title>BloodChain</title>
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
<script>
	/**
	 * 
	 */
	 var Web3 = require('web3');
 	var address  = '0x2e5fb462645f9cb315885e067401d20fe8ecc7c5';
 	var abi =  web3.eth.contract([{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_count","type":"uint256"}],"name":"getCard","outputs":[{"name":"","type":"string"},{"name":"","type":"string"},{"name":"","type":"string"},{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"getTotal","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"openDonation","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_cardId","type":"string"},{"name":"_owner","type":"address"}],"name":"ofOwner","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"getNumsByOwner","outputs":[{"name":"","type":"uint256[]"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_cardId","type":"string"}],"name":"getOwner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_from","type":"address"}],"name":"getCount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_id","type":"string"},{"name":"_date","type":"string"},{"name":"_typeOf","type":"string"},{"name":"_to","type":"address"}],"name":"creatCard","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"getRecipient","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"numToCardId","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"doDonation","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"name":"cardId","type":"string"},{"indexed":false,"name":"from","type":"address"},{"indexed":false,"name":"to","type":"address"},{"indexed":false,"name":"date","type":"string"}],"name":"NewDonation","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"cardId","type":"string"},{"indexed":false,"name":"date","type":"string"},{"indexed":false,"name":"typeOf","type":"string"}],"name":"NewCard","type":"event"}]);

 	var blood;

 	function startApp() {
 		blood = abi.at(address);
 	}
 	window.addEventListener('load', function() {
 	  if (typeof web3 !== 'undefined') {
 		   web3 = new Web3(web3.currentProvider);
 		} else {
 		}
 		startApp();
 	});


 	function creatCard(type, toAddress) {
 		var cardId = "12345";
 	  var date = "181221";

 		blood.creatCard(cardId, date, type, toAddress, function(err, result) {
 			if(!err) {
 			    alert('발급 성공!');
 			}
 		});
 	}

 	function doDonation() {
 		var articleId = '';

 		blood.doDonation(4, function(err, result) {
 			if(!err) {
 			    alert('기부 성공!');
 			}
 		});
 	}

 	function openDonation() {
 		var articleId = '';

 		blood.openDonation(4, function(err, result) {
 			if(!err) {
 			    alert('등록 성공!');
 			}
 		});
 	}

 	function getCount() {
 		var fromAddress = document.getElementById('addr').value;
 		blood.getCount(fromAddress, function(err, result) {
 	    if(!err) {
 			 return result;
 		}
 		});
 	}

 	function getOwner() {
 		var cardId = document.getElementById('cardId').value;

 		blood.getOwner(cardId, function(err, result) {
 	    if(!err) {
 	  	   alert(result);
 	    }
 		});
 	}

 	function getRecipient() {
 		var articleId = '';

 		blood.getRecipient(articleId, function(err, result) {
 	    if(!err) {
 	  	   return result;
 	    }
 		});
 	}

 	function getTotal() {
 		var articleId = '';

 		blood.getTotal(articleId, function(err, result) {
 	    if(!err) {
 	  	   return result;
 	    }
 		});
 	}

 	function ofOwner() {

		var param = document.getElementById('cardId').value;

 		blood.ofOwner(param[0], param[1], function(err, result) {
 	    if(!err) {
 	  	   alert(result);
 	    }
 		});
 	}

 	function getCard() {
 		var ownerAddress = document.getElementById('addr').value;
 		var my_tbody = document.getElementById('my-tbody');
 	  var cardNum = 0;
 	  for(var i=0; i < 4; i++) {
 	   blood.getCard(ownerAddress, i, function(err, result) {
	    	    if(!err) {
	     	  	   alert(result);
	     	    }
	     		});
 	  }
	    }
 		
 		
	</script>
</head>
<body>
<%
    				int id = Integer.parseInt(request.getParameter("id"));
					Connection conn = null;
					Statement stmt = null;
					String sql = null;
					ResultSet rs = null;
					
					try {
						Class.forName("com.mysql.jdbc.Driver"); 
						String url = "jdbc:mysql://localhost:3306/ootd_db?characterEncoding=utf8"; 
						conn = DriverManager.getConnection(url,"root","password!"); 
						stmt = conn.createStatement(); 
						sql = "select * from feed_tbl"; 
						rs = stmt.executeQuery(sql); 
					}catch(Exception e) {
						out.println("DB 연동 오류입니다. : " + e.getMessage());
					}
					
					
				%>
				
    <div style="text-align:center; padding-right:25%; padding-left:25%; margin-top:50px; height:700px;">
      <div style="width:40%; height:35%; float:left; distplay:inline-block; background: url('img/<%=id %>.jpg') center / cover;">
      </div>
      	<%
      	if(rs.next()) {
      		%>
      		<div style="float:left;">작성자 : <%= rs.getString("nickname") %></div>
    		<div style="float:right;">날짜 : <%= rs.getString("date") %></div>
    		<div style="height:40px;"></div>
    		<div style="font-size:24px;">Pleas..</div><hr>
    		<div style="height:15px;"></div>
	    	
	    	<div style="height:40px;"></div>
	    	
	    	<div style="height:40px;"></div>
	    	<div style="display:inline-block; float:left"></div>
	    	<div style="display:inline-block;">
					<button onclick="doDonation();"style="margin-bottom:50px; background-color:#ff8a65; color:white;" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
					  기부하기
					</button></div>
      	</div>
      <div >
      	<div style ="height:270px;"></div>
    	<hr style="border:solid 1px #ff8a65;">
    	<div style="height:40px;"></div>
    		<h4>Content</h4>
    		<div style="font-size:20px; float:left"><%= rs.getString("content") %></div>
      </div>
      <% }%>
      	
	  <div class="bodyContainer">
		<!-- <h6>&nbsp;&nbsp;OOTD FEED</h6><hr style="border:solid 1px #ff8a65; margin:-5px;"> -->
	    <div>
				
			<%
				stmt.close();
				conn.close();
			%>
		</div>
	</div>
  </div>
</body>
</html>