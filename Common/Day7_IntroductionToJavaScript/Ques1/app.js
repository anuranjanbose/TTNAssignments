function calc() {
	'use strict';
	var amount = prompt("Enter amount:");

	var rate = prompt("Enter rate:");

	var time = prompt("Enter no. of years:");

	var interest = (amount*rate*time)/100 ;
	document.getElementById("interest").innerHTML = interest;


}