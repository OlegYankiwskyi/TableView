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
    @IBOutlet weak var tableView: UITableView!
    
    func add(atIndex: Int, value: String) {
        data.insert(value, at: atIndex)
        tableView.insertRows(at: [IndexPath(row: atIndex, section: 0)], with: .middle)
    }
    
    func delete(atIndex: Int) {
        if data.indices.contains(atIndex) {
            data.remove(at: atIndex)
            tableView.deleteRows(at: [IndexPath(row: atIndex, section: 0)], with: .middle)
        } else {
            print("error func delete")
        }
    }
}

extension FakeDataController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FakeDataCell.identifier, for: indexPath) as? FakeDataCell else {
            return UITableViewCell()
        }
        cell.configureWith(data: data[indexPath.row])
        return cell
    }
    

}
