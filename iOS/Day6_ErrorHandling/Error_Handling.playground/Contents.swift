import UIKit

/*
 
 1. What is Error Protocol? Create a custom error conforming to error protocol
 
 
 Ans. Error protocol is just a type, which can be used to throw error values(which can be thrown). It is mandatory for Error handling and creating error types.
 */
 enum ClothFittingError : Error {
    case clothOutOfStock
    case tooShort
    case tooLarge
 }

class Tailor {
    let pieceOfCloth : Int?
    let availablePieceOfCloth : Int?
    
    init(len1 : Int, len2 : Int) {
        self.pieceOfCloth = len1
        self.availablePieceOfCloth = len2
    }
    
    func checkAvailability() throws -> String
    {
        if self.availablePieceOfCloth == 0 {
            throw ClothFittingError.clothOutOfStock
        }
        else if pieceOfCloth! < 50 {
            throw ClothFittingError.tooShort
        }
        else if pieceOfCloth! > 200 {
            throw ClothFittingError.tooLarge
        }
        else {
        return "OK!"
        }
    }
}

let obj = Tailor(len1: 50, len2: 0)

do {
    try obj.checkAvailability()
}
catch {
    print(error)
}


/*
 
 2. Write a failable initialiser for a class which throws a error  “Object not able to initialise” description a initialisationFailed case, Catch the error and print its error description.
 
 
 
 
 */


enum invalidField: Error {
    
    case initialisationFailed(String)
}

class Input {
    
    var inputField: String?
    init(inputField : String?) throws
    {
        guard  let inputField = inputField else {
            throw invalidField.initialisationFailed("Object not able to initialise")
        }
        
        self.inputField = inputField
        
    }
}

do {
    let obj = try Input(inputField: nil)
}
catch {
    print(error)
}



/*
 
 3. Explain the difference try, try?, try! , make sure to write a program to explain the difference.
 

 
 */

// try : It is used with block of code which may produce an error

// try? : If we use try? with a block of code and if error occurs in it, then it would return nil

// try! : When we are sure that error wont occur, we use try!.
//  e.g. var stud = try! Employee(name : "Anuranjan")

enum DemoErrors : Error {
    
    case zero
}

func checkError(val : Int) throws
{
    if val == 0
    {
        throw DemoErrors.zero
    }
    else
    {
        print("Hurrah! No error!")
    }
}

do {
    try checkError(val: 0)
}
catch
{
    print(error)
}
var error1 = try? checkError(val: 0)
print(error1) //It will print nil
try! checkError(val: 1)


/*

Write a program which loads the data from a datasource of 10 employees looks like below, Program would help to give salary bonus to employees. Which is based on some conditions but if employee is not able to satisfy the condition, program should throw the error with specific error condition and its description should be printed.



Conditions -

Employee should be present on the day.

Employee has completed a year with company

Employee competency should be hot competency like ios, android, bigdata, AI etc. ( make some placeholder competency which would not get bonus )

Employee should have a attendance percent over 80.

Emp -

empID

empName

empEmail

joiningDate

isPresent

competency

attendancePercent



Test Run:

let bonusProgram = BonusProgram()

bonusProgram.allowedForBonus("muskaan@tothenew.com")

bonusProgram.allowedForBonus("mithlesh@tothenew.com")

bonusProgram.allowedForBonus("ankit@tothenew.com")

bonusProgram.allowedForBonus("sachin@tothenew.com")

bonusProgram.allowedForBonus("Merry@tothenew.com")
    
    .... few more run-

// prints

Muskaan is absent today.

Mithlesh competency does not fall under bonus program.

ankit is eligible for bonus.
    
    sachin has joined us on dd/mm/yyyy and still to complete a year with us.
    
    Merry is eligible for bonus.


 */

struct Emp {
    var empId : Int
    var empName : String
    var empEmail : String
    var joiningDate : Date
    var isPresent : Bool
    var competency : String
    var attendancePercent : Double

}
