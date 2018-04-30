//
//  ControlManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class StackManager: ControlManagerProtocol {
    weak var delegeteFakeData: FakeDataProtocol?

    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        
        let index = fakeData.getLength() - 1
        if fakeData.getElement(atIndex: index) != nil {
            guard let value = fakeData.getElement(atIndex: 0) , let valueInt = Int(value) else { return }
            let newValue = valueInt + 1
            fakeData.add(atIndex: 0, value: String(newValue))
        } else {
            fakeData.add(atIndex: 0, value: "0")
        }
    }
    
    private func delete() {
        delegeteFakeData?.delete(atIndex: 0)
    }
    
    var menuItems: [TypeItem] {
        get {
            var arrayItems: Array<TypeItem> = []
            arrayItems.append(TypeItem.button(title: "+") {
                self.add()
            })
            arrayItems.append(TypeItem.button(title: "-") {
                self.delete()
            })
            return arrayItems
        }
    }
}
