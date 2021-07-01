//
//  PassThroughView.swift
//  MapBasedContainerApp
//
//  Created by JB on 2021/05/13.
//

import UIKit

class PassThroughView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)

        // return nil
        if hitView == self {
            return nil
        } else {
            return hitView
        }
    }
}
