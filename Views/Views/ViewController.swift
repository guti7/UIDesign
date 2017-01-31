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
        
        redView.alpha = 1.0
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
        purpleView.transform = scaling.rotated(by: CGFloat(M_PI_2 / 2)).translatedBy(x: 150, y: 70)
        greenView.transform = translation
        
        // CALayers
        redView.layer.borderWidth = 1.0
        greenView.layer.borderWidth = 3.0
        blackView.layer.cornerRadius = 5.0
        blackView.layer.borderWidth = 1.5
        blackView.layer.borderColor = UIColor.white.cgColor
        
        purpleView.layer.cornerRadius = purpleView.bounds.width / 2.0
        purpleView.layer.borderWidth = 2.0

        purpleView.layer.borderColor = UIColor(red: 230.0 / 256, green: 90.0 / 256, blue: 178.0 / 256, alpha: 1.0).cgColor
        
        // shadows
        redView.layer.shadowOpacity = 1.0
        redView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        redView.layer.shadowRadius = 20.0
        redView.layer.shadowColor = UIColor(red: 0.5, green: 0.5, blue: 188.0/255.0, alpha: 1.0).cgColor
        
        
        // Add animations
        
        let colorBlue = UIColor(red: 41.0/255.0, green: 0.5, blue: 185.0/255.0, alpha: 1.0)
        
        let transformSkew = __CGAffineTransformMake(0, 1, 0.5, 0, 1, 0)
        
        let transformed = CGAffineTransform(a: 1, b: 0, c: 0.5, d: 0.5, tx: 10, ty: 30)
        
        // blackView transform animation
        UIView.animate(withDuration: 3, delay: 1, options: [.autoreverse, .repeat], animations: {
            blackView.transform = transformSkew
        }, completion: nil)
        
        // purpleView and redView transform animation
        UIView.animate(withDuration: 3) { 
            //self.view.subviews[2].backgroundColor = colorBlue
            purpleView.backgroundColor = colorBlue
            self.redView.transform = transformed
        }
        
        // greenView transform animation
        UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.greenView.frame = CGRect(x: 100, y: 100, width: 100, height: 50)

        }, completion: nil)
        
        
        // bounds example:
        /**
         * let backgrounImage = CGRect(x: 0, y: 0, width: view.frame.size.width,
         *                             height: view.frame.size.height)
         * let backgroundImage = BackgroundImage(frame: backgroundFrame)
         *******
         * let backgroundImage = BackgroundImage(frame: view.bounds)
        **/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

