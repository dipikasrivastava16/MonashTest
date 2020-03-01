//
//  ClassTableViewCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var lectureAddress: UILabel!
    @IBOutlet weak var lectureBy: UILabel!
    @IBOutlet weak var lecturename: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(cellModel: Lecture) {
        lecturename.text = cellModel.lectureName
        lectureBy.text = cellModel.lectureBy
        lectureAddress.text = cellModel.lectureAddress
        startTime.text = cellModel.startTime
        endTime.text = cellModel.endTime
    }

}
