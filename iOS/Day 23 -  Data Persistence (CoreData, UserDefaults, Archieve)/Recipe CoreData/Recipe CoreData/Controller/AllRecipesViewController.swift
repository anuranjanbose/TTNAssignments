//
//  AllRecipesViewController.swift
//  Recipe CoreData
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit
import CoreData

class AllRecipesViewController: UIViewController,  UITableViewDelegate , UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var allRecipeTableView: UITableView!
    @IBOutlet weak var editRecipeButton: UIButton!
    fileprivate lazy var fetchedResultController: NSFetchedResultsController<Recipe> =
    {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        try! fetchResultController.performFetch()
        return fetchResultController
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        allRecipeTableView.delegate = self
        allRecipeTableView.dataSource = self
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        urls[urls.count - 1] as NSURL
        print(urls)
        allRecipeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        fetchedResultController.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
        allRecipeTableView.reloadData()
    }
    @IBAction func editRecipeButtonIBAction(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "AddMoreVC")
        self.navigationController?.present(controller, animated: true, completion: nil)
    }

    
    @IBAction func logoutButtonIBAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: emailText!)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func plusButtonIBAction(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "AddMoreVC")
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (fetchedResultController.fetchedObjects?.count)!

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeTemp = fetchedResultController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = recipeTemp.name
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = fetchedResultController.object(at: indexPath)
        tableView.allowsSelectionDuringEditing = true

            UserDefaults.standard.set(obj.name, forKey: "abc")
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "UpdateRecipeDetails")
        self.present(controller, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let recipe = fetchedResultController.object(at: indexPath)
            context!.delete(recipe)
            do {
                try context!.save()
                print("saved!")
                //tableView.reloadData()
            } catch {
                
            }
        }
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        allRecipeTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        allRecipeTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if(type == .delete) {
            allRecipeTableView.deleteRows(at: [indexPath!] , with: .fade)
            
        }
        else if(type == .insert) {
            let currentIndexPath = self.fetchedResultController.indexPath(forObject: anObject as! Recipe)
            if(currentIndexPath != nil) {
                self.allRecipeTableView.insertRows(at: [currentIndexPath!], with: .fade)
            }
        }
        else if(type == .update) {
            allRecipeTableView.deleteRows(at: [indexPath!] , with: .fade)
            let currentIndexPath = self.fetchedResultController.indexPath(forObject: anObject as! Recipe)
            if(currentIndexPath != nil) {
                self.allRecipeTableView.insertRows(at: [currentIndexPath!], with: .fade)
            }
        }
    }
    


    

}
