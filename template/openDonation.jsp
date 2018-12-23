<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<div>
<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="margin-top:30px; margin-left:50px;">
  Back
</button>
<section id="accept" class="white-bg" style="margin-top:50px;">
          <div class="container-fluid" style="padding:80px; text-align:center;">
          
            <div class="row">
            
                <div class="col-sm-8 col-sm-offset-2 text-center ">
                <form action="insertContent.jsp" mothod="post">
                	<div style="margin-right:15px; margin-top:-80px;">
                	<div>Title</div>
                	<div><input type="text" name="title" size="79"></div><br>
                	<div>Belong to</div>
                	<div><input type="text" id="addr" name="addr" size="79"></div><br>
               	 	<div>Contents</div>
                	<div><textarea name="content" cols="80" rows="10"></textarea></div>
                    </div>
                    
                    <div style="border:1px;width:150px; height:50px"></div>
                    <div style="height:70px;">
                    <button type="submit" onclick="openDonation();"style="float:right;" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
					  기부글 등록
					</button>
					</div>
					</form>
                </div>
                </div>
                </div>
                </section>
</html>