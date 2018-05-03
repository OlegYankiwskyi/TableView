//
//  CellEntity.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

struct CellEntity: CellEntityProtocol {
    var value: Int
    var descriptionValue: String
    var extraValue: String
    var descriptionExtraValue: String
    
    init(value: Int = 0, descr: String = "value") {
        self.value = value
        self.descriptionValue = ""
        self.extraValue = ""
        self.descriptionExtraValue = ""
    }
    
    init(value: Int = 0, description: String = "", extraValue: String = "", descriptionExtraValue: String) {
        self.value = value
        self.descriptionValue = description
        self.extraValue = extraValue
        self.descriptionExtraValue = descriptionExtraValue
    }
    
    func toString() -> String {
        var result = String()
        if self.descriptionValue == "" {
            result += String(self.value)
        }
        else {
            result += self.descriptionValue + ": " + String(self.value)
        }
        if self.extraValue != "" {
            result += ", " + self.descriptionExtraValue + ": " + String(self.extraValue)
        }
        return result
    }
}

