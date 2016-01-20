//
//  DrawController.swift
//  Draw
//
//  Created by Julian Grosshauser on 18/01/16.
//  Copyright © 2016 Julian Grosshauser. All rights reserved.
//

import UIKit

class DrawController: UIViewController {

    //MARK: Properties

    private var previousTouchLocation: CGPoint?

    //MARK: UIViewController

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        previousTouchLocation = touches.first?.locationInView(view)
    }
}
