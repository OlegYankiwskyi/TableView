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
    case textField(placeholder: String, action: ( (String)->() )? )
    
//    var title: String {
//        get {
//            switch self {
//            case .button(let title, _):
//                return title
//            case .textField(let placeholder):
//                return placeholder
//            }
//        }
//    }
    
//    var action: ()->() {
//        get {
//            switch self {
//            case .button(_ ,let action):
//                return action
//            default:
//                return { return }
//            }
//        }
//    }
}

