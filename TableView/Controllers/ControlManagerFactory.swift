//
//  ControlManagerFactory.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ControlManagerFactory: ControlManagerFactoryProtocol {    
    static func getControlManager(type: ATDType) -> ControlManagerProtocol {
        
        switch type {
        case .stack:
            return StackManager()
        case .queue:
            return QueueManager()
        case .set:
            return SetManager()
        case .dequeue:
            return DequeueManager()
        case .priorityQueue:
            return PriorityQueueManager()
        case .list:
            return ListManager()
        case .multiSet:
            return MultiSetManager()
        case .dictionary:
            return DictionaryManager()
        }
    }
}
