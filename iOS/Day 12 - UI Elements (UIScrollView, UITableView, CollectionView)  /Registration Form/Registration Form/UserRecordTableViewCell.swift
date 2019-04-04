//
//  UserRecordTableViewCell.swift
//  Registration Form
//
//  Created by Anuranjan Bose on 04/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class UserRecordTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePictureImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var userContactNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
