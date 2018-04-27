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
    
    func setDelegate(delegeteFakeData: FakeDataProtocol) {
        self.delegeteFakeData = delegeteFakeData
    }
    
    private func add() {
        print("add")
        print(valueTextField)
        guard let fakeData = delegeteFakeData else { return }
        let index = fakeData.arrayData.count - 1
        if fakeData.arrayData.indices.contains(index) {
            fakeData.add(index: index+1, value: valueTextField)
        } else {
            fakeData.add(index: 0, value: "0")
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        fakeData.delete(index: 0)
    }
    
    private func changeTextField(_ text: String) {
        valueTextField = text
        print("change")
        print(valueTextField)
    }
    
    func createMenu() -> [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+") {
            self.add()
        })
        arrayItems.append(TypeItem.button(title: "-") {
            self.delete()
        })
        arrayItems.append(TypeItem.textField(placeholder: self.valueTextField, action: changeTextField ))
        return arrayItems
    }
}
