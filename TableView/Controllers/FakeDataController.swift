//
//  FakeDataController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class FakeDataController: UIViewController, FakeDataProtocol {

    var data: Array<String> = []
    var highlightedIndex = -1
    @IBOutlet weak var tableView: UITableView!
    
    func addValue(_ value: String, atIndex index: Int) {
        data.insert(value, at: index)
        tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .middle)
    }
    
    func delete(atIndex: Int) {
        if data.indices.contains(atIndex) {
            data.remove(at: atIndex)
            tableView.deleteRows(at: [IndexPath(row: atIndex, section: 0)], with: .middle)
        }
    }
    
    func highlight(atIndex: Int?) {
        guard let index = atIndex else {
            highlightedIndex = -1
            tableView.reloadData()
            return
        }
        highlightedIndex = index
        tableView.reloadData()
    }
}

extension FakeDataController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FakeDataCell.reuseIdentifier, for: indexPath) as? FakeDataCell else {
            return UITableViewCell()
        }
        
        cell.configureWith(data: data[indexPath.row], isHighlighted: (indexPath.row == highlightedIndex) )
        return cell
    }
}
