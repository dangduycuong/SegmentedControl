//
//  CustomTableViewCell.swift
//  SegmentedControl
//
//  Created by Cuong on 4/28/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var displayView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
