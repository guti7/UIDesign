//
//  LaunchScreen.swift
//  GradientSample
//
//  Created by Guti on 2/23/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import Foundation
import UIKit

class LaunchScreen: UIView {
    
    var gradientLayer = CAGradientLayer()
    
    func createGradientLayer(container: UIView, bounds: CGRect) {
//        self.gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [ UIColor.cyan.cgColor, UIColor.clear.cgColor, UIColor.yellow.cgColor]
        
        container.layer.addSublayer(gradientLayer)
    }
    
}
