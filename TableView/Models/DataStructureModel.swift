//
//  DataStructure.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

struct DataStructureModel: EntityDataProtocol {
    private var title: String
    private var descript: String
    
    func getTitle() -> String {
        return self.title
    }
    func getDescript() -> String {
        return self.descript
    }
    
    init(title: String, description: String) {
        self.title = title
        self.descript = description
    }
}
