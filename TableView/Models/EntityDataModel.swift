//
//  EntityDataModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class EntityDataModel: EntityDataProtocol {
    private var titleATD: String
    private var description: String?
    private var linkWiki: String?
    private var typeATD: ATDType
    
    var title: String {
        get {
            return self.titleATD
        }
    }
    var descript: String? {
        get {
            return self.description
        }
    }
    var link: String? {
        get {
            return self.linkWiki
        }
    }
    var type: ATDType {
        get {
            return self.typeATD
        }
    }
    
    init(title: String, linkWiki: String? = nil, type: ATDType, description: String? = nil) {
        self.titleATD = title
        self.linkWiki = linkWiki
        self.description = description
        self.typeATD = type
    }
}




