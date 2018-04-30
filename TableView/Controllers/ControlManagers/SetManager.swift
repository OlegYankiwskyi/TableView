//
//  SetManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class SetManager: ControlManagerProtocol {
    
    weak var delegeteFakeData: FakeDataProtocol?
    var valueTextField = ""

    private func add() {
        //TO DO
        print(valueTextField)
    }
    
    private func delete() {
        //TO DO
    }
    
    private func changeTextField(_ text: String) {
        valueTextField = text
    }
    
    var menuItems: [TypeItem] {
        get {
            var arrayItems: Array<TypeItem> = []
            arrayItems.append(TypeItem.button(title: "+") {
                self.add()
            })
            arrayItems.append(TypeItem.textField(placeholder: self.valueTextField, action: changeTextField ))
            arrayItems.append(TypeItem.button(title: "-") {
                self.delete()
            })
            return arrayItems
        }
    }
}
