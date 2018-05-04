//
//  VisualizationController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/26/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class VisualizationController: UIViewController {

    @IBOutlet weak var viewMenu: UIStackView!
    var fakeData: FakeDataProtocol!
    var controlManager: ControlManagerProtocol!
    let adapter: AdapterProtocol = Adapter()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTable"
        {
            if let fakeDataController = segue.destination as? FakeDataController {
                fakeData = fakeDataController
            }
        }
    }
    
    override func viewDidLoad() {        
        controlManager.delegeteFakeData = fakeData
        adapter.createMenu(manager: controlManager, view: viewMenu)
    }

}


