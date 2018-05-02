//
//  DictionaryManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class DictionaryManager: ControlManagerProtocol {
    
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    private var value = ""
    private var key = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let value = Int(value) else { return }
        let newElement = CellEntity(value: value,description: "value", extraValue: key, descriptionExtraValue: "key")
        
        if model.count == 0 {
            model.add(atIndex: 0, element: newElement)
            fakeData.add(atIndex: 0, value: newElement.toString())
            return
        }
        
        guard let elementLast = model.getElement(atIndex: model.count-1) else { return }
        if elementLast.extraValue <= key {
            let index = model.count
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        
        guard let elementFirst = model.getElement(atIndex: 0) else { return }
        if elementFirst.extraValue > key {
            let index = 0
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        for i in 1..<model.count {
            guard let elementFirst = model.getElement(atIndex: i-1) else { return }
            guard let elementSecond = model.getElement(atIndex: i) else { return }
            if elementFirst.extraValue <= key && elementSecond.extraValue >= key {
                model.add(atIndex: i, element: newElement)
                fakeData.add(atIndex: i, value: newElement.toString())
                return
            }
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        
        for i in 0..<model.count {
            guard let element = model.getElement(atIndex: i) else { return }
            if element.extraValue == key {
                model.delete(atIndex: i)
                fakeData.delete(atIndex: i)
                return
            }
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
        arrayItems.append(TypeItem.textField(placeholder: "value", keyboardType: .decimalPad, action: valueTextField ))
        arrayItems.append(TypeItem.textField(placeholder: "key", keyboardType: .alphabet, action: keyTextField ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
        
    }
}
