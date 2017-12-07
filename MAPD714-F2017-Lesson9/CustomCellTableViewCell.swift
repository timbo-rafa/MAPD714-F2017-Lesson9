//
//  CustomCellTableViewCell.swift
//  MAPD714-F2017-Lesson9
//
//  Created by Student on 2017-12-06.
//  Copyright © 2017 Rafael Matos. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var CellText: UITextField!
    
    @IBOutlet weak var CellSlider: UISlider!
    @IBOutlet weak var SliderNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        SliderNumber.text = sender.value
        
    }

    
}
