//
//  AdapterProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation
import UIKit

protocol AdapterProtocol {
    func createMenu(manager: ControlManagerProtocol, view: UIStackView)
}
