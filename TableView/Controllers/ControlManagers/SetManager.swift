//
//  SetManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class SetManager: ControlManagerProtocol {
    
    var model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    var valueTextField = ""

    private func add() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }

        for index in 0..<model.count {
            if model.getElement(atIndex: index)?.value == value {
                return
            }
        }
        
        let index = model.count
        let newElement = CellEntity(value: value)
        model.add(atIndex: index, element: newElement)
        fakeData.add(atIndex: index, value: newElement.toString())
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }

        for index in 0..<model.count {
            if model.getElement(atIndex: index)?.value == value {
                model.delete(atIndex: index)
                fakeData.delete(atIndex: index)
            }
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
