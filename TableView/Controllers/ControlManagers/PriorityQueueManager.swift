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
            fakeData.add(atIndex: result.index, value: result.value)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.delete() {
            fakeData.delete(atIndex: result)
        }
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
