//
//  Model.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class ArrayDataModel: ArrayDataProtocol {

    private let arrayStructData = [DataStructureModel(title: "Stack"), DataStructureModel(title: "Queue"), DataStructureModel(title: "Set"), DataStructureModel(title: "Dequeue"), DataStructureModel(title: "Priority Queue"), DataStructureModel(title: "List"), DataStructureModel(title: "MultiSet"), DataStructureModel(title: "Dictionary")]
    
    var sizeArrayData: Int {
        get {
            return arrayStructData.count
        }
    }

    func getElement(at: Int) -> DataStructureModel {
        return arrayStructData[at]
    }
}
