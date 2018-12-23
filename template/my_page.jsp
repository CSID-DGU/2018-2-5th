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

 		blood.doDonation(articleId, function(err, result) {
 			if(!err) {
 			    alert('기부 성공!');
 			}
 		});
 	}

 	function openDonation() {
 		var articleId = '';

 		blood.openDonation(articleId, function(err, result) {
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
<style type="text/css">
    body {
        color: #566787;
        background: #f5f5f5;
        font-family: 'Roboto', sans-serif;
    }

    .modal-login-window {
        width: 350px;
    }
    .modal-login-window2 {
        width: 300px;
    }

    .modal-login .modal-content {
        padding: 20px;
        border-radius: 5px;
        border: none;
    }

    .modal-login .modal-header {
        border-bottom: none;
        position: relative;
        justify-content: center;
    }

    .modal-login .close {
        position: absolute;
        top: -10px;
        right: -10px;
    }

    .modal-login h4 {
        color: #636363;
        text-align: center;
        font-size: 26px;
        margin-top: 0;
    }

    .modal-login .modal-content {
        color: #999;
        border-radius: 1px;
        margin-bottom: 15px;
        background: #fff;
        border: 1px solid #f3f3f3;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 25px;
    }

    .modal-login .form-group {
        margin-bottom: 20px;
    }

    .modal-login label {
        font-weight: normal;
        font-size: 13px;
    }

    .modal-login .form-control {
        min-height: 38px;
        padding-left: 5px;
        box-shadow: none !important;
        border-width: 0 0 1px 0;
        border-radius: 0;
    }

    .modal-login .form-control:focus {
        border-color: #ccc;
    }

    .modal-login .input-group-addon {
        max-width: 42px;
        text-align: center;
        background: none;
        border-width: 0 0 1px 0;
        padding-left: 5px;
        border-radius: 0;
    }

    .modal-login .btn {
        font-size: 16px;
        font-weight: bold;
        background: #b0bec5;
        border-radius: 3px;
        border: none;
        min-width: 100px;
        outline: none !important;
    }

    .modal-login .btn:hover,
    .modal-login .btn:focus {
        background: #ff8a65;
    }

    .modal-login .hint-text {
        text-align: center;
        padding-top: 5px;
        font-size: 13px;
    }

    .modal-login .modal-footer {
        color: #999;
        border-color: #dee4e7;
        text-align: center;
        margin: 0 -25px -25px;
        font-size: 13px;
        justify-content: center;
    }

    .modal-login a {
        color: #fff;
        text-decoration: underline;
    }

    .modal-login a:hover {
        text-decoration: none;
    }

    .modal-login a {
        color: #333333;
        text-decoration: none;
    }

    .modal-login a:hover {
        text-decoration: underline;
    }

    .modal-login .fa {
        font-size: 21px;
    }

    .trigger-btn {
        display: inline-block;
        margin: 100px auto;
    }
    
    .navbar {
        background-color:#ff8a65;
        background-image: none;
    }
    
    .main {
    	width : 100%;
    	heigth : 1000px;
    	background-color:#f5f5f5;
    }
     @media ( max-width: 700px ) {
    	.bodyContainer {
	    	font-family: 'Roboto', sans-serif;
	    	color:white;
	    	margin-top : 30px;
	    	margin-left : 6%;
	    	width:88%;
    	}
    }
   
    .bodyContainer {
    	font-family: 'Roboto', sans-serif;
    	color:black;
    	margin-top : 30px;
		display:inline-block;
    	max-width:930px;
    	
    }
    .center {	
    	text-align:center;
    	margin-top:-0.5%;
    }
    .modal-window {
 	   width:1000px;
    }
    .demo-card-image.mdl-card {
		  width: 256px;
		  height: 256px;
		}
		.demo-card-image > .mdl-card__actions {
		  height: 52px;
		  padding: 16px;
		  background: rgba(0, 0, 0, 0.2);
		}
		.demo-card-image__filename {
		  color: #fff;
		  font-size: 14px;
		  font-weight: 500;
		}
		td {
			padding:15px;
		}
</style>

</head>
<body> 	
	<!-- Colored raised button -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="margin-top:30px; margin-left:50px;">
  Back
</button>
	
	<section id="accept" class="white-bg" style="margin-top:50px;">
          <div class="container-fluid" style="padding:80px; text-align:center;">
          
            <div class="row">
            
                <div class="col-sm-8 col-sm-offset-2 text-center ">
                  <div class="margin-100" style="margin-top:-80px;"></div>
                      <span class="fas fa-hand-holding-heart fa-4x"></span>
                <h2 class="black">내 헌혈증 확인</h2></div>

              <input type="text" id="addr" placeholder="Address"> <button type="submit" onclick="getCard();">보기</button>
               
                    </div>
                  </div>
        </section>
        <section id="accept" class="white-bg">
          <div class="container-fluid" style="padding:80px; text-align:center;">
            <div class="row" style="text-align:center">
                <div class="col-sm-8 col-sm-offset-2 text-center ">
                  <div class="margin-100" style="margin-top:-80px;"></div>
                      <span class="fas fa-hand-holding-heart fa-4x"></span>
                <h2 class="black">헌혈증 주인 확인</h2></div>

              <input style="display:inline-block" type="text" id="cardId" placeholder="cardId"> <button type="submit" onclick="getOwner();">보기</button>
               
                    </div>
                  </div>
        </section>
        <script>
       
    	

            	function view(func) {
            		var my_tbody = document.getElementById('my-tbody');
            	    // var row = my_tbody.insertRow(0); // 상단에 추가
            	    var l = func();
            	    for(var i = 0; i<l; i++) {
            	    	var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
                	    var cell1 = row.insertCell(0);
                	    var cell2 = row.insertCell(1);
                	    var cell3 = row.insertCell(2);
                	    var cell4 = row.insertCell(3);
            	    	//cell1.innerHTML = 
            	    	
            	    }
            	              		
            	}
            	</script>
		
    <!-- Bootstrap core JavaScript -->
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