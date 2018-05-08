//
//  FakeDataProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol FakeDataProtocol: class {
    func addValue(_ value: String, atIndex index: Int)
    func delete(atIndex: Int)
    func highlight(atIndex: Int?) 
}
