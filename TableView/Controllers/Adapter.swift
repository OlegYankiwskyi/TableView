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
        var array: [TypeButton] = []
        array = manager.createMenu()
        for button in array {
            view.addArrangedSubview(ActionButton(title: button.title, action: button.action))
        }
    }
}

