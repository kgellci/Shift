//
//  ViewController.swift
//  Shift
//
//  Created by kgellci on 05/19/2017.
//  Copyright (c) 2017 kgellci. All rights reserved.
//

import UIKit
import Shift

class ViewController: UIViewController {
    @IBOutlet weak var button: ShiftButton!
    @IBOutlet weak var imageView: ShiftImageView!
    @IBOutlet weak var maskableLabel: ShiftMaskableLabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view as! ShiftView
        view.setColors([UIColor.orange, UIColor.red, UIColor.purple, UIColor.purple])
        view.startTimedAnimation()
        
        self.imageView.start(shiftPoint: .left)
        self.imageView.end(shiftPoint: .right)
        self.imageView.setColors([UIColor.red, UIColor.purple, UIColor.purple, UIColor.yellow])
        self.imageView.maskToImage = true
        self.imageView.startTimedAnimation()
        
        self.button.start(shiftPoint: .left)
        self.button.end(shiftPoint: .right)
        self.button.animationDuration(3.0)
        self.button.maskToText = true
        self.button.startTimedAnimation()
        
        self.maskableLabel.textLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.maskableLabel.setText("Shift!")
        self.maskableLabel.start(shiftPoint: .left)
        self.maskableLabel.end(shiftPoint: .right)
        self.maskableLabel.animationDuration(3.0)
        self.maskableLabel.maskToText = true
        self.maskableLabel.startTimedAnimation()
    }
}

