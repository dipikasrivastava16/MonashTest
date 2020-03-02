//
//  CarParkCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class CarParkCell: ParentCell {

    @IBOutlet weak var numberValue: UILabel!
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configureCell(cellModel: Any) {
        if let model = cellModel as? CarPark {
            itemName.text = model.name
            numberValue.text = "\(model.number)"
        }
    }
}
