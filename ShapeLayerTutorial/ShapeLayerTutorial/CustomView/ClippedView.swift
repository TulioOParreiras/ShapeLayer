//
//  ClippedView.swift
//  ShapeLayerTutorial
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

class ClippedView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addDashedBorder()
    }
    private func addDashedBorder() {
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = UIColor.black.cgColor
        yourViewBorder.lineDashPattern = [6, 4]
        yourViewBorder.frame = CGRect(x: 0, y: self.bounds.height - 2, width: self.bounds.width, height: 2)
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(yourViewBorder)
    }

}


extension Double {
    var toRadians: CGFloat {
        return CGFloat(self).toRadians
    }
}

extension CGFloat {
    var toRadians: CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
