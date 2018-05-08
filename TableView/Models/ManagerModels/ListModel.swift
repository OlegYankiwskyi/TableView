//
//  ListModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ListModel {
    private var data: Array<CellEntity> = []

    func add(index: Int) -> (value: String, index: Int)? {
        if index >= 0 && index <= data.count {
            let newElement = CellEntity(value: data.count)
            data.insert(newElement, at: index)
            return (value: newElement.stringValue, index: index)
        }
        return nil
    }
    
    func delete(index: Int) -> Bool {
        if index >= 0 && index < data.count {
            data.remove(at: index)
            return true
        }
        return false
    }
    
    func isEmpty(index: Int) -> Int? {
        if data.indices.contains(index) {
            return index
        }
        return nil
    }
}
