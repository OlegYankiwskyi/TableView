//
//  SetModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class SetModel {
    private var data: Array<CellEntity> = []
    
    func add(value: Int) -> (value: String, index: Int)? {
        
        for index in 0..<data.count {
            if data.indices.contains(index) && data[index].value == value {
                return nil
            }
        }
        let index = data.count
        let newElement = CellEntity(value: value)
        data.insert(newElement, at: index)
        return (value: newElement.toString(), index: index)
    }
    
    func delete(value: Int) -> Int? {
        for index in 0..<data.count {
            if data.indices.contains(index) && data[index].value == value {
                data.remove(at: index)
                return index
            }
        }
        return nil
    }
}
