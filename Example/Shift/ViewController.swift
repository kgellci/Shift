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

    override func viewDidLoad() {
        super.viewDidLoad()
        let shiftView = view as! ShiftView
        shiftView.start(shiftPoint: .left)
        shiftView.end(shiftPoint: .right)
        shiftView.setColors([UIColor.red, UIColor.purple, UIColor.purple, UIColor.yellow])
        shiftView.startMotionAnimation()
        
        button.start(shiftPoint: .left)
        button.end(shiftPoint: .right)
        button.maskToText = true
        button.startMotionAnimation()
    }
}

