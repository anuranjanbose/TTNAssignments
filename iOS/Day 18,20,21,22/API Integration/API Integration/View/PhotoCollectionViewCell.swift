//
//  PhotoCollectionViewCell.swift
//  API Integration
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var animatorView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var photoAuthorNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fetchImage(image: UIImage) {
        animatorView.isHidden = true
        //photoImageView.isHidden = false
        photoView.isHidden = false
        photoImageView.image = image
    }

    func fetchAuthorName(authorName: String) {
        self.photoAuthorNameLabel.text = authorName
    }
}
