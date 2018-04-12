//
//  cellTableViewCell.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    static let identifier = "customCell"

    @IBOutlet weak var label: UILabel!
    
    func setLabel(value: String) {
        self.label.text = value
    }

}
