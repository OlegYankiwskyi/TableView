//
//  FakeDataCell.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class FakeDataCell: UITableViewCell {
    
    static let identifier = "fakeDataCell"
    @IBOutlet weak var label: UILabel!
    
    func setColor(_ color: UIColor) {
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.backgroundColor = color
        })
    }
}

extension FakeDataCell: FakeDataCellProtocol {
    
    func configureWith(data: String) {
        self.label.text = data
    }
}
