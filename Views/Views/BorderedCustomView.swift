//
//  BorderedCustomView.swift
//  Views
//
//  Created by Guti on 1/31/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedCustomView: UIView {
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
