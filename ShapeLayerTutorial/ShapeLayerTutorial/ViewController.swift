//
//  ViewController.swift
//  ShapeLayerTutorial
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var customView = CustomView.loadFromNib()
    lazy var squareView = SquareView.loadFromNib()
    
    override func loadView() {
        self.view = self.customView
    }
    
}

