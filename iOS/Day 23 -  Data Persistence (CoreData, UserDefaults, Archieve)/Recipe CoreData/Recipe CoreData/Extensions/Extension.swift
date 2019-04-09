//
//  Extension.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 09/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit
import CoreData


extension UILabel : ToastMessage{
    func toast(message: String) {
        self.isHidden = false
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        self.alpha = 1.0
        self.textAlignment = .center
        self.text = message
        UIView.animate(withDuration: 7.0, delay: 0.1, options: .allowUserInteraction, animations: {
            self.alpha = 0.0
        }, completion: {(isCompleted) in
            self.isHidden = true
        })
    }
}

extension Loggable {
    func signIn(userId: String, key : String) {
        UserDefaults.standard.set(userId, forKey: key )
    }
    
    func signOut(userId: String) {
        UserDefaults.standard.removeObject(forKey: userId )
    }
}


extension ErrorDisplay where Self : UIViewController {
    
    func validateEmailAdd(_ textfield: UITextField) throws -> String {
        let emailRegEx =  "^[a-z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-z0-9](?:[a-z0-9-]{0,61}[a-zA0-9])?(?:\\.[a-zA0-9](?:[a-z0-9-]{0,61}[a-z0-9])?)*.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: textfield.text)
        if result {
            return "valid email address"
        }
        else {
            throw Validation.invalid("invalid email address")
        }
    }
    func validatePassword(_ textfield: UITextField) throws -> String {
        let passwdRegularExpression = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        //            ^                         Start anchor
        //        (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
        //        (?=.*[!@#$&*])            Ensure string has one special case letter.
        //        (?=.*[0-9].*[0-9])        Ensure string has two digits.
        //        (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
        //        .{8}                      Ensure string is of length 8.
        //        $                         End anchor.
        let passwdordTest = NSPredicate(format:"SELF MATCHES %@", passwdRegularExpression)
        let result = passwdordTest.evaluate(with: textfield.text)
        if result {
            return "valid password"
        }
        else {
            throw Validation.invalid("Your 8 characters password should contain Two uppercase letters,one special chaacter, two digits, three lower case letters ")
        }
    }
}

//Extending SavingDataToDataBase protocol to provide added functionality
extension SavingDataToDataBase {
    func addData(name : String , origin : String , favorite : Bool , timeToPrep : String , madeBy : String , ingrediant : String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)
        let recipeObject = NSManagedObject(entity: entity!, insertInto: context)
        recipeObject.setValue(name, forKey: "name")
        recipeObject.setValue(origin, forKey: "origin")
        recipeObject.setValue(favorite, forKey: "favorite")
        recipeObject.setValue(timeToPrep, forKey: "time")
        recipeObject.setValue(madeBy, forKey: "madeBy")
        recipeObject.setValue(ingrediant, forKey: "ingrediants")
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
