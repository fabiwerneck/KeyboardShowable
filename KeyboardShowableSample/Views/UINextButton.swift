//
//  UINextButton.swift
//  KeyboardShowableSample
//
//  Created by Fabiola Werneck on 22/12/16.
//  Copyright © 2016 Fabiola Werneck. All rights reserved.
//

import UIKit

protocol UINextButtonDelegate: class {
    func next()
}

class UINextButton: UIButton {
    
    var delegate: UINextButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        self.addTarget(self, action: #selector(getter: next), for: .touchUpInside)
    }
    
    func next() {
        delegate?.next()
    }
}
