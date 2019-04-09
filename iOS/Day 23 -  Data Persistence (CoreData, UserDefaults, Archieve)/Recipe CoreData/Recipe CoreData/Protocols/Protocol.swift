//
//  Protocol.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol Loggable {
    func signIn(userId: String ,  key : String)
    func signOut(userId : String)
}
protocol ToastMessage {
    func toast(message: String)
}

protocol ErrorDisplay : class {
    func validateEmailAdd(_ textfield: UITextField) throws -> String
    func validatePassword(_ textfield: UITextField) throws -> String
}

protocol SavingDataToDataBase {
    func addData(name : String , origin : String , favorite : Bool , timeToPrep : String , madeBy : String , ingrediant : String)
}



enum Validation : Error {
    case invalid(String)
}



//Fetches Recipes which are favourites
class FetchResultController {
    let favouriteValue = true
    fileprivate lazy var fetchedResultController1: NSFetchedResultsController<Recipe> = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        fetchRequest.predicate = NSPredicate(format: "favorite == true")
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
}










