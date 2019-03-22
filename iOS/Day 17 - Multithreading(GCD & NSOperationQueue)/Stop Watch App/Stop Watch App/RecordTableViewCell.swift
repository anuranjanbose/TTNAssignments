//
//  RecordTableViewCell.swift
//  Stop Watch App
//
//  Created by Anuranjan Bose on 20/03/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    @IBOutlet weak var recordTimeLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellLabel(time: String) {
        recordTimeLabel.text = time
    }
}
