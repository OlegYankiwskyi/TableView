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
        arrayStructData = parse(fileName: "ATDinformation")
    }
    
    func parse(fileName: String, bundle: Bundle = Bundle.main) -> [EntityDataModel] {
            guard let pList = bundle.path(forResource: fileName, ofType: "plist"), let dictionary = NSDictionary(contentsOfFile: pList) else { return [] }
        
        var resultArray: Array<EntityDataModel> = []
        dictionary.forEach { key, value in
            if let key = key as? String {
                if let dictionary = dictionary.value(forKey: key) as? NSDictionary {
                    if let result = parseEntity(key: key, dictionary: dictionary) {
                        resultArray.append(result)
                    }
                }
            }
        }
    return resultArray
    }
    
    func parseEntity(key: String, dictionary: NSDictionary) -> EntityDataModel? {
        guard let title = dictionary["title"] else { return nil }
        guard let linkWiki = dictionary["linkWiki"] else { return nil }
        guard let type = ATDType(rawValue: String(describing: key)) else { return nil }
        guard let desription = dictionary["description"] else { return nil }
        
        let entity = EntityDataModel(title: String(describing: title),
                                            linkWiki: String(describing: linkWiki),
                                            type: type,
                                            description: String(describing: desription))
        return entity
    }
}

