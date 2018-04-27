//
//  FakeDataProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol FakeDataProtocol: class {
    var arrayData: Array<CellStatus> { get }
    func add(index: Int, value: String)
    func delete(index: Int)
}
