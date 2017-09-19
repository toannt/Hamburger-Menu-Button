//
//  ViewController.swift
//  MenuButton
//
//  Created by Toan Nguyen on 10/28/15.
//  Converted to Swift 3 by Nikolay Khramchenko 9/19/2017
//  Copyright © 2015 Toan Nguyen. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstButton = MenuButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        firstButton.center = CGPoint(x: self.view.bounds.width/2, y: 350)
        firstButton.addTarget(self, action: #selector(ViewController.buttonClick(_:)), for: UIControlEvents.touchUpInside)
        firstButton.lineWidth = 30
        firstButton.lineMargin = 12
        firstButton.lineCapRound = true
        firstButton.thickness = 6
        firstButton.slideLeftToRight = false
        firstButton.backgroundColor = UIColor.purple
        firstButton.cornerRadius = 10
        self.view.addSubview(firstButton)
        
        let secondButton = MenuButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        secondButton.center = CGPoint(x: self.view.bounds.width/2, y: 420)
        secondButton.addTarget(self, action: #selector(ViewController.buttonClick(_:)), for: UIControlEvents.touchUpInside)
        secondButton.lineWidth = 30
        secondButton.lineMargin = 12
        secondButton.lineCapRound = true
        secondButton.thickness = 6
        secondButton.slideLeftToRight = false
        secondButton.backgroundColor = UIColor.clear
        secondButton.layer.borderWidth = 2.0
        secondButton.layer.borderColor = UIColor.orange.cgColor
        secondButton.cornerRadius = secondButton.bounds.width/2
        secondButton.strokeColor = UIColor.blue
        self.view.addSubview(secondButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        print("pressed")
    }

}

