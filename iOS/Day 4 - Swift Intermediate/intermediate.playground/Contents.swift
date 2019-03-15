import UIKit

// Assignment - Day 4 - Swift Intermediate level

// Question 1
//Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and “sifts out” the beans from the other groceries. The function should take one argument that has a parameter name called list, and it should return a named tuple of the type (beans: [String], otherGroceries: [String]).
//
//
//
//Here is an example of how you should be able to call your function and what the result should be:
//
//let result = siftBeans(fromGroceryList: ["green beans",
//
//                                         "milk",
//
//                                         "black beans",
//
//                                         "pinto beans",
//
//                                         "apples"])
//
//
//
//result.beans == ["green beans", "black beans", "pinto beans"] // true
//
//result.otherGroceries == ["milk", "apples"] // true”


// Ans 1.

func siftBeans(fromGroceryList: [String]) -> (bean:[String], otherGrocerie: [String])
{
    var beans : [String] = []
    var otherGroceries : [String] = []
    for grocery in fromGroceryList {
        if grocery.contains("beans"){
            beans.append(grocery)
        }
        else {
            otherGroceries.append(grocery)
        }
    }
    
    let tup = (bean : beans, otherGrocerie : otherGroceries)
    return tup
    
}

let result = siftBeans(fromGroceryList: ["green beans","milk","black beans","pinto beans","apples"])

print(result.bean)
print(result.otherGrocerie)




// Question 2

/*
Write a function called siftBeans(fromGroceryList:) that takes a grocery list (as an array of strings) and “sifts out” the beans from the other groceries. The function should take one argument that has a parameter name called list, and it should return a named tuple of the type (beans: [String], otherGroceries: [String]).



Here is an example of how you should be able to call your function and what the result should be:

let result = siftBeans(fromGroceryList: ["green beans",
                                         
                                         "milk",
                                         
                                         "black beans",
                                         
                                         "pinto beans",
                                         
                                         "apples"])



result.beans == ["green beans", "black beans", "pinto beans"] // true

result.otherGroceries == ["milk", "apples"] // true”



Question 2 -
    
Make a calculator class with a function name “equals” that take a enum case as value like multiply, subtraction, addition, square root, division.

Make same calculator using functions as argument, define all type functions in a struct.

Test Run:

let calObj = AnkitCalculator()

calObj.equals(operation: .addition(operandOne: 2, operandTwo: 4))

calObj.equals(operation: .division(operandOne: 5, operandTwo: 4))

// Using Funct as params

calObj.equalFuncOp(operationValues: (4,5), operationFunc: AnkitCalculator.CalculatorStruct.addition(operandOne:operandTwo:))

calObj.equalFuncOp(operationValues: (5,7), operationFunc: AnkitCalculator.CalculatorStruct.multiplication(operandOne:operandTwo:))

Output Result :

Operation Result = 6.0

Operation Result = 3.0

Operation Result using func as param = 9.0

Operation Result using func as param = 25.0


*/

// Using Class

class Calculator {
    
    enum operation {
        case addition(operandOne : Double, operandTwo : Double)
        case subtraction(operandOne : Double, operandTwo : Double)
        case division(operandOne : Double, operandTwo : Double)
        case multiplication(operandOne : Double, operandTwo : Double)
    }
    
    func equals(oper : operation) -> Double {
        
        var calculatedResult = 0.0
        switch oper {
        case .addition(let op1, let op2) : calculatedResult = op1 + op2
        case .subtraction(let op1, let op2) : calculatedResult =  op1 - op2
        case .multiplication(let op1, let op2) :calculatedResult =  op1*op2
        case .division(let op1, let op2) : if op2 != 0 { calculatedResult =  op1/op2}
        }
        
        return calculatedResult
    
    }
}

let obj = Calculator()
print(obj.equals(oper: .addition(operandOne : 3, operandTwo :9)))
print(obj.equals(oper: .multiplication(operandOne: 4, operandTwo: 5)))

// Using Structure

struct CalculatorStruct {
    
    func addition(operandOne : Int, operandTwo : Int) -> Int
    {
        return operandOne + operandTwo
    }
    
    func subtraction(operandOne : Int, operandTwo : Int) -> Int
    {
        return operandOne - operandTwo
    }
    func multiplication(operandOne : Int, operandTwo : Int) -> Int {
        return operandTwo * operandOne
    }
    func division(operandOne : Int, operandTwo : Int) -> Int {
        return operandTwo/operandOne
    }
    func equalFuncOp(operationValues : (Int, Int), operationFunc : (Int, Int) -> Int) -> Int{
        let resultC = operationFunc(operationValues.0, operationValues.1)
        return resultC
    }
}

let obj4 = CalculatorStruct()
print(obj4.equalFuncOp(operationValues: (4,5), operationFunc: obj4.addition(operandOne:operandTwo:)))

