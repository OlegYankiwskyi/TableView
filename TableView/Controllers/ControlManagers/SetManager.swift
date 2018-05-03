//
//  SetManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class SetManager: ControlManagerProtocol {
    
    var model = SetModel()
    weak var delegeteFakeData: FakeDataProtocol?
    var valueTextField = ""

    private func add() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }
        if let result = model.add(value: value) {
            fakeData.add(atIndex: result.index, value: result.value)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }
        if let result = model.delete(value: value) {
            fakeData.delete(atIndex: result)
        }
    }
    
    private func valueTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "some value", keyboardType: .alphabet, action: valueTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
