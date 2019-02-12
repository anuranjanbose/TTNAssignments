(function() 
{	'use strict';
	var orig = prompt("Enter a string:");

	var i,j;

	var len = orig.length;
	var flag = 1 ;

	for(i=0,j=len-1; i <= j; i++, j--)
	{
		if(orig[i] != orig[j])
		{
			flag = 0;
			break;
		}
	}

	if(flag == 0)
	{
		window.alert("Not a palindrome");

	}
	else if(flag == 1)
	{
		window.alert(orig +" is a palindrome");
	}
}());