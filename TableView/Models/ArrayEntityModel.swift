//
//  Model.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class ArrayEntityModel: ArrayEntityProtocol {
    
    private var arrayStructData: Array<EntityDataModel> = []
    
    var sizeArrayData: Int {
        get {
            return arrayStructData.count
        }
    }
    
    func at(index: Int)-> EntityDataProtocol {
        return arrayStructData[index]
    }
    
    init() {
        if let result = parse(fileName: "ATDinformation") {
            arrayStructData = result
        }
    }
    
    func parse(fileName: String, bundle: Bundle = Bundle.main) -> [EntityDataModel]? {
            guard let pList = bundle.path(forResource: fileName, ofType: "plist"), let dictionary = NSDictionary(contentsOfFile: pList) else { return nil }
        
        var resultArray: Array<EntityDataModel> = []
        dictionary.forEach { key, value in
            if let key = key as? String {
                if let obj = dictionary.value(forKey: key) as? NSDictionary {
                    guard let title = obj["title"] else { return }
                    guard let linkWiki = obj["linkWiki"] else { return  }
                    guard let type = ATDType(rawValue: String(describing: title)) else { return }
                    guard let desription = obj["description"] else { return }

                    resultArray.append(
                        EntityDataModel(title: String(describing: title),
                                            linkWiki: String(describing: linkWiki),
                                            type: type,
                                            description: String(describing: desription)))
                }
            }
        }

    return resultArray
    }
}

