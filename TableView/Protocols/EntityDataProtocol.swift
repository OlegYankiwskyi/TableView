//
//  DataStructureProtocol.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

protocol EntityDataProtocol {
    var title: String { get }
    var descript: String? { get }
    var link: String? { get }
    var type: ATDType { get }
}
