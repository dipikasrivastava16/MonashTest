//
//  CarParkCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class CarParkCell: UITableViewCell {

    @IBOutlet weak var numberValue: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(cellModel: CarPark) {
        itemName.text = cellModel.name
        numberValue.text = "\(cellModel.number)"
    }


}
