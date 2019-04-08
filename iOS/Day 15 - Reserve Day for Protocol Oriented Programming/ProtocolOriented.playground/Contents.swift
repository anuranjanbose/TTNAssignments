import UIKit
/*:

 
Question 2: Explain the use of self,Self in protocols, Also how they differ for Static function.
 

 
 self :
 self is basically an object and is used to refer to the current instance within it's own instance method
 
 
 Self :
 
 Self is basically the type, which conforms to the protocol

 static :
 > Swift lets you create properties and methods that belong to a type, rather than to instances of a type. This is helpful for organizing your data meaningfully by storing shared data.
 > Swift calls these shared properties "static properties", and you create one just by using the static keyword. Once that's done, you access the property by using the full name of the type.
 
Question 3: Write a generic function that takes two operand and combine them.  Example = add(1 + 1), add(1.0 + 1.0), add(Ankit + nigam)
 */

protocol GenericAddition{
    func add(firstEntity: Int, secondEntity: Int) -> Int
    func add(firstEntity: Double, secondEntity: Double) -> Double
    func add(firstEntity: String, secondEntity: String) -> String
    func add(firstEntity: Float, secondEntity: Float) -> Float
    
    
}

class Addition: GenericAddition {
    func add(firstEntity: Int, secondEntity: Int) -> Int {
        return firstEntity + secondEntity
    }
    
    func add(firstEntity: Double, secondEntity: Double) -> Double {
        return firstEntity + secondEntity
        
    }
    
    func add(firstEntity: String, secondEntity: String) -> String {
        return firstEntity + secondEntity
    }
    
    func add(firstEntity: Float, secondEntity: Float) -> Float {
        return firstEntity + secondEntity
    }
    
}

let objectAddition = Addition()
print(objectAddition.add(firstEntity: 34.67, secondEntity: 0.56))
print(objectAddition.add(firstEntity: "Ankit", secondEntity: "Nigam"))
print(objectAddition.add(firstEntity: 3, secondEntity: 6))
print(objectAddition.add(firstEntity: 5.6, secondEntity: 8.0))


//Question 4 Write an extension on collection type to find the combined value of collection.


protocol Number {
    static func +(l: Self, r: Self) -> Self
}

extension Double : Number {}
extension Float  : Number {}
extension Int    : Number {}
extension String : Number {}


infix operator +=

func += <T:Number> ( left: inout T, right: T) {
    left = left + right
}


prefix operator +/

prefix func +/ <T:Number>(toCombine:[T]?) -> T? {
    switch true {
    case toCombine == nil: return nil
        
    case toCombine!.isEmpty: return ("Array is empty" as! T)
        
    default: var result = toCombine![0]
            for element in 1..<toCombine!.count {
            result += toCombine![element]
            }
        return result
    }
}
let doubleType = [ 14.5, 5, 4, 4 ]
let integerType = [91, 27, 230, 454]
let stringType = ["Anuranjan"," Bose"," iOS"]
let string = [String]()
print(+/doubleType ?? 0)
print(+/integerType ?? 0 )
print(+/stringType ?? "Empty string" )
print(+/string ?? "Array is empty")





