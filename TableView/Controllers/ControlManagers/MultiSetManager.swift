//
//  MultiSetManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/30/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class MultiSetManager: ControlManagerProtocol {
    let model = MultiSetModel()
    weak var delegeteFakeData: FakeDataProtocol?
    private var valueTextField = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }
        let result = model.add(value: value)
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
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField), let result = model.delete(value: value) else { return }
        if result.isReplace {
            fakeData.highlight(atIndex: nil)
            fakeData.delete(atIndex: result.index)
            fakeData.addValue(result.value, atIndex: result.index)
            fakeData.highlight(atIndex: result.index)
        } else {
            fakeData.highlight(atIndex: nil)
            fakeData.highlight(atIndex: result.index)
            fakeData.delete(atIndex: result.index)
        }
    }
    
    private func changeInputValue() {
        guard let fakeData = delegeteFakeData,let value = Int(valueTextField) else { return }
        if let index = model.isEmpty(value: value) {
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
        arrayItems.append(TypeItem.textField(placeholder: "some value", keyboardType: .numberPad, action: valueTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
