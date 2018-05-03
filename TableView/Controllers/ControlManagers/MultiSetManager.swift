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
            fakeData.delete(atIndex: result.index)
            fakeData.add(atIndex: result.index, value: result.value)
        } else {
            fakeData.add(atIndex: result.index, value: result.value)
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField), let result = model.delete(value: value) else { return }
        
        if result.isReplace {
            fakeData.delete(atIndex: result.index)
            fakeData.add(atIndex: result.index, value: result.value)
        } else {
            fakeData.delete(atIndex: result.index)
        }
        
        
    }
    
    private func valueTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.textField(placeholder: "some value", keyboardType: .numberPad, action: valueTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
