//
//  ViewController.swift
//  Checkers
//
//  Created by Guti on 1/30/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.bounds.width / 3
        
        for i in 0...8 {
            let x = CGFloat(i % 3) * width
            let y = CGFloat(i / 3) * width
            let rect = CGRect(x: x, y: y, width: width, height: width)
            let box = UIView(frame: rect.insetBy(dx: 2, dy: 2))
            view.addSubview(box)
            
            let red = CGFloat(arc4random() % 100) / 100
            let green = CGFloat(arc4random() % 100) / 100
            let blue = CGFloat(arc4random() % 100) / 100
            
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
            
            box.backgroundColor = color
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

