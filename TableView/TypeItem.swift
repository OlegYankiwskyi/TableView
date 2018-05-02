//
//  TypeItem.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation

enum TypeItem {
    case button(title: String, action: ()->() )
    case textField(placeholder: String, keyboardType: KeyboardType, action: ( (String)->() )?)
}

enum KeyboardType {
    case decimalPad
    case alphabet
}

