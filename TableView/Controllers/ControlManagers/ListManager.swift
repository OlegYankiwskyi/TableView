//
//  ListManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ListManager: ControlManagerProtocol {
    
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    private var valueTextField = ""
    
    private func add() {
        guard let fakeData = delegeteFakeData, let index = Int(valueTextField) else { return }
        
        if index >= 0 && index <= model.count {
            let newElement = CellEntity(value: model.count)
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData, let index = Int(valueTextField) else { return }
        
        if index >= 0 && index <= model.count {
            model.delete(atIndex: index)
            fakeData.delete(atIndex: index)
        }
    }
    
    private func valueTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        get {
            var arrayItems: Array<TypeItem> = []
            arrayItems.append(TypeItem.button(title: "+") {
                self.add()
            })
            arrayItems.append(TypeItem.textField(placeholder: "index", action: valueTextField))
            arrayItems.append(TypeItem.button(title: "-") {
                self.delete()
            })
            return arrayItems
        }
    }
}
