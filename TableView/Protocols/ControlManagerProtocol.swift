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
    func getItemForMenu() -> [TypeItem]
//    func setDelegate(delegeteFakeData: FakeDataProtocol) 
}
