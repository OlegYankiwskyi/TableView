//
//  TypeItem.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/27/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import Foundation
import UIKit

enum TypeItem {
    case button(title: String, action: ()->() )
    case textField(placeholder: String, keyboardType: UIKeyboardType, action: ( (String)->() )?)
}


