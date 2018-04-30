//
//  ControlManagerProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol ControlManagerProtocol {
    weak var delegeteFakeData: FakeDataProtocol? { get set }
    var menuItems: [TypeItem] { get }
}
