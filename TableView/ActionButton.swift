//
//  ActionButton.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    var action: ( ()->() )?
    
    init(title: String, action: ( ()->() )? = nil) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.action = action
        self.setupTarget()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func callToAction() {
        action?()
    }
    func setupTarget() {
        self.addTarget(self, action: #selector(callToAction), for: .touchUpInside)
    }
}


enum TypeItem {
    case button(title: String, action: ()->() )
    case textField(placeholder: String)
    
    var title: String {
        get {
            switch self {
            case .button(let title, _):
                return title
            case .textField(let placeholder):
                return placeholder
            }
        }
    }
    
    var action: ()->() {
        get {
            switch self {
            case .button(_ ,let action):
                return action
            default:
                return { return }
            }
        }
    }
}
