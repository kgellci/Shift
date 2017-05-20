//
//  ShiftUI.swift
//  Pods
//
//  Created by Kris Gellci on 5/19/17.
//
//

import UIKit

// View

open class ShiftView: UIView, Shiftable {
    public var shiftLayer = ShiftLayer()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupShift()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShift()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shiftLayer.frame = bounds
    }
}

// Button

open class ShiftButton: UIButton, Shiftable {
    public var shiftLayer = ShiftLayer()
    public var maskToText = false {
        didSet {
            if maskToText {
                self.maskToImage = false
                self.mask = self.titleLabel
            } else {
                self.mask = nil
            }
        }
    }
    public var maskToImage = false {
        didSet {
            if maskToText {
                self.maskToText = false
                self.mask = self.imageView
            } else {
                self.mask = nil
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupShift()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShift()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shiftLayer.frame = bounds
    }
}

// Label

open class ShiftLabel: UILabel, Shiftable {
    public var shiftLayer = ShiftLayer()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupShift()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShift()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shiftLayer.frame = bounds
    }
}

// TextField

open class ShiftTextfield: UITextField, Shiftable {
    public var shiftLayer = ShiftLayer()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupShift()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShift()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shiftLayer.frame = bounds
    }
}

// TextView

open class ShiftTextView: UITextView, Shiftable {
    public var shiftLayer = ShiftLayer()
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupShift()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShift()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shiftLayer.frame = bounds
    }
}

