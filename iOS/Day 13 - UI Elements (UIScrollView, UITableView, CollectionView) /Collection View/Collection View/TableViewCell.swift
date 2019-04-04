//
//  TableViewCell.swift
//  Collection View
//
//  Created by Anuranjan Bose on 23/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionViewOutlet : UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib.init(nibName: "CollectionViewCell", bundle: nil)
        collectionViewOutlet.register(nib, forCellWithReuseIdentifier: "collectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
}
