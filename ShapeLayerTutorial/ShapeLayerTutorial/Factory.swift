//
//  Factory.swift
//  ShapeLayerTutorial
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit


class ShapeFactory {
    
    public enum Types {
        case circle
        case square
    }
    
    class func getView(with type: Types) -> UIView {
        switch type {
        case .circle:
            return CircleView2()
        case .square:
            return SquareView2()
        }
    }
}


class SquareView2: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSquare()
    }
    
    func addSquare() {
        
    }
    
}


class CircleView2: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addCircle()
    }
    
    func addCircle() {
        
    }
    
}
