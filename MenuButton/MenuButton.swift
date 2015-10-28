//
//  MenuButton.swift
//  Draw
//
//  Created by Toan Nguyen on 10/28/15.
//  Copyright © 2015 Toan Nguyen. All rights reserved.
//

import UIKit
import QuartzCore

class MenuButton: UIButton {

    var menuPath : CGPath {
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, thickness / 2, thickness / 2)
        CGPathAddLineToPoint(path, nil, lineWidth - thickness / 2, thickness / 2)
        return path
    }
    
    var sidePath: CGPath {
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, self.bounds.height / 2)
        CGPathAddLineToPoint(path, nil, self.bounds.width, self.bounds.height/2)
        return path
    }
    
    let animateDuration : Double = 0.3
    let animateDelay: Double = 0.05
    
    
    @IBInspectable var lineWidth : CGFloat = 28{
        didSet{
            self.updateSubLayers()
        }
    }
    
    @IBInspectable var thickness : CGFloat = 4{
        didSet{
            self.updateSubLayers()
        }
    }
    
    @IBInspectable var lineMargin : CGFloat = 10{
        didSet{
            self.updateSubLayers()
        }
    }
    
    @IBInspectable var lineCapRound : Bool = true{
        didSet{
            self.updateSubLayers()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var strokeColor : UIColor = UIColor.whiteColor(){
        didSet{
            self.updateSubLayers()
        }
    }
    
    @IBInspectable var slideLeftToRight : Bool = true {
        didSet{
            if slideLeftToRight {
                sideLayer.strokeStart = 0.0
                sideLayer.strokeEnd = 0.0
            }else{
                sideLayer.strokeStart = 1.0
                sideLayer.strokeEnd = 1.0
            }
        }
    }
    
    
    override var selected: Bool{
        didSet{
            self.showMenu(self.selected)
        }
    }
    
    
    
    let topLayer = CAShapeLayer()
    let midLayer = CAShapeLayer()
    let bottomLayer = CAShapeLayer()
    let sideLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setups()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setups()
    }
    
    func setups(){
        sideLayer.opacity = 0.2
        sideLayer.strokeColor = UIColor.blackColor().CGColor
        if slideLeftToRight {
            sideLayer.strokeStart = 0.0
            sideLayer.strokeEnd = 0.0
        }else{
            sideLayer.strokeStart = 1.0
            sideLayer.strokeEnd = 1.0
        }
        for layer  in  [sideLayer, topLayer, midLayer, bottomLayer] {
            layer.masksToBounds = true
            layer.actions = [
                "strokeStart": NSNull(),
                "strokeEnd": NSNull(),
            ]
            self.layer.addSublayer(layer)
        }
        self.layer.masksToBounds = true
        self.updateSubLayers()
    }
    
    func showMenu(isShow: Bool){
        if isShow{
            let sideAnim = CABasicAnimation(keyPath: slideLeftToRight ? "strokeEnd" : "strokeStart")
            sideAnim.duration = animateDuration - 0.1
            sideAnim.beginTime = CACurrentMediaTime() + 0.1
            sideAnim.toValue = slideLeftToRight ? 0.6 : 0.4
            sideAnim.fillMode = kCAFillModeBackwards
            sideLayer.applyAnimation(sideAnim)
            
            for (idx, layer) in [topLayer, midLayer, bottomLayer].enumerate(){
                let anim = CABasicAnimation(keyPath: slideLeftToRight ? "strokeEnd" : "strokeStart")
                anim.toValue = slideLeftToRight ? 0.3 : 0.7
                anim.duration = animateDuration
                anim.fillMode = kCAFillModeBackwards
                anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                anim.beginTime = CACurrentMediaTime() + Double(idx) * animateDelay
                layer.applyAnimation(anim)
            }
            
        }else{
            let sideAnim = CABasicAnimation(keyPath: slideLeftToRight ? "strokeEnd" : "strokeStart")
            sideAnim.duration = animateDuration - 0.1
            sideAnim.beginTime = CACurrentMediaTime() + 0.1
            sideAnim.toValue = slideLeftToRight ? 0.0 : 1.0
            sideAnim.fillMode = kCAFillModeBackwards
            sideLayer.applyAnimation(sideAnim)
            
            for (idx, layer) in [topLayer, midLayer, bottomLayer].enumerate(){
                let anim = CABasicAnimation(keyPath: slideLeftToRight ? "strokeEnd" : "strokeStart")
                anim.toValue = slideLeftToRight ? 1.0 : 0.0
                anim.duration = animateDuration
                anim.fillMode = kCAFillModeBackwards
                anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                anim.beginTime = CACurrentMediaTime() + Double(idx) * animateDelay
                layer.applyAnimation(anim)
            }
        }
    }
    
    
    func updateSubLayers(){
        let path = self.menuPath
        let strokingPath = CGPathCreateCopyByStrokingPath(path, nil, thickness, CGLineCap.Round, CGLineJoin.Miter, 10)
        let bounds = CGPathGetPathBoundingBox(strokingPath)
        for layer in [topLayer, midLayer, bottomLayer] {
            layer.path = path
            layer.bounds = bounds
            layer.strokeColor = self.strokeColor.CGColor
            layer.lineWidth = thickness
            layer.lineCap = lineCapRound ? kCALineCapRound : kCALineCapSquare
        }
        self.setNeedsLayout()
    }
    
    
    override func layoutSubviews() {
        let center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        self.midLayer.position = center
        self.topLayer.position = CGPoint(x: center.x, y: center.y - lineMargin)
        self.bottomLayer.position = CGPoint(x: center.x, y: center.y + lineMargin)
        sideLayer.bounds = self.bounds
        sideLayer.path = sidePath
        sideLayer.lineWidth = self.bounds.height
        sideLayer.position = center
    }
}

extension CALayer {
    func applyAnimation(animation: CABasicAnimation) {
        let copy = animation.copy() as! CABasicAnimation
        if copy.fromValue == nil {
            copy.fromValue = self.presentationLayer()!.valueForKeyPath(copy.keyPath!)
        }
        self.addAnimation(copy, forKey: copy.keyPath)
        self.setValue(copy.toValue, forKeyPath:copy.keyPath!)
    }
}

