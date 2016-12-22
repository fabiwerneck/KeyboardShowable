//
//  KeyboardShowable.swift
//  KeyboardShowableSample
//
//  Created by Fabiola Werneck on 22/12/16.
//  Copyright © 2016 Fabiola Werneck. All rights reserved.
//

import UIKit

protocol KeyboardShowable: class {
    
    var layoutConstraintsForKeyboard:[(constraint:NSLayoutConstraint, customOldValue:CGFloat?, customNewValue:CGFloat?)]? { get set }
    
    func addKeyboardNotifications()
    func removeKeyboardNotifications()
    func keyboardWillShowNotification(notification: NSNotification)
    func keyboardWillHideNotification(notification: NSNotification)
}

extension KeyboardShowable where Self: UINextButtonDelegate, Self: UIViewController {
    
    func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { notification in
            self.keyboardWillShowNotification(notification: notification as NSNotification)
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { notification in
            self.keyboardWillHideNotification(notification: notification as NSNotification)
        }
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShowNotification(notification: NSNotification) {
        updateLayoutConstraintsWithNotification(notification: notification, willHide: false)
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        updateLayoutConstraintsWithNotification(notification: notification, willHide: true)
    }
    
    func updateLayoutConstraintsWithNotification(notification: NSNotification, willHide:Bool) {
        
        let userInfo = notification.userInfo!
        
        let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let keyboardEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let convertedKeyboardEndFrame = self.view.convert(keyboardEndFrame, from: view.window)
        let keyboardHeight = self.view.bounds.maxY - convertedKeyboardEndFrame.minY
        
        layoutConstraintsForKeyboard?.forEach { c in
            
            c.constraint.constant = keyboardHeight
            
            if willHide {
                if let customOldValue = c.customOldValue {
                    c.constraint.constant = customOldValue
                }
            } else {
                if let customNewValue = c.customNewValue {
                    c.constraint.constant = customNewValue
                }
            }
        }
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
