//
//  DataTableViewCell.swift
//  ToDo
//
//  Created by Shakhzod Bektemirov on 2021/08/16.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
