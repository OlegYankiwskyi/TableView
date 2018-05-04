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
        fakeData.addValue(result.value, atIndex: result.index)
        fakeData.highlight(atIndex: result.index)
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        if let result = model.delete() {
            fakeData.highlight(atIndex: result)
            fakeData.delete(atIndex: result)
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
