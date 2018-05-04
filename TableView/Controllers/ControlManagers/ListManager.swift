//
//  ListManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ListManager: ControlManagerProtocol {
    
    let model = ListModel()
    weak var delegeteFakeData: FakeDataProtocol?
    private var valueTextField = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let index = Int(valueTextField) else { return }
        if let result = model.add(index: index) {
            fakeData.highlight(atIndex: nil)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let index = Int(valueTextField) else { return }
        if model.delete(index: index) {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: index)
            fakeData.delete(atIndex: index)
        }
    }
    
    private func changeInputValue() {
        guard let fakeData = delegeteFakeData else { return }
        guard let index = Int(valueTextField) else {
            fakeData.highlight(atIndex: nil)
            return
        }
        if let index = model.isEmpty(index: index) {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: index)
        } else {
            fakeData.highlight(atIndex: nil)
        }
    }
    
    private func valueTextField(_ text: String) {
        valueTextField = text
        changeInputValue()
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "index", keyboardType: .numberPad, action: valueTextField))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
