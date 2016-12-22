//
//  ViewController.swift
//  KeyboardShowableSample
//
//  Created by Fabiola Werneck on 22/12/16.
//  Copyright © 2016 Fabiola Werneck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINextButtonDelegate, KeyboardShowable {

    @IBOutlet weak var nextButtonBottomConstraint: NSLayoutConstraint!
    
    typealias ConstraintsForKeyboard = (constraint:NSLayoutConstraint, customOldValue:CGFloat?, customNewValue:CGFloat?)
    var layoutConstraintsForKeyboard:[ConstraintsForKeyboard]? = [ConstraintsForKeyboard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConstraintsForKeyboard?.append((nextButtonBottomConstraint, nil, nil))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardNotifications()
    }

    func next() {
        print(#function)
    }
}

