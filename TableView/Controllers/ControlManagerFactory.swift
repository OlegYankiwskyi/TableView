//
//  ControlManagerFactory.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ControlManagerFactory: ControlManagerFactoryProtocol {
    static func getControlManager(title: String) -> ControlManagerProtocol {
        
        switch title {
        case "Stack":
            return StackManager()
        case "Queue":
            return QueueManager()
        case "Set":
            return SetManager()
//        case "Dequeue":
//            return DequeueManager()
//        case "Priority Queue":
//            return PriorityQueueManager()
//        case "List":
//            return ListManager()
//        case "Priority Queue":
//            return MultiSetManager()
//        case "Priority Queue":
//            return DictionaryQueueManager()
        default:
            return StackManager()//TO DO
        }
    }
}
