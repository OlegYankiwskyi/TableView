//
//  ViewController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let modelArrayData = ArrayEntityModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSeparatorColor(color: UIColor.black)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArrayData.sizeArrayData
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataStructureTableCell.identifier, for: indexPath) as? DataStructureTableCell else {
            return UITableViewCell()
        }

        let dataStructure = modelArrayData.at(index: indexPath.row)
        cell.configure(data: dataStructure)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let identifier = "DetailController"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailStoryBoard = storyboard.instantiateViewController(withIdentifier: identifier) as? DetailController
            else {
                print("Error instantiate ViewController: \(identifier)")
                return
        }
        detailStoryBoard.modelEntity = modelArrayData.at(index: indexPath.row)
        self.navigationController?.pushViewController(detailStoryBoard, animated: true)
    }

    private func setSeparatorColor(color: UIColor) {
        tableView.separatorColor = color
    }
}


















