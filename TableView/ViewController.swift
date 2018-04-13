//
//  ViewController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let model = StructDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSeparatorColor(color: UIColor.black)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sizeArrayData
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath)
        }

        cell.setLabel(value: model.getElement(at: indexPath.row))
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView(tableView, didDeselectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        return
    }
    
    private func setSeparatorColor(color: UIColor) {
        self.tableView.separatorColor = color
    }
}
