//
//  FakeDataController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class FakeDataController: UIViewController, FakeDataProtocol, UITableViewDelegate, UITableViewDataSource {
    var arrayData: Array<CellStatus> = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FakeDataCell.identifier, for: indexPath) as? FakeDataCell else {
            return UITableViewCell()
        }
        cell.configureWith(data: arrayData[indexPath.row].value)
        
        if arrayData[indexPath.row].status == .new {
            cell.setColor(.red)
        } else {
            cell.setColor(.clear)
        }
        return cell
    }
    
    func add(atIndex: Int, value: String) {
        arrayData.insert(CellStatus(value), at: atIndex)
        tableView.insertRows(at: [IndexPath(row: atIndex, section: 0)], with: .middle)
    }
    
    func delete(atIndex: Int) {
        if !arrayData.indices.contains(atIndex) { return }
        
        arrayData.remove(at: atIndex)
        tableView.deleteRows(at: [IndexPath(row: atIndex, section: 0)], with: .middle)
    }
    
    func commit() {
        for i in 0 ... arrayData.count - 1 {
            arrayData[i].status = .old
        }
        tableView.reloadData()
    }
}

enum Status {
    case new
    case old
}

struct CellStatus {
    var value: String
    var status: Status
    
    init(_ value: String, _ status: Status = .new) {
        self.value = value
        self.status = .new
    }
}
