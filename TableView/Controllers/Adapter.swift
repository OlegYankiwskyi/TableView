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
    func createMenu(manager: ControlManagerProtocol, view: UIStackView) {
        let array: [TypeItem] = manager.menuItems
        
        array.forEach { item in
            switch item {
            case .button(let title,let action):
                view.addArrangedSubview(ActionButton(title: title, action: action))
            case .textField(let placeholder,let keyboardType, let action):
                let textField = TextField(placeholder: placeholder, keyboardType: keyboardType, action: action)
                view.addArrangedSubview(textField)
            }
        }
    }
}
