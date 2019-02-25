import UIKit



//  Assignment - Day 5 - Swift Advance

// 1. What is extension?
// Ans 1. Swift Extension is a useful feature that helps in adding more functionality to an existing Class, Structure, Enumeration or a Protocol type. This includes adding functionalities for types where you don’t have the original source code too (extensions for Int, Bool, String etc. types).


//class textDel
//{
//
//}
//
//extension textDel
//{
//    var TextViewDel : UITextView
//    {
//        return UITextView
//    }
//}
//
//var checktextDel = textDel()



// 3. Write a protocol and create an extension of the protocol. In extension create a function
//
// func sayHello() {
//
//    print(“Hello!”)
//
//}

protocol basic
{
    func sayHello()
}
extension ExtendBasic : basic
{
    func sayHello() {
        print("Hello!")
    }
}
class ExtendBasic
{
    var name : String
    init(name : String) {
        self.name = name
    }
}

var obj = ExtendBasic(name : "Anuranjan")
obj.sayHello()


//  4.Write an enum and create an extension of the enum.



enum Planets: String {
    case Earth
    case Mars
    case Jupiter
    case Saturn
}

extension Planets {
    var value: String {
        return self.rawValue
    }
    
    func printValue() {
        switch self {
        case .Earth:
            print("Earth is 3rd")
        case .Mars:
            print("Mars is 4th")
        case .Jupiter:
            print("Jupiter is 5th")
        case .Saturn:
            print("Saturn is 6th")
        }
    }
}

Planets.Mars.printValue()

// 5. What is Generic
//Ans. Generic code enables us to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

// 6. Explain generic with an example?


func swapInt1 (_ num1 : inout Int ,_ num2 : inout Int)
{
    let temporary = num1
    num1 = num2
    num2 = temporary
}
func swapDouble1 (num1 : inout Double , num2 : inout Double)
{
    let temporary = num1
    num1 = num2
    num2 = temporary
}

//Non - generic

var firstnumint : Int = 12
var secondnumint : Int = 10
swapInt1( &firstnumint ,  &secondnumint)

var firstnumDoub : Double = 12.60
var secondnumDoub : Double = 8.40
swapDouble1(num1: &firstnumDoub, num2: &secondnumDoub)


// Generic
func swappingAllType <A>(_ num1 : inout A , _ num2 : inout A )
{
    let Temporary = num1
    num1 = num2
    num2 = Temporary
}
var firstNum = 12
var secondNum = 11
swappingAllType(&firstNum, &secondNum)

var firstString = "Anu"
var secondString = "Una"
swappingAllType(&secondString, &firstString)



// 7. Explain the difference between map and compactMap with an example
/* Ans 7.
 Map : Map is a high order function which Returns an array containing the results of mapping the given closure over the sequence’s elements.
 
 CompactMap : CompactMap is a high order function which Returns an array containing the non-nil results of calling the given transformation with each element of this sequence.
 */
//example
let mixedUpArray : [Int?] = [1,nil,2,nil,3,nil,4]
let mapArray = mixedUpArray.map{$0}
print(mapArray)
let mapCompactArray = mixedUpArray.compactMap{$0}
print(mapCompactArray)

// 8. Write an example of reduce function with initial value 1000.

var maxNumber = Array(1...5)
    .reduce(1000) { (total, number) in (total + number) }
print(maxNumber)

// 9.

//struct Person {
//
//
//
//var name : String
//
//var age : Int
//
//
//
//}
//
//let person1 = Person(name: "Sam", age: 23)
//
//let person2 = Person(name: "John", age: 30)
//
//let person3 = Person(name: "Rob", age: 27)
//
//let person4 = Person(name: "Luke", age: 20)
//
//
//
//let personArray = [person1, person2, person3, person4]
//
//
//
//Find all person whose age is more than 25 using filter function.

struct Person {
    
    var name : String
    
    var age : Int
    
}

let person1 = Person(name: "Anu", age: 23)

let person2 = Person(name: "Prince", age: 30)

let person3 = Person(name: "King", age: 27)

let person4 = Person(name: "Queen", age: 20)



let personArray = [person1, person2, person3, person4]

var eligibleForAlcohol = personArray.filter{$0.age > 25}
for person in eligibleForAlcohol
{
    print(person.name," is older then 25")
}

