//
//  ClassTableViewCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class ClassTableViewCell: ParentCell {

    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var lectureAddress: UILabel!
    @IBOutlet weak var lectureBy: UILabel!
    @IBOutlet weak var lecturename: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configureCell(cellModel: Any) {
        if let model = cellModel as? Lecture {
            lecturename.text = model.lectureName
            lectureBy.text = model.lectureBy
            lectureAddress.text = model.lectureAddress
            startTime.text = model.startTime
            endTime.text = model.endTime
        }
    }

}
