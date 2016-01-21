//
//  DrawController.swift
//  Draw
//
//  Created by Julian Grosshauser on 18/01/16.
//  Copyright © 2016 Julian Grosshauser. All rights reserved.
//

import UIKit

final class DrawController: UIViewController {

    //MARK: Properties

    private var previousTouchLocation: CGPoint?
    private let imageView = UIImageView()

    override var description: String {
        return "CGContext"
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

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = view.frame
        view.addSubview(imageView)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        previousTouchLocation = touches.first?.locationInView(view)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let previousTouchLocation = previousTouchLocation, touchLocation = touches.first?.locationInView(view) else {
            return
        }

        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 3)
        CGContextMoveToPoint(context, previousTouchLocation.x, previousTouchLocation.y)
        CGContextAddLineToPoint(context, touchLocation.x, touchLocation.y)
        CGContextStrokePath(context)
        self.previousTouchLocation = touchLocation
        imageView.image?.drawInRect(view.bounds)
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        previousTouchLocation = nil
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        previousTouchLocation = nil
    }
}
