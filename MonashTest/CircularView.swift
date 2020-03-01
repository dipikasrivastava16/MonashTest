//
//  CircularView.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation
import UIKit

class CircularView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height/2
    }
}
