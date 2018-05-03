//
//  DictionaryModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class DictionaryModel {
    private var data: Array<CellEntity> = []

    func add(value: Int,key: String) -> (value: String, index: Int)? {
        let newElement = CellEntity(value: value,description: "value", extraValue: key, descriptionExtraValue: "key")
        
        if data.count == 0 {
            data.insert(newElement, at: 0)
            return (value: newElement.toString(), index: 0)
        }
        
        
        if data.indices.contains(data.count-1) {
            let elementLast = data[data.count-1]
            if elementLast.extraValue <= key {
                let index = data.count
                data.insert(newElement, at: index)
                return (value: newElement.toString(), index: index)
            }
        }
        
        if data.indices.contains(0) {
            let elementFirst = data[0]
            if elementFirst.extraValue > key {
                let index = 0
                data.insert(newElement, at: index)
                return (value: newElement.toString(), index: index)
            }
        }
        
        for i in 1..<data.count {
            if !data.indices.contains(i-1) || !data.indices.contains(i) { break }

            if data[i-1].extraValue <= key && data[i].extraValue >= key {
                data.insert(newElement, at: i)
                return (value: newElement.toString(), index: i)
            }
        }
        return nil
    }
    
    func delete(key: String) -> Int? {
        for i in 0..<data.count {
            
            if data.indices.contains(i) {
                let element = data[i]
                if element.extraValue == key {
                    data.remove(at: i)
                    return i
                }
            }
        }
        return nil
    }
}
