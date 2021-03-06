//
//  DataStructureProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol EntityDataProtocol {
    func getTitle() -> String
    func getDescript() -> String?
    func getLink() -> String?
}
