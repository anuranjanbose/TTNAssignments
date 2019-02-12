(function(){
	var obj1 = {Name:"Anuranjan", Age: 22, Company: "TTN"};

	var obj2 = obj1;

	for(var prop in obj2){
		console.log(prop + ":"+obj2[prop]);
	}
}() );