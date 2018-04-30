//
//  cellTableViewCell.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class DataStructureTableCell: UITableViewCell {
    
    static let identifier = "customCell"
    @IBOutlet weak var label: UILabel!
}

extension DataStructureTableCell: DataStructureTableCellProtocol {
    
    func configure(data: EntityDataProtocol) {
        self.label.text = data.title
    }
}
