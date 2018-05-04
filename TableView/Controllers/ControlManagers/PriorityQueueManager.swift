//
//  PriorityQueueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class PriorityQueueManager: ControlManagerProtocol {
    
    let model = PriorityQueueModel()
    weak var delegeteFakeData: FakeDataProtocol?
    private var priority = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.add(priority: priority) {
            fakeData.highlight(atIndex: nil)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.delete() {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: result)
            fakeData.highlight(atIndex: result)
        }
    }
    
    private func changeInputValue() {
        guard let fakeData = delegeteFakeData else { return }
        if let index = model.isEmpty(priority: priority) {
            fakeData.highlight(atIndex: index)
        } else {
            fakeData.highlight(atIndex: nil)
        }
    }
    
    private func priorityTextField(_ text: String) {
        priority = text
        changeInputValue()
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "priority", keyboardType: .alphabet, action: priorityTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
