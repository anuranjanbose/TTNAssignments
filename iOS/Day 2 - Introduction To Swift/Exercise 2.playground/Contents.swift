import UIKit

// EXERCISE 2

//Personal Information Structure
struct PersonalInformation {
    var employeeID: Int
    var name: String
    var country: String
    var address: String
    var hobbies: String?
}



//Adding entries in Personal Structure
var personalArray: [PersonalInformation] = []

    personalArray.append(PersonalInformation(employeeID: 100, name: "Anuranjan Bose", country: "India", address: "Delhi", hobbies: "Cricket"))
    personalArray.append(PersonalInformation(employeeID: 200, name: "Tony Stark", country: "America", address: "California", hobbies: "Music"))
    personalArray.append(PersonalInformation(employeeID: 300, name: "Sherlock", country: "Britain", address: "England", hobbies: "Football"))
    personalArray.append(PersonalInformation(employeeID: 400, name: "Goku", country: "Japan", address: "Nagasaki", hobbies: "Martial Arts"))
    personalArray.append(PersonalInformation(employeeID: 500, name: "Jinping", country: "China", address: "Beijing", hobbies: nil))

//Professional Information Structure
struct ProfessionalInformation {
    var employeeID: Int
    var name: String
    var department: String
    var branch: String
    var experience: Int
}




var professionalArray: [ProfessionalInformation] = []

    professionalArray.append(ProfessionalInformation(employeeID: 100, name: "Anuranjan Bose", department: "iOS", branch: "India", experience: 2))
    professionalArray.append(ProfessionalInformation(employeeID: 200, name: "Tony Stark", department: "Android", branch: "America", experience: 1))
    professionalArray.append(ProfessionalInformation(employeeID: 300, name: "Sherlock", department: "JVM", branch: "Britain", experience: 3))
    professionalArray.append(ProfessionalInformation(employeeID: 700, name: "Goku", department: "FullStack", branch: "Japan", experience: 2))
    professionalArray.append(ProfessionalInformation(employeeID: 800, name: "Steve", department: "Web", branch: "America", experience: 5))


//Question 1: Create a third employee structure that contains the information from both based on common id.

struct Employee {
    var employeeID: Int
    var name: String
    var department: String
    var branch: String
    var experience: Int
    var address: String
    var country: String
    var hobbies: String?
}

var empArray: [Employee] = []

for personalEmp in personalArray {
    for professionalEmp in professionalArray {
        if (personalEmp.employeeID == professionalEmp.employeeID) {
            empArray.append(Employee(employeeID: personalEmp.employeeID, name: personalEmp.name, department: professionalEmp.department, branch: professionalEmp.branch, experience: professionalEmp.experience, address: personalEmp.address, country: personalEmp.country, hobbies: personalEmp.hobbies))
        }
    }
}


for employee in empArray {
    print(employee)
}

//Question 2: write a function that takes the two structure and give me list of all the employee that live in certain country

func certainCountry(){
    for personalEmp in personalArray {
        for professionalEmp in professionalArray{
            if (personalEmp.employeeID == professionalEmp.employeeID && personalEmp.country=="India")
            {
                print(personalEmp)
            }
        }
    }

}
certainCountry()

//Question 3: write a function that give me list of all the employee that live in certain department
func certainDepartment(){
   
    for emp in empArray {
        if (emp.department=="JVM")
        {
            print(emp)
        }
    }
}
certainDepartment()

//Question 4: write a function that give me list of all the employee that live in same country and work in the same branch.
func sameCountryBranch(){
  
    for emp1 in empArray {
        for emp2 in empArray {
            if (emp1.country == emp2.branch) {
                print(emp1)
            }
        }
    }
}
sameCountryBranch()

//Question 5: write a function that return me list of all the employee name that has a hobby and with their experience.
func hobbyAndExp(){

    for emp in empArray {
        print("ID: \(emp.employeeID), Name: \(emp.name), Hobbies: \(emp.hobbies ?? "Unavailable"), Experience: \(emp.experience)")
    }
}
hobbyAndExp()

//Question 6: write a function that return me list of all the employee name that starts with any “S”
func startWithS() {
    for emp in empArray {
        if (emp.name.prefix(1)=="S") {
            print(emp)
        }
    }

}
startWithS()



// THE END
