//
//  StackModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class StackModel {
    private var data: Array<CellEntity> = []
    
    func add() -> (value: String, index: Int) {
        let index = 0
        
        if data.indices.contains(index) {
            let newElement = CellEntity(value: data[index].value+1)
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        } else {
            let newElement = CellEntity(value: 0)
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        }

    }
    
    func delete() -> Int? {
        let index = 0
        if data.indices.contains(index) {
            data.remove(at: index)
            return index
        }
        return nil
    }
}
