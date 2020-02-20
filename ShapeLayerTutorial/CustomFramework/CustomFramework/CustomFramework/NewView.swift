//
//  NewView.swift
//  CustomFramework
//
//  Created by Usemobile on 13/02/20.
//  Copyright © 2020 Tulio Parreiras. All rights reserved.
//

import UIKit

public protocol ViewBuilderFactory {
    func getContentView() -> UIView
}

public class NewView: UIView {

    public static var factory: ViewBuilderFactory?
    
    public static func configureFactory(_ factory: ViewBuilderFactory) {
        NewView.factory = factory
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        guard let contentView = NewView.factory?.getContentView() else { return }
        self.addSubview(contentView)
    }

}



class Animal {
    
}

class Bipede {
    
}


