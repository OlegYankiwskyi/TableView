//
//  CellEntity.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/30/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ModelCell {
    private var data: Array<CellEntity> = []
    
    var count: Int {
        get {
            return data.count
        }
    }
    
    func add(atIndex: Int, element: CellEntity) {
        data.insert(element, at: atIndex)
    }
    
    func delete(atIndex: Int) {
        if !data.indices.contains(atIndex) { return }

        data.remove(at: atIndex)
    }
    
    func getElement(atIndex: Int) -> CellEntity? {
        if data.indices.contains(atIndex) {
            return data[atIndex]
        } else {
            return nil
        }
    }

}
