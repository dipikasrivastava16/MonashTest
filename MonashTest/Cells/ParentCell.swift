//
//  ParentCell.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import UIKit

class ParentCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCorner(row: Int, section: Int, totalRow: Int) {
        
        // add corners
        if row == 0 {
            if section == 0 {
                if row == totalRow - 1 {
                    containerView.layer.cornerRadius = 5.0
                    containerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
                }
            } else if row == totalRow - 1 {
                containerView.layer.cornerRadius = 5.0
                containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
            } else {
                containerView.layer.cornerRadius = 5.0
                containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            }
        } else if row == totalRow - 1 {
            containerView.layer.cornerRadius = 5.0
            containerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        }
        
        if row != totalRow - 1 {
            self.clipsToBounds = true
        }
    }
    
    func  addSeparater(row: Int, totalRows: Int, cellHeight: CGFloat) {
        // add seprater
        if row != totalRows - 1 {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: containerView.frame.origin.x + 15, y: cellHeight-1, width:containerView.frame.size.width - 30, height: 1.0)
        bottomBorder.backgroundColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        contentView.layer.addSublayer(bottomBorder)
        }
    }
    
    func configureCell(cellModel: Any) {
        // No-Op
    }

}
