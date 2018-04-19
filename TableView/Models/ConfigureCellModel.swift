//
//  ConfigureModel.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

class ConfigureCellModel: ConfigureCellProtocol {
    func configure(value: String, model: DataStructureTableCell) {
        model.label.text = value
    }
}
