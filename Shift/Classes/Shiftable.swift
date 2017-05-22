//
//  Shiftable.swift
//  Pods
//
//  Created by Kris Gellci on 5/19/17.
//
//

import UIKit

public protocol Shiftable {
    var shiftLayer: ShiftLayer { get }
    var layer: CALayer { get }
    var frame: CGRect { get }
    
    func setColors(_ colors: [UIColor])
    
    func start(shiftPoint: ShiftPoint)
    func end(shiftPoint: ShiftPoint)
    func start(customPoint: CGPoint)
    func end(customPoint: CGPoint)
    
    func animationDuration(_ duration: TimeInterval)
    func startTimedAnimation()
    func startMotionAnimation()
    func stopAnimation()
}

public extension Shiftable {
    func setupShift() {
        shiftLayer.frame = frame
        layer.insertSublayer(shiftLayer, at: 0)
    }
    
    public func setColors(_ colors: [UIColor]) {
        guard colors.count > 0 else { return }
        shiftLayer.populateWithColors(colors)
    }
    
    public func start(shiftPoint: ShiftPoint) {
        shiftLayer.startPoint = shiftPoint.point
    }
    
    public func end(shiftPoint: ShiftPoint) {
        shiftLayer.endPoint = shiftPoint.point
    }
    
    public func start(customPoint: CGPoint) {
        shiftLayer.startPoint = customPoint
    }
    
    public func end(customPoint: CGPoint) {
        shiftLayer.endPoint = customPoint
    }
    
    public func animationDuration(_ duration: TimeInterval) {
        shiftLayer.animationDuration = duration
    }
    
    public func startTimedAnimation() {
        shiftLayer.startTimedAnimation()
    }
    
    public func startMotionAnimation() {
        shiftLayer.startAnimationUsingMotion()
    }
    
    public func stopAnimation() {
        shiftLayer.stopAnimation()
    }
}

