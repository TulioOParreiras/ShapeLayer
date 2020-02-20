//
//  CustomView.swift
//  ShapeLayerTutorial
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

import Reusable


class CustomView: UIView, NibLoadable {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    lazy var topView: TopView = self.createTopView()
    lazy var midView: MidView = self.createMidView()
    lazy var buttonView: ButtonView = self.createButtonView()
    
    let stackSubviewsBackgroundColor: UIColor = .white
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .lightGray
        self.stackView.addArrangedSubview(self.topView)
        self.stackView.addArrangedSubview(self.midView)
        self.stackView.addArrangedSubview(self.buttonView)
//        self.stackView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupStackLayerMask()
    }
    
    private func setupStackLayerMask() {
        let layer = CAShapeLayer()
        let contentBounds = self.contentView.bounds
        let contentWidth = contentBounds.width
        let contentHeight = contentBounds.height
        
        let midBounds = self.midView.frame
        let buttonBounds = self.buttonView.frame
        let cornerRadius: CGFloat = 10
        let innerRadius: CGFloat = 6
        let dottedLineAdjust: CGFloat = 1.5
        
        let path = UIBezierPath()

        path.move(to: .init(x: cornerRadius, y: 0))
        path.addLine(to: .init(x: contentWidth - cornerRadius, y: 0))
        path.addArc(withCenter: .init(x: contentWidth - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: 270.toRadians, endAngle: 0.toRadians, clockwise: true)
        
        // MARK: Circulo interno direita primeiro
        path.addLine(to: .init(x: contentWidth, y: midBounds.origin.y - innerRadius - dottedLineAdjust))
        path.addArc(withCenter: .init(x: contentWidth, y: midBounds.origin.y - dottedLineAdjust), radius: innerRadius, startAngle: 270.toRadians, endAngle: 90.toRadians, clockwise: false)
        
        
        // MARK: Circulo interno direita segundo
        path.addLine(to: .init(x: contentWidth, y: buttonBounds.origin.y - innerRadius))
        path.addArc(withCenter: .init(x: contentWidth, y: buttonBounds.origin.y - dottedLineAdjust), radius: innerRadius, startAngle: 270.toRadians, endAngle: 90.toRadians, clockwise: false)
        path.addLine(to: .init(x: contentWidth, y: contentHeight - 10))
        
        path.addArc(withCenter: .init(x: contentWidth - cornerRadius, y: contentHeight - cornerRadius), radius: cornerRadius, startAngle: 0.toRadians, endAngle: 90.toRadians, clockwise: true)
        path.addLine(to: .init(x: cornerRadius, y: contentHeight))
        path.addArc(withCenter: .init(x: cornerRadius, y: contentHeight - cornerRadius), radius: cornerRadius, startAngle: 90.toRadians, endAngle: 180.toRadians, clockwise: true)
        
        // MARK: Circulo interno esquerda segundo
        path.addLine(to: .init(x: 0, y: buttonBounds.origin.y + innerRadius - dottedLineAdjust))
        path.addArc(withCenter: .init(x: 0, y: buttonBounds.origin.y - dottedLineAdjust), radius: innerRadius, startAngle: 90.toRadians, endAngle: 270.toRadians, clockwise: false)
        
        // MARK: Circulo interno esquerda primeiro
        path.addLine(to: .init(x: 0, y: midBounds.origin.y + innerRadius - dottedLineAdjust))
        path.addArc(withCenter: .init(x: 0, y: midBounds.origin.y - dottedLineAdjust), radius: innerRadius, startAngle: 90.toRadians, endAngle: 270.toRadians, clockwise: false)
        path.addLine(to: .init(x: 0, y: cornerRadius))
        
        path.addArc(withCenter: .init(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: 180.toRadians, endAngle: 270.toRadians, clockwise: true)
        path.move(to: .init(x: cornerRadius, y: 0))
        path.close()
        
        layer.path = path.cgPath
        self.contentView.layer.mask = layer
        self.applyBorder(withPath: path.cgPath, andBounds: contentBounds)
    }
    
    private func applyBorder(withPath path: CGPath, andBounds bounds: CGRect) {
        let borderName = "Border"
        self.contentView.layer.sublayers?.filter({ $0.name == borderName }).forEach({ $0.removeFromSuperlayer() })
        let borderLayer = CAShapeLayer()
        borderLayer.path = path
        borderLayer.lineWidth = 2
        borderLayer.strokeColor = UIColor.black.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = bounds
        self.contentView.layer.addSublayer(borderLayer)
    }
    
}

extension CustomView {
    
    func createTopView() -> TopView {
        let view = TopView.loadFromNib()
        view.backgroundColor = self.stackSubviewsBackgroundColor
        return view
    }
    
    func createMidView() -> MidView {
        let view = MidView.loadFromNib()
        view.backgroundColor = self.stackSubviewsBackgroundColor
        return view
    }
    
    func createButtonView() -> ButtonView {
        let view = ButtonView.loadFromNib()
        view.backgroundColor = self.stackSubviewsBackgroundColor
        return view
    }
}
