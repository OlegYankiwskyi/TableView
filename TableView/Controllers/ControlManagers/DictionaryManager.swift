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
        guard let fakeData = delegeteFakeData, let value = Int(value), let result = model.add(value: value, key: key) else { return }
        if result.isReplace {
            fakeData.highlight(atIndex: nil)
            fakeData.delete(atIndex: result.index)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        } else {
            fakeData.highlight(atIndex: nil)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.delete(key: key) {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: result)
            fakeData.delete(atIndex: result)
        }
    }
    
    private func changeInputValue() {
        guard let fakeData = delegeteFakeData else { return }
        if let index = model.isEmpty(key: key) {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: index)
        } else {
            fakeData.highlight(atIndex: nil)
        }
    }
    
    private func valueTextField(_ text: String) {
        value = text
    }
    private func keyTextField(_ text: String) {
        key = text
        changeInputValue()
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
