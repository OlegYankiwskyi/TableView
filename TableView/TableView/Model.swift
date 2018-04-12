//
//  Model.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class Model {
    private let namesStructData = ["Stack", "Queue", "Set", "Dequeue", "Priority Queue", "List", "MultiSet", "Dictionary"]
    
    var sizeArrayData: Int {
        get {
            return namesStructData.count
        }
    }
    
    func getData() -> [String] {
        return namesStructData
    }
    
    func getElement(at: Int) -> String {
        return namesStructData[at]
    }
}
