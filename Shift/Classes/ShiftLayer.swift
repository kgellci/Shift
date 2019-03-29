//
//  ShiftLayer.swift
//  Pods
//
//  Created by Kris Gellci on 5/19/17.
//
//

import UIKit
import CoreMotion

fileprivate struct Animation {
    static let keyPath = "colors"
    static let key = "GradientShift"
}

fileprivate extension CABasicAnimation {
    class func addAnimationTo(_ layer: ShiftLayer, duration: TimeInterval, colors: [CGColor]) {
        let animation = shiftAnimationWithColors(colors)
        animation.duration = duration
        animation.delegate = layer
        layer.speed = 1.0
        layer.add(animation, forKey: Animation.key)
    }
    
    class func addMotionAnimationTo(_ layer: ShiftLayer, colors: [CGColor]) {
        let animation = shiftAnimationWithColors(colors)
        animation.duration = 1.0
        layer.speed = 0
        layer.add(animation, forKey: Animation.key)
    }
    
    class func shiftAnimationWithColors(_ colors: [CGColor]) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: Animation.keyPath)
        animation.toValue = colors
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

public class ShiftLayer: CAGradientLayer {
    open var animationDuration: TimeInterval = 5.0
    var gradientColors = [UIColor.white.cgColor,
                          UIColor.black.cgColor]

    private var motion: CMMotionManager?
    private var gradientInterval = 0
    
    public override init() {
        super.init()
        initialSetup()
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
        initialSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    private func initialSetup() {
        startPoint = ShiftPoint.topRight.point
        endPoint = ShiftPoint.bottomLeft.point
        drawsAsynchronously = true
    }
    
    public func populateWithColors(_ colors: [UIColor]) {
        gradientColors = colors.map({ $0.cgColor })
    }
    
    private func removeAnimations() {
        self.motion?.stopAccelerometerUpdates()
        self.motion = nil
        removeAllAnimations()
    }
    
    public func startAnimationUsingMotion() {
        removeAnimations()
        let (startColors, endColors) = colorsForMotionAnimation()
        colors = startColors
        drawsAsynchronously = true
        CABasicAnimation.addMotionAnimationTo(self, colors: endColors)
        
        
        let motion = CMMotionManager()
        if motion.isAccelerometerAvailable {
            motion.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { [weak self] (data, error) in
                guard let data = data else { return }
                var x = data.acceleration.x + 0.5
                x = max(min(x, 1), 0)
                self?.timeOffset = x
            })
        }
        self.motion = motion
    }
    
    public func startTimedAnimation() {
        removeAnimations()
        animateGradient()
    }
    
    public func stopAnimation() {
        removeAnimations()
    }
    
    
    fileprivate func colorsForTimedAnimation() -> ([CGColor], [CGColor]) {
        guard checkGradientColorsValid() else {
            return ([], [])
        }
        let startColors = [gradientColors[gradientInterval % gradientColors.count],
                           gradientColors[(gradientInterval + 1) % gradientColors.count]]
        
        let endColors = [gradientColors[(gradientInterval + 1) % gradientColors.count],
                         gradientColors[(gradientInterval + 2) % gradientColors.count]]
        
        return (startColors, endColors)
    }
    
    private func colorsForMotionAnimation() -> ([CGColor], [CGColor]) {
        guard checkGradientColorsValid() else {
            return ([], [])
        }
        
        let isOddCount = gradientColors.count % 2 == 1
        let endSplitIndex = (gradientColors.count / 2)
        let startSplitIndex = isOddCount ? endSplitIndex + 1 : endSplitIndex
        return (Array(gradientColors[0..<startSplitIndex]), Array(gradientColors[endSplitIndex..<gradientColors.count]))
    }
    
    private func checkGradientColorsValid() -> Bool {
        guard gradientColors.count > 1 else {
            print("SHIFT ERROR: animation requires two or more colors")
            return false
        }
        if gradientColors.count == 2 {
            gradientColors.append(gradientColors[0])
        }
        return true
    }
    
    func animateGradient() {
        gradientInterval += 1
        let (startColors, endColors) = colorsForTimedAnimation()
        colors = startColors
        CABasicAnimation.addAnimationTo(self, duration: animationDuration, colors: endColors)
    }
    
    override open func removeFromSuperlayer() {
        super.removeFromSuperlayer()
        removeAnimations()
    }
}

extension ShiftLayer: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            animateGradient()
        }
    }
}
