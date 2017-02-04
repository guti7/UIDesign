//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// variables
let circleCount = 5


// base view
let canvasFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = UIColor.white

// show on live view
PlaygroundPage.current.liveView = canvas



// Set up base layer
canvas.layer.cornerRadius = canvas.bounds.width / 2
canvas.layer.backgroundColor = UIColor.black.cgColor
canvas.layer.borderWidth = 4
//canvas.layer.borderColor = UIColor.black.cgColor

var baseLayer = canvas.layer
var baseWidth = canvas.bounds.width / CGFloat(circleCount)
var inset = CGFloat(30)


for i in (1...circleCount) {
    var circleLayer = CALayer()
    inset = inset * CGFloat(i)
    print("value inset: \(inset)")
    circleLayer.frame = baseLayer.bounds.insetBy(dx: inset, dy: inset)
    circleLayer.borderWidth = 20
    circleLayer.cornerRadius = circleLayer.bounds.width / 2
    
    circleLayer.backgroundColor = UIColor.clear.cgColor
    circleLayer.borderColor = UIColor.white.cgColor
    
    baseLayer.addSublayer(circleLayer)
    
    baseLayer = circleLayer
}

