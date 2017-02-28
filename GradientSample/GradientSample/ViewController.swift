//
//  ViewController.swift
//  GradientSample
//
//  Created by Guti on 2/23/17.
//  Copyright © 2017 PielDeJaguar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    // MARK: - Properties
    
    let colorList = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor, UIColor.magenta.cgColor, UIColor.yellow.cgColor]
    
    var gradientLayer: CAGradientLayer!
    
    // Expects as elements other arrays with CGColor objects
    var colorSets = [[CGColor]]()
    
    // The color set that is currently being applied to the gradient
    var currentColorSet: Int!
    
    
    // MARK: - Helpers
    
    func createColorSets() {
        colorSets.append([UIColor.red.cgColor, UIColor.yellow.cgColor])
        colorSets.append([UIColor.green.cgColor, UIColor.magenta.cgColor])
        colorSets.append([UIColor.blue.cgColor, UIColor.purple.cgColor])
        
        currentColorSet = 0
    }
    
    func createGradientLayer() {
        // initialiaze the gradient layer
        // set the gradient layer frame
        // set the colors for the gradient effect
        // add the gradient layer as a sublayer to the target view's layer
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        //gradientLayer.colors = [ UIColor.cyan.cgColor, UIColor.clear.cgColor, UIColor.yellow.cgColor]
        gradientLayer.colors = colorSets[currentColorSet]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    
    // MARK: - App life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // gradient layer setup
        createGradientLayer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fadeIn()
        animateLayerBackgroundColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createColorSets()

        //gesture recognizer on taps
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture(_:)))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Methods
    
    func fadeIn() {
        // animate opacity
        let opacityCAB = CABasicAnimation(keyPath: "opacity")
        opacityCAB.fromValue = 0
        opacityCAB.toValue = 1
        opacityCAB.duration = 3.0
        
        gradientLayer.add(opacityCAB, forKey: "fadeIn")
    }
    
    func animateLayerBackgroundColor() {
        // animate layer background color shift
        let backgroundCAB = CABasicAnimation(keyPath: "backgroundColor")
        backgroundCAB.fromValue = colorSets[currentColorSet]
        backgroundCAB.toValue = UIColor.purple.cgColor
        
        gradientLayer.add(backgroundCAB, forKey: "colorShift")
    }
    
    func fadeOut() {
        let fadeOutAnimation = CABasicAnimation()
        fadeOutAnimation.keyPath = "opacity"
        fadeOutAnimation.fromValue = 1
        fadeOutAnimation.toValue = 0
        fadeOutAnimation.duration = 2.0
        fadeOutAnimation.autoreverses = true
        
        fadeOutAnimation.delegate = self
        
        gradientLayer.add(fadeOutAnimation,
                          forKey: "fade")
    }
    
    func handleTapGesture(_ recognizer: UITapGestureRecognizer) {
        if currentColorSet == colorSets.count - 1 {
            fadeOut()
        }
        
        if currentColorSet < colorSets.count - 1 {
            currentColorSet! += 1
        } else {
            currentColorSet = 0
        }
        
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.duration = 1.5
        colorChangeAnimation.toValue = colorSets[currentColorSet]
        colorChangeAnimation.fillMode = kCAFillModeForwards
        colorChangeAnimation.isRemovedOnCompletion = false
        
        // make sure to set the delegate of an animation
        colorChangeAnimation.delegate = self
        
        gradientLayer.add(colorChangeAnimation, forKey: "colorChange")
        
    }
    
    // Optional from CAAnimationDelegate
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if let _ = anim as? CABasicAnimation {
            if flag {
                gradientLayer.colors = colorSets[currentColorSet]
            }
        }
        
        
    }
}
