//
//  ViewController.swift
//  TargetDesign
//
//  Created by Guti on 1/31/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseView.layer.borderWidth = 2
        
        baseView.layer.cornerRadius = baseView.bounds.width / 2
        // current values for baseView
        print ("baseView:\n bounds: \(baseView.bounds)\n layer: \(baseView.layer)")
        
        let centerLayer = CALayer()
        centerLayer.frame = baseView.bounds.insetBy(dx: 90, dy: 90) //CGRect(x: baseView.center.x, y: baseView.center.y, width: baseView.bounds.width / 3, height: baseView.bounds.width / 3)
        
        centerLayer.backgroundColor = UIColor.red.cgColor
        centerLayer.cornerRadius = centerLayer.bounds.width / 2
        
        for i in 0...4 {
            
        }
        
        baseView.layer.addSublayer(centerLayer)
        print ("centerLayer:\n contentsRect: \(centerLayer.contentsRect)")
    }

}

