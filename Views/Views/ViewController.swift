//
//  ViewController.swift
//  Views
//
//  Created by Guti on 1/24/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    
    // MARK: - App lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a view and add as a subview
        let frame1 = CGRect(x: 50, y: 50, width: 50, height: 50)
        let purpleView = UIView(frame: frame1)
        purpleView.backgroundColor = UIColor.purple
        
        view.addSubview(purpleView)
        
        // add a subview to purpleView
        let frame2 = CGRect(x: 10, y: 10, width: 30, height: 30)
        let blackView = UIView(frame: frame2)
        blackView.backgroundColor = .black
        
        purpleView.addSubview(blackView)
        
        redView.backgroundColor = .orange
        
        redView.alpha = 0.5
        blackView.alpha = 0.8
        
        /*
         The most direct way to manipulate your drawing—whether by movement,
         scaling, or rotation—is to call the functions translateBy(x:y:),
         scaleBy(x:y:), or rotate(by:), respectively. 
         You should generally only create an affine transform if you want to
         reuse it later.
        */
        
        let scaling = CGAffineTransform(scaleX: 3, y: 3)
        let rotation = CGAffineTransform(rotationAngle: CGFloat(M_PI_2 / 2))
        let translation = CGAffineTransform(translationX: 30, y: -90)
        
        // use member methods to affine to do more than one transformation
        //purpleView.transform = rotation
        purpleView.transform = scaling.rotated(by: CGFloat(M_PI_2 / 2))
        greenView.transform = translation
        
        redView.layer
        
        // bounds example:
        /**
         * let backgrounImage = CGRect(x: 0, y: 0, width: view.frame.size.width,
         *                             height: view.frame.size.height)
         * let backgroundImage = BackgroundImage(frame: backgroundFrame)
         *******
         * let backgroundImage = BackgroundImage(frame: view.bounds)
        **/

        //print(purpleView.frame)
        //print(view.superview)
        //print(purpleView.superview as Any)
        //print(view.subviews)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

