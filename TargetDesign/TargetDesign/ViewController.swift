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
    let circleCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //baseView.layer.borderWidth = 2
        baseView.layer.cornerRadius = baseView.bounds.width / 2
        
        // current values for baseView
        print ("baseView:\n bounds: \(baseView.bounds)\n layer: \(baseView.layer)")
        
        let centerLayer = CALayer()
        centerLayer.frame = baseView.bounds //baseView.bounds.insetBy(dx: 90, dy: 90)
        
        centerLayer.backgroundColor = UIColor.black.cgColor
        centerLayer.cornerRadius = centerLayer.bounds.width / 2
        
        baseView.layer.addSublayer(centerLayer)
        
        // TODO:  add multiple circles to complete target, Use for loop
        
        for i in (1..<2).reversed() { // draw one
            
            let layer = CALayer()
            let layerInset = CGFloat(100) //baseView.bounds.width - CGFloat(i * 30)
            let layerFrame = centerLayer.bounds.insetBy(dx: layerInset, dy: layerInset)
            layer.frame = layerFrame
            
            layer.borderWidth = 10 // relate to baseView.bounds width
            layer.cornerRadius = layer.bounds.width / 2
            layer.backgroundColor = UIColor.clear.cgColor
            layer.borderColor = UIColor.red.cgColor
            
            baseView.layer.addSublayer(layer)
        }
//
    }

}

