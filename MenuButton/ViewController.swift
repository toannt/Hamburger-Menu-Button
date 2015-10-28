//
//  ViewController.swift
//  MenuButton
//
//  Created by Toan Nguyen on 10/28/15.
//  Copyright © 2015 Toan Nguyen. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstButton = MenuButton(frame: CGRectMake(0, 0, 60, 60))
        firstButton.center = CGPoint(x: self.view.bounds.width/2, y: 350)
        firstButton.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        firstButton.lineWidth = 30
        firstButton.lineMargin = 12
        firstButton.lineCapRound = true
        firstButton.thickness = 6
        firstButton.slideLeftToRight = false
        firstButton.backgroundColor = UIColor.purpleColor()
        firstButton.cornerRadius = 10
        self.view.addSubview(firstButton)
        
        let secondButton = MenuButton(frame: CGRectMake(0, 0, 60, 60))
        secondButton.center = CGPoint(x: self.view.bounds.width/2, y: 420)
        secondButton.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        secondButton.lineWidth = 30
        secondButton.lineMargin = 12
        secondButton.lineCapRound = true
        secondButton.thickness = 6
        secondButton.slideLeftToRight = false
        secondButton.backgroundColor = UIColor.clearColor()
        secondButton.layer.borderWidth = 2.0
        secondButton.layer.borderColor = UIColor.orangeColor().CGColor
        secondButton.cornerRadius = secondButton.bounds.width/2
        secondButton.strokeColor = UIColor.blueColor()
        self.view.addSubview(secondButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonClick(sender: UIButton) {
        sender.selected = !sender.selected
    }

}

