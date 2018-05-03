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
            fakeData.add(atIndex: result.index, value: result.value)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let index = Int(valueTextField) else { return }
        if model.delete(index: index) {
            fakeData.delete(atIndex: index)
        }
    }
    
    private func valueTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "index", keyboardType: .numberPad, action: valueTextField))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
