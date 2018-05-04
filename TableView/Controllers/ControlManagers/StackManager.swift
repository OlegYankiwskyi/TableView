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
    let model = StackModel()
    
    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        let result = model.add()
        fakeData.addValue(result.value, atIndex: result.index)
        fakeData.highlight(atIndex: result.index)
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let index = model.delete() {
            fakeData.highlight(atIndex: index)
            fakeData.delete(atIndex: index)
            fakeData.highlight(atIndex: nil)

        }
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
