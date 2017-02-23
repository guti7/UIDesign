
import UIKit
import PlaygroundSupport

// base view
let canvasFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = UIColor.black

// show on live view
PlaygroundPage.current.liveView = canvas
