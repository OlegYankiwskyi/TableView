//
//  FakeDataProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol FakeDataProtocol: class {
//    func getElement(atIndex: Int) -> CellEntity?
//    func count() -> Int
    func add(atIndex: Int, value: String)
    func delete(atIndex: Int)
}
