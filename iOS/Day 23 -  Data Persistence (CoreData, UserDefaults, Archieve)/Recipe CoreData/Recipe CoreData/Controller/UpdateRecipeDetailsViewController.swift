//
//  UpdateRecipeDetailsViewController.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © Anuranjan Bose. All rights reserved.
//

import UIKit
import CoreData

class UpdateRecipeDetailsViewController: UIViewController , NSFetchRequestResult , SavingDataToDataBase {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var madeByTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextField!
    @IBOutlet weak var favouriteSwitch: UISwitch!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    var favourite : Bool?
    
    fileprivate lazy var fetchedResultController: NSFetchedResultsController<Recipe> = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        fetchRequest.predicate = NSPredicate(format: "name == '\(UserDefaults.standard.object(forKey: "abc")!)'")
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeUpdate = fetchedResultController.fetchedObjects?.first
        nameTextField.text = recipeUpdate!.name!
        madeByTextField.text = recipeUpdate!.madeBy!
        timeTextField.text = recipeUpdate!.time!
        originTextField.text = recipeUpdate!.origin!
        ingredientsTextField.text = recipeUpdate!.ingrediants!
    }
    override func viewWillAppear(_ animated: Bool) {
        favouriteSwitch.isOn = true
        favourite = true
    }
    @IBAction func favoriteSwitchIBAction() {
        if(favouriteSwitch.isOn) {
            favourite = true
        }
        else {
            favourite = false
        }
    }
    @IBAction func updateButtonAction(_ sender: Any) {
        let recipeUpdate = fetchedResultController.fetchedObjects?.first
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        recipeUpdate!.setValue(nameTextField.text!, forKey: "name")
        recipeUpdate!.setValue(madeByTextField.text!, forKey: "madeBy")
        recipeUpdate!.setValue(timeTextField.text!, forKey: "time")
        recipeUpdate!.setValue(originTextField.text!, forKey: "origin")
        recipeUpdate!.setValue(ingredientsTextField.text!, forKey: "ingrediants")
        recipeUpdate!.setValue(favourite, forKey: "favorite")
        do {
            try context.save()
        }
        catch {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func canceButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
