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
    private var valueTextField = ""
    
    private func add() {
        //TO DO
    }
    
    private func delete() {
        //TO DO
    }
    
    private func valueTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+") {
            print("+")
            self.add()
        })
        arrayItems.append(TypeItem.textField(placeholder: "key", keyboardType: .alphabet, action: valueTextField ))
        arrayItems.append(TypeItem.button(title: "-") {
            print("delete")
            self.delete()
        })
        return arrayItems
        
    }
}
