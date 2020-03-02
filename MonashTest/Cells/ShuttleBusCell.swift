//
//  ShuttleBusCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class ShuttleBusCell: ParentCell {

    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var start: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configureCell(cellModel: Any) {
        if let model = cellModel as? ShuttleBus {
            start.text = model.start
            destination.text = model.destination
            duration.text = model.dueIn
        }
    }

}
