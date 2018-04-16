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
    let model = StructDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSeparatorColor(color: UIColor.black)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sizeArrayData
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataStructureTableCell.identifier, for: indexPath) as? DataStructureTableCell else {
            return UITableViewCell()
        }

        cell.setLabel(value: model.getElement(at: indexPath.row))
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailStoryBoard = storyboard.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        detailStoryBoard.model = "How Are you? \n"
        self.navigationController?.pushViewController(detailStoryBoard, animated: true)
    }

    private func setSeparatorColor(color: UIColor) {
        tableView.separatorColor = color
    }
}


















