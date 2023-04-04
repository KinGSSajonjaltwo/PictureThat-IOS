//
//  UINavigationController+.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/03.
//
import SwiftUI

//backgesture enable even navigationbar is hidden
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
