(function(){


	/*Creating List of objects of Employee with Name, Age, Salary, DOB*/
	var employee = [
	{Name: "Anuranjan", Age:22, Salary:700, DOB:"27-11-1996"},
	{Name: "Diksha", Age:22, Salary:6000, DOB:"25-09-1996"},
	{Name: "Vats", Age:17, Salary: 4500, DOB:"20-11-2001"},
	{Name: "Jaiswal", Age:23, Salary: 7000, DOB:"23-07-1995"}
	] ;

	var list_len = employee.length ;
	var index;

	for(i=0;i< list_len;i++)
	{	
		index = i + 1;
		console.log("Record of employee number " + index + ":");
		for(var key in employee[i])
		{
			console.log(key + ":" + employee[i][key]);
		}
	}

	console.log("\n");

	/* Filter all employees with salary greater than 5000 */

	for(i=0;i< list_len;i++)
	{
		if(employee[i]["Salary"]>5000)
		{
			console.log(employee[i]["Name"]+" has salary > 5000");
		}
	}

	console.log("\n");

	/*Group employees on the basis of the age*/

	for(i=0; i< list_len;i++)
	{
		if(employee[i].Age < 18)
		{
			console.log(employee[i].Name + " is below 18");
		}
		else {
			console.log(employee[i].Name + " is 18+");
		}
	}
	console.log("\n");
	/* Fetch employees with salary less than 1000 and age more than 20. Then give them increment 5 times their salary */

	for(i=0;i<list_len;i++)
	{
		if(employee[i].Salary < 1000 && employee[i].Age > 20)
		{
			employee[i].Salary = employee[i].Salary*5;
			console.log(employee[i].Name+"'s salary incremented to Rs."+employee[i].Salary);
		}
	}



}() );