//
//  UIView+Extensions.swift
//  Back Button Bug
//
//  Created by bunnyhero on 2021-11-12.
//

import UIKit

extension UIView {
    /// Counts the total number of gesture recognizers owned by this UIView and all its subviews
    /// - Returns: Total number of gesture recognizers
    func recursiveGestureRecognizerCount() -> Int {
        let myCount = gestureRecognizers?.count ?? 0
        return subviews.reduce(myCount, { $0 + $1.recursiveGestureRecognizerCount() })
    }
}
