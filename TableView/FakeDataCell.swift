//
//  FakeDataCell.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class FakeDataCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    private func setColor(_ color: UIColor) {
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.backgroundColor = color
        })
    }
}

extension FakeDataCell: FakeDataCellProtocol {
    
    func configureWith(data: String, isHighlighted: Bool) {
        label.text = data
        if isHighlighted {
            setColor(.red)
        } else {
            setColor(.clear)
        }
    }
}

extension UITableViewCell {
    class var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}




