var Web3 = require('web3');
var address  = '0x2e5fb462645f9cb315885e067401d20fe8ecc7c5';
var abi =  web3.eth.contract( [{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_count","type":"uint256"}],"name":"getCard","outputs":[{"name":"","type":"string"},{"name":"","type":"string"},{"name":"","type":"string"},{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"getTotal","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"openDonation","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_cardId","type":"string"},{"name":"_owner","type":"address"}],"name":"ofOwner","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"getNumsByOwner","outputs":[{"name":"","type":"uint256[]"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_cardId","type":"string"}],"name":"getOwner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_from","type":"address"}],"name":"getCount","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_id","type":"string"},{"name":"_date","type":"string"},{"name":"_typeOf","type":"string"},{"name":"_to","type":"address"}],"name":"creatCard","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"getRecipient","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"numToCardId","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_articleId","type":"uint256"}],"name":"doDonation","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"name":"cardId","type":"string"},{"indexed":false,"name":"from","type":"address"},{"indexed":false,"name":"to","type":"address"},{"indexed":false,"name":"date","type":"string"}],"name":"NewDonation","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"cardId","type":"string"},{"indexed":false,"name":"date","type":"string"},{"indexed":false,"name":"typeOf","type":"string"}],"name":"NewCard","type":"event"}]);

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

function createCard() {
	var cardId = '';
  var date = '';
  var type = '';
  var toAddress = '';

	blood.createCard(cardId, date, type, toAddress, function(err, result) {
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
	var fromAddress = '';

	blood.getCount(fromAddress, function(err, result) {
    if(!err) {
  	   return result;
    }
	});
}

function getOwner() {
	var cardId = '';

	blood.getOwner(cardId, function(err, result) {
    if(!err) {
  	   return result;
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
	var cardId = '';
  var ownerAddress = '';

	blood.ofOwner(cardId, ownerAddress, function(err, result) {
    if(!err) {
  	   return result;
    }
	});
}

function getCard() {
	var ownerAddress = '';
  var cardNum = 0;

	blood.getCard(ownerAddress, cardNum, function(err, result) {
    if(!err) {
  	   alert(result);
    }
	});
}
