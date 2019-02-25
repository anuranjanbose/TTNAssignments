import UIKit


// Assignment Day 3 iOS


                    // INITIALIZERS

// 1. Implement the parameterised initialisation with class or struct.


class ParameterisedInit{
 
    var name: String
    var id: String
    var competancy: String
    
    init(name: String, id: String, competancy: String){
        self.name = name
        self.id = id
        self.competancy = competancy
        }
    }
let p_Init = ParameterisedInit(name: "Anuranjan", id: "3209",competancy: "iOS" )
print("Name: " + (p_Init.name));
print("ID: " + (p_Init.id));
print("Competency: " + (p_Init.competancy) + " .")

/*
2. Write all the Rules of initialiser in Inheritance
 
 Ans 2.:

  Rule 1: A designated initializer must call a designated initializer from its immediate superclass.
 
  Rule 2: A convenience initializer must call another initializer from the same class.
 
  Rule 3: A convenience initializer must ultimately call a designated initializer.
 
*/


// 3. Using convenience Initializers, write-down the Initializers for MOVIE class having basic attributes like title, author, publish_date, etc.



class Movie{
    
    var title: String
    var author: String
    var publishDate: String
    var releaseDate: String
 
    init(title: String, author: String, publishDate: String, releaseDate: String){
 
        self.title = title
        self.author = author
        self.publishDate = publishDate
        self.releaseDate = releaseDate
    }
    convenience init(){
        self.init(title: "The Letters", author: "Sylvia Plath", publishDate: "04-02-2017", releaseDate: "25-02-2017" )
    }
}
let convenienceInit = Movie()
print(convenienceInit.title)



// 4. Declare a structure which can demonstrate the throwable Initializer


class Employee {
    var employeeId: Int
    var employeeName: String
    var empSalary: Double
 
    init?(employeeId: Int, employeeName: String, empSalary: Double) {
        if employeeId <= 0 {
            return nil
        }
        self.employeeId = employeeId
        self.employeeName = employeeName
        self.empSalary = empSalary
    }
}

var employee = Employee(employeeId: -345, employeeName: "Anuranjan", empSalary: 15100.0)
print(employee?.employeeId as Any )



            //  ARRAY

//1. Create an array containing the 5 different integer values. Write at least 4 ways to do this.
 
 
// 1st way:
 
var array1: Array<Int> = [1,2,3,4,5]
 

 
//  2nd way:
 
 var array2: [Int] = [1,2,3,4,5]
 

 
// 3rd way:
 
 var array3 = Array<Int>()
 
    array3.append(1)
 
    array3.append(2)
 
    array3.append(3)
 
    array3.append(4)
 
    array3.append(5)
 

 
// 4th way:
 
  var array4 = [Int]()
 
  array4.append(1)
 
  array4.append(2)
 
  array4.append(3)
 
  array4.append(4)
 
  array4.append(5)
 
 



 
 
// 2. Create an immutable array containing 5 city names.
 
 
 // Immutable array :
 
  let city1: [String] = ["Varanasi","Kanpur","Ghaziabad","Agra","Noida"]
 
 
 //3. Create an array with city 5 city names. Later add other names like Canada, Switzerland, Spain to the end of the array in at least 2 possible ways.
 
 
  var city2: [String] = ["Varanasi","Kanpur","Ghaziabad","Agra","Noida"]

 
  city2.append("Canada")

  city2.append("Switzerland")

  city2.append("Spain")

 




 
  //4. Create an array with values 14, 18, 15, 16, 23, 52, 95. Replace the values 24 & 48 at 2nd & 4th index of array
 
 
  var num: [Int] = [14,18,15,16,23,52,95]
 
  num[2] = 24
 
  num[4] = 48
 
 

                   //  SETS

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐭", "🦅"]

// 1. Determine whether the set of house animals is a subset of farm animals.

print(houseAnimals.isSubset(of: farmAnimals))

// 2. Determine whether the set of farm animals is a superset of house animals.
 
print(farmAnimals.isSuperset(of: houseAnimals))

// 3.  Determine if the set of farm animals is disjoint with city animals.

print(farmAnimals.isDisjoint(with: cityAnimals))

// 4. Create a set that only contains farm animals that are not also house animals.

let notHouseAnimals: Set = farmAnimals.subtracting(houseAnimals)
print(notHouseAnimals)

 //5. Create a set that contains all the animals from all sets.

let allAnimals: Set = houseAnimals.union(farmAnimals).union(cityAnimals)

print(allAnimals)



                              // DICTIONARY

// 1. Create an empty dictionary with keys of type String and values of type Int and assign it to a variable in as many ways as you can think of (there's at least 4 ways).


// 1st way
 let myDiction1: Dictionary<String, Int> = [:]
// 2nd way
let myDiction2: [String: Int] = [:]
// 3rd way
let myDiction3 = Dictionary<String, Int>()
// 4th way
let myDiction4 = [String: Int]()


// 2. Create a mutable dictionary named secretIdentities where the key value pairs are "Hulk" -> "Bruce Banner", "Batman" -> "Bruce Wayne", and "Superman" -> "Clark Kent".


 var secretIdentities: [String: String] = ["Hulk": "Bruce Banner", "Batman": "Bruce Wayne", "Superman": "Clark Kent"]
print(secretIdentities)

// 3. **Create a nesters structure of Key-value pair.**


var nestedDictionary : [String : Any] = [ "1" : "iOS",
                                "2" : secretIdentities,
                                "3" : "Anuranjan",
                                "4" : [1,2,3]
                                 ]
 print(nestedDictionary)


// 4. Print all the keys in the dictionary


print(secretIdentities.keys)


                                   // SUBSCRIPT

/*

 1. What is subscript ? Write down the declaration syntax.

 Ans.: Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. For example, you access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].

  You can define multiple subscripts for a single type, and the appropriate subscript overload to use is selected based on the type of index value you pass to the subscript. Subscripts are not limited to a single dimension, and you can define subscripts with multiple input parameters to suit your custom type’s needs.

 Declaration Syntax:

subscript (<parameters>) -> <return type> {
    // the getter is required
    get {
        // used for subscript value declarations
    }
    set(newValue) { // the setter is optional
        // definitions are written here
    }
}

*/

// 2. Create a simple subscript that outputs true if a string contains a substring and false otherwise.


class substringTest {
        subscript(index: Int) -> String {
            let string = "Hello"
            let substring = "Anuranjan"
            
            if string.contains(substring) {
                print("Substring: \(substring)")
                return substring
            }
            else{
            return "empty search"
                
            }
        }
}
