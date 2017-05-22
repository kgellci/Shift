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

        imageView.start(shiftPoint: .left)
        imageView.end(shiftPoint: .right)
        imageView.setColors([UIColor.red, UIColor.purple, UIColor.purple, UIColor.yellow])
        imageView.maskToImage = true
        imageView.startTimedAnimation()
        
        button.start(shiftPoint: .left)
        button.end(shiftPoint: .right)
        button.animationDuration(3.0)
        button.maskToText = true
        button.startTimedAnimation()
        
        maskableLabel.setText("HELLO WORLD!")
        maskableLabel.start(shiftPoint: .left)
        maskableLabel.end(shiftPoint: .right)
        maskableLabel.animationDuration(3.0)
        maskableLabel.maskToText = true
        maskableLabel.startTimedAnimation()
    }
}

