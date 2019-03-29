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
    
    func setColors(_ colors: [UIColor]) {
        guard colors.count > 0 else { return }
        shiftLayer.populateWithColors(colors)
    }
    
    func start(shiftPoint: ShiftPoint) {
        shiftLayer.startPoint = shiftPoint.point
    }
    
    func end(shiftPoint: ShiftPoint) {
        shiftLayer.endPoint = shiftPoint.point
    }
    
    func start(customPoint: CGPoint) {
        shiftLayer.startPoint = customPoint
    }
    
    func end(customPoint: CGPoint) {
        shiftLayer.endPoint = customPoint
    }
    
    func animationDuration(_ duration: TimeInterval) {
        shiftLayer.animationDuration = duration
    }
    
    func startTimedAnimation() {
        shiftLayer.startTimedAnimation()
    }
    
    func startMotionAnimation() {
        shiftLayer.startAnimationUsingMotion()
    }
    
    func stopAnimation() {
        shiftLayer.stopAnimation()
    }
}

