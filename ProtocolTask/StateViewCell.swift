//
//  StateViewCell.swift
//  ProtocolTask
//
//  Created by Saideep Reddy Talusani on 9/10/24.
//

import UIKit

class StateViewCell: UITableViewCell {

    @IBOutlet weak var countryTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
