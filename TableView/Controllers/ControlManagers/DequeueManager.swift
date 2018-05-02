//
//  DequeueManager.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class DequeueManager: ControlManagerProtocol {
    let model = ModelCell()
    weak var delegeteFakeData: FakeDataProtocol?
    
    private func addToTail() {
        guard let fakeData = delegeteFakeData else { return }
        let index = model.count
        
        guard let element = model.getElement(atIndex: index-1) else {
            let newElement = CellEntity(value: 0)
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        let newElement = CellEntity(value: element.value+1, descr: "")
        model.add(atIndex: index, element: newElement)
        fakeData.add(atIndex: index, value: newElement.toString())
    }
    
    private func addToHead() {
        guard let fakeData = delegeteFakeData else { return }
        let index = 0
        
        guard let element = model.getElement(atIndex: 0) else {
            let newElement = CellEntity(value: 0)
            model.add(atIndex: index, element: newElement)
            fakeData.add(atIndex: index, value: newElement.toString())
            return
        }
        let newElement = CellEntity(value: element.value+1, descr: "")
        model.add(atIndex: index, element: newElement)
        fakeData.add(atIndex: index, value: newElement.toString())
        
    }
    
    private func deleteFirst() {
        guard let fakeData = delegeteFakeData else { return }
        model.delete(atIndex: 0)
        fakeData.delete(atIndex: 0)
    }
    
    private func deleteLast() {
        guard let fakeData = delegeteFakeData else { return }
        let index = model.count-1
        model.delete(atIndex: index)
        fakeData.delete(atIndex: index)
    }
    
    var menuItems: [TypeItem] {
        get {
            var arrayItems: Array<TypeItem> = []
            arrayItems.append(TypeItem.button(title: "addToTail") {
                self.addToTail()
            })
            arrayItems.append(TypeItem.button(title: "addToHead") {
                self.addToHead()
            })
            arrayItems.append(TypeItem.button(title: "deleteFirst") {
                self.deleteFirst()
            })
            arrayItems.append(TypeItem.button(title: "deleteLast") {
                self.deleteLast()
            })
            return arrayItems
        }
    }
}
