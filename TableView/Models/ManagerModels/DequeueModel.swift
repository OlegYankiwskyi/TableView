//
//  DequeueModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class DequeueModel {
    private var data: Array<CellEntity> = []

    func addToTail() -> (value: String, index: Int)? {
        let index = data.count
        
        if data.indices.contains(index-1) {
            let newElement = CellEntity(value: data[index-1].value+1, descr: "")
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        } else {
            let newElement = CellEntity(value: 0)
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        }
    }
    
    func addToHead() -> (value: String, index: Int)? {
        let index = 0
        if data.indices.contains(index) {
            let newElement = CellEntity(value: data[index].value+1, descr: "")
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        } else {
            let newElement = CellEntity(value: 0)
            data.insert(newElement, at: index)
            return (value: newElement.toString(), index: index)
        }
    }
    
    func deleteFirst() -> Int? {
        let index = 0
        if data.indices.contains(index) {
            data.remove(at: index)
            return 0
        }
        return nil
    }
    
    func deleteLast() -> Int? {
        let index = data.count-1
        if data.indices.contains(index) {
            data.remove(at: index)
            return index
        }
        return nil
    }
}
