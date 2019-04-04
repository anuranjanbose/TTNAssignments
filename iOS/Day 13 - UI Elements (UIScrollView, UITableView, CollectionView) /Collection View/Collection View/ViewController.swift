//
//  ViewController.swift
//  Collection View
//
//  Created by Anuranjan Bose on 23/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView : UITableView!
    
    let genreList : [String] = ["Action", "Drama", "Science fiction", "Kids"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Videos"
        //tableView.dataSource = self
        let nib = UINib.init(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return genreList[section]
    }
}

