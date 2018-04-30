//
//  ControlManagerFactroryProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol ControlManagerFactoryProtocol {
    static func getControlManager(title: ATDType) -> ControlManagerProtocol
}
