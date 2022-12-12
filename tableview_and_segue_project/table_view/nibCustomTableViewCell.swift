//
//  nibCustomTableViewCell.swift
//  table_view
//
//  Created by BJIT on 15/09/1401 AP.
//

import UIKit

class nibCustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nibLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
