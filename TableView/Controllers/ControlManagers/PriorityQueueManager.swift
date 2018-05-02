//
//  PriorityQueueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class PriorityQueueManager: ControlManagerProtocol {
    
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    private var priority = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        let newElement = CellEntity(value: model.count, description: "value", extraValue: priority, descriptionExtraValue: "priority")
        
        if model.count == 0 {
            model.add(atIndex: 0, element: newElement)
            fakeData.add(atIndex: 0, value: newElement.toString())
            return
        }
        
        guard let elementLast = model.getElement(atIndex: model.count-1) else { return }
        if elementLast.extraValue <= priority {
            let index = model.count
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        
        guard let elementFirst = model.getElement(atIndex: 0) else { return }
        if elementFirst.extraValue > priority {
            let index = 0
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        for i in 1..<model.count {
            guard let elementFirst = model.getElement(atIndex: i-1) else { return }
            guard let elementSecond = model.getElement(atIndex: i) else { return }
            if elementFirst.extraValue <= priority && elementSecond.extraValue >= priority {
                model.add(atIndex: i, element: newElement)
                fakeData.add(atIndex: i, value: newElement.toString())
                return
            }
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        model.delete(atIndex: 0)
        fakeData.delete(atIndex: 0)
    }
    
    private func priorityTextField(_ text: String) {
        priority = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "priority", keyboardType: .alphabet, action: priorityTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
