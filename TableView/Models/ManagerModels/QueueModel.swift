//
//  QueueModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class QueueModel {
    private var data: Array<CellEntity> = []

    func add() -> (value: String, index: Int) {
        let index = data.count

        if data.indices.contains(index-1) {
            let newElement = CellEntity(value: data[index-1].value+1)
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        } else {
            let newElement = CellEntity(value: 0)
            data.insert(newElement, at: 0)
            return (value: newElement.toString(), index: 0)
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
