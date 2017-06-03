//
//  StudentsTableViewCell.swift
//  BlackPearl
//
//  Created by Jasen on 5/31/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
