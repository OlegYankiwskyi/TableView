//
//  QueueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class QueueManager: ControlManagerProtocol {
    
    weak var delegeteFakeData: FakeDataProtocol?
    
    func setDelegate(delegeteFakeData: FakeDataProtocol) {
        self.delegeteFakeData = delegeteFakeData
    }
    
    private func add() {
        guard let fakeData = delegeteFakeData else { return }
        let index = fakeData.arrayData.count - 1
        if fakeData.arrayData.indices.contains(index) {
            fakeData.add(index: index+1, value: String(Int(fakeData.arrayData[index].value)! + 1))
        } else {
            fakeData.add(index: 0, value: "0")
        }
    }
    
    private func delete() {
        guard let fakeData = delegeteFakeData else { return }
        fakeData.delete(index: 0)
    }
    
    func createMenu() -> [TypeButton] {
        var arrayButtons: Array<TypeButton> = []
        arrayButtons.append(TypeButton.button(title: "+") {
            self.add()
        })
        arrayButtons.append(TypeButton.button(title: "-") {
            self.delete()
        })
        return arrayButtons
    }
}
