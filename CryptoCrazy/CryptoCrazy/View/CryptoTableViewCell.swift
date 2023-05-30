//
//  CryptoTableViewCell.swift
//  CryptoCrazy
//
//  Created by Kadir Aydınlı on 3.01.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var prizeText: UILabel!
    @IBOutlet weak var currencyText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
