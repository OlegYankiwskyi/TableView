//
//  MiltiSetModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class MultiSetModel {
    private var data: Array<CellEntity> = []

    func add(value: Int) -> (value: String, index: Int, isReplace: Bool) {
        for index in 0..<data.count {
            if data.indices.contains(index) {
                var element = data[index]
                
                if element.value == value {
                    element.extraValue = String((Int(element.extraValue) ?? 0)+1)
                    element.descriptionValue = "value"
                    element.descriptionExtraValue = "repetitions"
                    
                    data[index] = element
                    return (value: element.toString(), index: index, isReplace: true)
                }
            }
        }
        let index = data.count
        let element = CellEntity(value: value)
        data.insert(element, at: index)
        return (value: element.toString(), index: index, isReplace: false)
    }
    
    func delete(value: Int) -> (value: String, index: Int, isReplace: Bool)? {
        
        for index in 0..<data.count {
            if data.indices.contains(index) {
                let element = data[index]

                if element.value == value {
                    if element.extraValue == "0" || element.extraValue == "" {
                        data.remove(at: index)
                        return (value: "", index: index, isReplace: false)
                    } else {
                        var newElement = element
                        newElement.extraValue = String((Int(element.extraValue) ?? 0)-1)
                        if newElement.extraValue == "0" {
                            newElement.descriptionValue = ""
                        }
                        
                        data[index] = newElement
                        return (value: newElement.toString(), index: index, isReplace: true)
                    }
                }
            }
        }
        return nil
    }
}
