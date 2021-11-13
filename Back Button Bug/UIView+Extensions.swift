//
//  UIView+Extensions.swift
//  Back Button Bug
//
//  Created by bunnyhero on 2021-11-12.
//

import UIKit

extension UIView {
    func recursiveGestureRecognizerCount() -> Int {
        let myCount = gestureRecognizers?.count ?? 0
        return subviews.reduce(myCount, { $0 + $1.recursiveGestureRecognizerCount() })
    }
}
