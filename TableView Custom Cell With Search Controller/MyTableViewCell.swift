//
//  MyTableViewCell.swift
//  TableView Custom Cell With Search Controller
//
//  Created by Apple on 04/04/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
