//
//  QueueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class QueueManager: ControlManagerProtocol {
   
    let model = QueueModel()
    weak var delegeteFakeData: FakeDataProtocol?
    
    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        let result = model.add()
        fakeData.add(atIndex: result.index, value: result.value)
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.delete() {
            fakeData.delete(atIndex: result)
        }
    }
    
    var menuItems: [TypeItem] {
        var arrayItems: Array<TypeItem> = []
        arrayItems.append(TypeItem.button(title: "+", action: add ))
        arrayItems.append(TypeItem.button(title: "-", action: delete ))
        return arrayItems
    }
}
