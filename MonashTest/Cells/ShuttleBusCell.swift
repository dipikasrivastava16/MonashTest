//
//  ShuttleBusCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class ShuttleBusCell: UITableViewCell {

    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(cellModel: ShuttleBus) {
        start.text = cellModel.start
        destination.text = cellModel.destination
        duration.text = cellModel.dueIn
    }

}
