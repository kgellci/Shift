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
            if maskToImage {
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

// Label

open class ShiftMaskableLabel: ShiftView {
    public let textLabel = UILabel()
    public var maskToText = false {
        didSet {
            if maskToText {
                self.mask = self.textLabel
            } else {
                self.mask = nil
            }
        }
    }
    
    open override var intrinsicContentSize: CGSize {
        return textLabel.intrinsicContentSize
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    private func setupLabel() {
        addSubview(textLabel)
        textLabel.shifFillParent()
    }
    
    public func setText(_ text: String) {
        textLabel.text = text
        textLabel.sizeToFit()
        invalidateIntrinsicContentSize()
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

// ImageView

open class ShiftImageView: UIImageView, Shiftable {
    public var shiftLayer = ShiftLayer()
    public var maskToImage = false {
        didSet {
            maskLayer?.removeFromSuperlayer()
            if maskToImage {
                let mask = CALayer()
                mask.contents = image?.cgImage
                mask.frame = bounds
                layer.mask = mask
                layer.masksToBounds = true
            }
        }
    }
    
    private var maskLayer: CALayer?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupShift()
    }
    
    public override init(image: UIImage?) {
        super.init(image: image)
        setupShift()
    }
    
    public override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setupShift()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShift()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        shiftLayer.frame = bounds
        maskLayer?.frame = bounds
    }
}

extension UIView {
    func shifFillParent() {
        guard let bounds = superview?.bounds else { return }
        self.frame = bounds
        shiftPinToSuperview(.bottom)
        shiftPinToSuperview(.top)
        shiftPinToSuperview(.left)
        shiftPinToSuperview(.right)
    }
    
    func shiftPinToSuperview(_ attribute: NSLayoutAttribute) {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: self.superview, attribute: attribute, multiplier: 1.0, constant: 0)
        self.superview?.addConstraint(constraint)
    }
}

