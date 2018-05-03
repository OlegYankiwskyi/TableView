//
//  PriorityQueueModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/3/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class PriorityQueueModel {
    private var data: Array<CellEntity> = []
    
    func add(priority: String) -> (value: String, index: Int)? {
        let newElement = CellEntity(value: data.count, description: "value", extraValue: priority, descriptionExtraValue: "priority")
        
        if data.count == 0 {
            data.insert(newElement, at: 0)
            return (value: newElement.toString(), index: 0)
        }
        
        if data.indices.contains(data.count-1) {
            let elementLast = data[data.count-1]
            if elementLast.extraValue <= priority {
                let index = data.count
                data.insert(newElement, at: index)
                return (value: newElement.toString(), index: index)
            }
        }
        
        if data.indices.contains(0) {
            let elementFirst = data[0]
            if elementFirst.extraValue > priority {
                let index = 0
                data.insert(newElement, at: index)
                return (value: newElement.toString(), index: index)
            }
        }
        
        for i in 1..<data.count {
            if !data.indices.contains(i-1) || !data.indices.contains(i) { break }
            
            if data[i-1].extraValue <= priority && data[i].extraValue >= priority {
                data.insert(newElement, at: i)
                return (value: newElement.toString(), index: i)
            }
        }
        return nil
    }
    
    func delete() -> Int? {
        if data.indices.contains(0) {
            data.remove(at: 0)
            return 0
        }
        return 0
    }
}
