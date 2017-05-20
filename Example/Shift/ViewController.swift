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

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.start(shiftPoint: .left)
        imageView.end(shiftPoint: .right)
        imageView.setColors([UIColor.red, UIColor.purple, UIColor.purple, UIColor.yellow])
        imageView.maskToImage = true
        imageView.startTimedAnimation()
        
        button.start(shiftPoint: .left)
        button.end(shiftPoint: .right)
        button.maskToText = true
        button.startTimedAnimation()
    }
}

