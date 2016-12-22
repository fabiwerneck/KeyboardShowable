//
//  UIColorExtension.swift
//  KeyboardShowableSample
//
//  Created by Fabiola Werneck on 22/12/16.
//  Copyright © 2016 Fabiola Werneck. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
}
