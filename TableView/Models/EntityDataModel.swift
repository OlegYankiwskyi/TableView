//
//  EntityDataModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class EntityDataModel: EntityDataProtocol {
    private var title: String
    private var descript: String
    private var linkWiki: String
    
    func getTitle() -> String {
        return self.title
    }
    func getLink() -> String {
        return self.linkWiki
    }
    func getDescript() -> String {
        return self.descript
    }
    
    init(title: String,linkWiki: String, description: String) {
        self.title = title
        self.linkWiki = linkWiki
        self.descript = description
    }
}
