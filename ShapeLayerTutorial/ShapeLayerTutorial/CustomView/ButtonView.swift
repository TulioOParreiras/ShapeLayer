//
//  ButtonView.swift
//  ShapeLayerTutorial
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

import Reusable

class ButtonView: UIView, NibLoadable {

    @IBOutlet weak var btn: UIButton!
    @IBAction func btnAction(_ sender: Any) {
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.btn.layer.cornerRadius = 6
        self.btn.layer.borderWidth = 1
        self.btn.layer.borderColor = self.btn.tintColor?.cgColor
    }
}
