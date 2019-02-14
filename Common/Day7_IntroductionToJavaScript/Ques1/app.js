	
		(function() {
	'use strict';
	var amount = prompt("Enter amount:");
	document.getElementById("amount").innerHTML = amount;


	var rate = prompt("Enter rate:");
	document.getElementById("rate").innerHTML = rate;

	var time = prompt("Enter no. of years:");
	document.getElementById("time").innerHTML = time;

	var interest = (amount*rate*time)/100 ;
	document.getElementById("interest").innerHTML = interest;
}())
