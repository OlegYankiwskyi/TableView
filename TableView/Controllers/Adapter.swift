//
//  Adapter.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation
import UIKit

class Adapter: AdapterProtocol {
    func place(manager: ControlManagerProtocol, view: UIStackView) {
        var array: [TypeItem] = []
        array = manager.createMenu()
        
        for item in array {
            
            switch item {
            case .button(let title,let action):
                view.addArrangedSubview(ActionButton(title: title, action: action))
            case .textField(let title, let action):
                let textField = TextField(title: title, action: action)
                view.addArrangedSubview(textField)
            }
        }
    }
}
