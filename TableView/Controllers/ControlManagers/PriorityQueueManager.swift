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
    private var valueTextField = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let priority = Int(valueTextField) else { return }
        let newElement = CellEntity(value: model.count,description: "value", extraValue: String(priority), descriptionExtraValue: "priority")
    
        if model.count == 0 {
            model.add(atIndex: 0, element: newElement)
            fakeData.add(atIndex: 0, value: newElement.toString())
            return
        }
        
        guard let elementLast = model.getElement(atIndex: model.count-1), let valueLast = Int(elementLast.extraValue) else { return }
        if valueLast <= priority {
            let index = model.count
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        
        guard let elementFirst = model.getElement(atIndex: 0), let valueFirst = Int(elementFirst.extraValue) else { return }
        if valueFirst > priority {
            let index = 0
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        for i in 1..<model.count {
            guard let elementFirst = model.getElement(atIndex: i-1), let valueFirst = Int(elementFirst.extraValue) else { return }
            guard let elementSecond = model.getElement(atIndex: i), let valueSecond = Int(elementSecond.extraValue) else { return }
            if valueFirst <= priority && valueSecond >= priority {
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
  
    private func valueTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "some value", keyboardType: .decimalPad, action: valueTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
        
    }
}
