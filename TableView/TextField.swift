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
    
    var callAction: ( (String)->() )?
    
    init(placeholder: String, keyboardType: KeyboardType, action: ((String)->())? ) {
        super.init(frame: .zero)
        
        self.callAction = action
        self.borderStyle = .roundedRect
        self.autoresizesSubviews = false
        self.placeholder = placeholder
        self.delegate = self
        switch keyboardType {
        case .alphabet:
            self.keyboardType = .alphabet
        case .decimalPad:
            self.keyboardType = .decimalPad
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }

        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let permissibleCharacters = string.components(separatedBy: aSet).joined(separator: "")
        let newLength = text.count + string.count - range.length
        let maxSize = 4
        if (string == permissibleCharacters || self.keyboardType != .decimalPad) && newLength <= maxSize {
            if let text = text as? NSString {
                let result = text.replacingCharacters(in: range, with: string)
                callAction?(result)
                return true
            }
        }
        return false
    }
}

