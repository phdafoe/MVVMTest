//
//  CusotomCell.swift
//  MVVMTest
//
//  Created by Andres on 20/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class CusotomCell: UITableViewCell {
    
    @IBOutlet weak var myTitleText: UILabel!
    @IBOutlet weak var myCategoriatext: UILabel!
    @IBOutlet weak var myDirectortext: UILabel!
    @IBOutlet weak var mySummaryText: UILabel!
    @IBOutlet weak var myImageMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
