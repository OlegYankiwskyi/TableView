//
//  QueueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class QueueManager: ControlManagerProtocol {
   
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    
    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        
        let index = model.count
        guard let element = model.getElement(atIndex: index-1) else {
            let newElement = CellEntity(value: 0)
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        let newElement = CellEntity(value: element.value+1)
        model.add(atIndex: index, element: newElement)
        fakeData.add(atIndex: index, value: newElement.toString())
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        model.delete(atIndex: 0)
        fakeData.delete(atIndex: 0)
    }
    
    var menuItems: [TypeItem] {
        get {
            var arrayItems: Array<TypeItem> = []
            arrayItems.append(TypeItem.button(title: "+") {
                self.add()
            })
            arrayItems.append(TypeItem.button(title: "-") {
                self.delete()
            })
            return arrayItems
        }
    }
}
