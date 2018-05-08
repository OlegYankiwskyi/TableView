//
//  ATDType.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 5/2/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

enum ATDType: String {
    case stack = "stack"
    case queue = "queue"
    case set = "set"
    case dequeue = "dequeue"
    case priorityQueue = "priorityqueue"
    case list = "list"
    case multiSet = "multiset"
    case dictionary = "dictionary"
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case ATDType.stack.rawValue:
            self = .stack
        case ATDType.queue.rawValue:
            self = .queue
        case ATDType.set.rawValue:
            self = .set
        case ATDType.dequeue.rawValue:
            self = .dequeue
        case ATDType.priorityQueue.rawValue:
            self = .priorityQueue
        case ATDType.list.rawValue:
            self = .list
        case ATDType.multiSet.rawValue:
            self = .multiSet
        case ATDType.dictionary.rawValue:
            self = .dictionary
        default:
            print("Error init ATDType")
            return nil
        }
    }
}
