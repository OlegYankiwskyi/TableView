//
//  StructDataModelProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/13/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol ArrayDataProtocol {
    func getElement(at: Int) -> DataStructureModel
    var sizeArrayData: Int { get }
}
