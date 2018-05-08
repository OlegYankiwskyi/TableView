//
//  DequeueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class DequeueManager: ControlManagerProtocol {
    let model = DequeueModel()
    weak var delegeteFakeData: FakeDataProtocol?
    
    private func addToTail() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.addToTail() {
            fakeData.highlight(atIndex: nil)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        }
    }
    
    private func addToHead() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.addToHead() {
            fakeData.highlight(atIndex: nil)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        }
    }
    
    private func deleteFirst() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.deleteFirst() {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: result)
            fakeData.delete(atIndex: result)
        }
    }
    
    private func deleteLast() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.deleteLast() {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: result)
            fakeData.delete(atIndex: result)
        }
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "addToTail", action: addToTail ))
        arrayItems.append(TypeItem.button(title: "addToHead", action: addToHead ))
        arrayItems.append(TypeItem.button(title: "deleteFirst", action: deleteFirst ))
        arrayItems.append(TypeItem.button(title: "deleteLast", action: deleteLast ))
        return arrayItems
    }
}
