//
//  SquareView.swift
//  ShapeLayerTutorial
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

import Reusable

class SquareView: UIView, NibLoadable {

    @IBOutlet weak var contentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.contentView.backgroundColor = UIColor.orange.withAlphaComponent(0.8)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addDashedLine()
        self.addMask()
    }

    fileprivate func addDashedLine() {
        let borderName = "BorderLayer"
        
        self.contentView.layer.sublayers?.filter({ $0.name == borderName }).forEach({ $0.removeFromSuperlayer() })
        let borderWidth: CGFloat = 2
        
        let borderLayer = CAShapeLayer()
        borderLayer.name = borderName
        borderLayer.lineDashPattern = [4, 2]
        let initPoint: CGPoint = CGPoint(x: 0, y: self.contentView.bounds.height/2  - borderWidth)
        borderLayer.frame = CGRect(origin: initPoint, size: CGSize(width: self.contentView.bounds.width, height: borderWidth))
        borderLayer.strokeColor = UIColor.black.cgColor
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(rect: self.contentView.bounds).cgPath
        
        
        self.contentView.layer.addSublayer(borderLayer)
    }
    
    fileprivate func addMask() {
        let maskLayer = CAShapeLayer()
        let contentHeight: CGFloat = self.contentView.bounds.height
        let contentWidth: CGFloat = self.contentView.bounds.width
        
        let innerRadius: CGFloat = 50
        
        let path = UIBezierPath()
        
        let clockWise: Bool = true
        
        path.move(to: .zero)
        path.addLine(to: .init(x: 0, y: contentHeight/2 - innerRadius))
        path.addArc(withCenter: .init(x: 0, y: contentHeight/2), radius: innerRadius, startAngle: 270.toRadians, endAngle: 90.toRadians, clockwise: clockWise)
        path.addLine(to: .init(x: 0, y: contentHeight))
        path.addLine(to: .init(x: contentWidth, y: contentHeight))
        path.addLine(to: .init(x: contentWidth, y: contentHeight/2 + innerRadius))
        path.addArc(withCenter: .init(x: contentWidth, y: contentHeight/2), radius: innerRadius, startAngle: 90.toRadians, endAngle: 270.toRadians, clockwise: clockWise)
        path.addLine(to: .init(x: contentWidth, y: 0))
        path.move(to: .zero)
        path.close()
        
        maskLayer.path = path.cgPath
//        maskLayer.fillColor = UIColor.purple.cgColor
        self.contentView.layer.mask = maskLayer
//        self.contentView.layer.addSublayer(maskLayer)
    }
}
