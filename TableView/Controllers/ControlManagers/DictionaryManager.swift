//
//  DictionaryManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class DictionaryManager: ControlManagerProtocol {
    
    let model = DictionaryModel()
    weak var delegeteFakeData: FakeDataProtocol?
    private var value = ""
    private var key = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let value = Int(value) else { return }
        if let result = model.add(value: value, key: key) {
            fakeData.add(atIndex: result.index, value: result.value)
        }
        
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.delete(key: key) {
            fakeData.delete(atIndex: result)
        }
    }
    
    private func valueTextField(_ text: String) {
        value = text
    }
    private func keyTextField(_ text: String) {
        key = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "value", keyboardType: .numberPad, action: valueTextField ))
        arrayItems.append(TypeItem.textField(placeholder: "key", keyboardType: .alphabet, action: keyTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
        
    }
}
