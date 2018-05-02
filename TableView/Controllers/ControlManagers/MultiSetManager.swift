//
//  MultiSetManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/30/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class MultiSetManager: ControlManagerProtocol {
    
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    private var valueTextField = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let value = Int(valueTextField) else { return }
        
        for index in 0..<model.count {
            guard var element = model.getElement(atIndex: index) else { return }
            
            if element.value == value {
                element.extraValue += 1
                element.descriptionValue = "value"
                element.descriptionExtraValue = "repetitions"
                
                model.delete(atIndex: index)
                fakeData.delete(atIndex: index)
                model.add(atIndex: index, element: element)
                fakeData.add(atIndex: index, value: element.toString())
                return
            }
        }
        
        let index = model.count
        let element = CellEntity(value: value)
        model.add(atIndex: index, element: element)
        fakeData.add(atIndex: index, value: element.toString())
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
                    var newElement = element
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
