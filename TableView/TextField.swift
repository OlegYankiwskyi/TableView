//
//  TextField.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation
import UIKit

class TextField: UITextField, UITextFieldDelegate {
    init(title: String) {
        super.init(frame: .zero)
        
        self.borderStyle = .roundedRect
        self.autoresizesSubviews = false
        self.placeholder = title
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        let newLength = text.count + string.count - range.length
        let maxSize = 4
        return string == numberFiltered && newLength <= maxSize
    }
}
