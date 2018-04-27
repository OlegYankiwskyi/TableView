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
    var fakeData: FakeDataProtocol?
    var controlManager: ControlManagerProtocol!
    var adapter: AdapterProtocol = Adapter()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTable"
        {
            if let controller = segue.destination as? FakeDataController {
                fakeData = controller
            }
        }
    }
    
    override func viewDidLoad() {
        guard let fakeData = fakeData else { return }
        
        controlManager.setDelegate(delegeteFakeData: fakeData)
        adapter.place(manager: controlManager, view: viewMenu)
    }

}


