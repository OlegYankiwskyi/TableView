//
//  DataStructure.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

struct EntityDataModel: EntityDataProtocol {
    private var title: String
    private var descript: String
    private var link: String
    
    func getTitle() -> String {
        return self.title
    }
    func getDescript() -> String {
        return self.descript
    }
    func getLink() -> String {
        return self.link
    }

    
    init(title: String, description: String, link: String) {
        self.title = title
        self.descript = description
        self.link = link
    }
}
