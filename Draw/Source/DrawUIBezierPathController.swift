//
//  DrawUIBezierPathController.swift
//  Draw
//
//  Created by Julian Grosshauser on 22/01/16.
//  Copyright © 2016 Julian Grosshauser. All rights reserved.
//

import UIKit

final class DrawUIBezierPathController: UIViewController {

    //MARK: Properties

    private var previousTouchLocation: CGPoint?

    override var description: String {
        return "UIBezierPath"
    }

    //MARK: Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
        title = String(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        previousTouchLocation = touches.first?.locationInView(view)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let previousTouchLocation = previousTouchLocation, touchLocation = touches.first?.locationInView(view) else {
            return
        }

        let path = UIBezierPath()
        path.moveToPoint(previousTouchLocation)
        path.addLineToPoint(touchLocation)
        self.previousTouchLocation = touchLocation

        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.lineWidth = 3
        view.layer.addSublayer(layer)
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        previousTouchLocation = nil
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        previousTouchLocation = nil
    }
}

