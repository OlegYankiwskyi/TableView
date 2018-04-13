//
//  StructDataModelProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/13/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol StructDataModelProtocol {
    func getElement(at: Int) -> String
    func getData() -> [String]
    var sizeArrayData: Int { get }
}
