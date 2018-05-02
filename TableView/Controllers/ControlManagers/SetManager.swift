//
//  SetManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class SetManager: ControlManagerProtocol {
    
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    var valueTextField = ""

    private func add() {
        guard let fakeData = delegeteFakeData, let index = Int(valueTextField) else { return }
        
        guard var newElement = model.getElement(atIndex: index) else { return }
        
        newElement.value = (model.getElement(atIndex: model.count-1)?.value)! + 1
        model.add(atIndex: index, element: newElement)
        fakeData.add(atIndex: index, value: newElement.toString())
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }
        
        for index in 0..<model.count {
            guard let element = model.getElement(atIndex: index) else { return }
            if element.value == value {
                if element.extraValue == 0 {
                    model.delete(atIndex: index)
                    fakeData.delete(atIndex: index)
                } else {
                    guard var newElement = model.getElement(atIndex: index) else { return }
                    newElement.extraValue -= 1
                    if newElement.extraValue == 0 {
                        newElement.descriptionValue = ""
                    }
                    
                    model.delete(atIndex: index)
                    fakeData.delete(atIndex: index)
                    model.add(atIndex: index, element: newElement)
                    fakeData.add(atIndex: index, value: newElement.toString())
                }
            }
        }
    }
    
    private func setTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        get {
            var arrayItems: Array<TypeItem> = []
            arrayItems.append(TypeItem.button(title: "+") {
                self.add()
            })
            arrayItems.append(TypeItem.textField(placeholder: "some value", action: setTextField ))
            arrayItems.append(TypeItem.button(title: "-") {
                self.delete()
            })
            return arrayItems
        }
    }
}
