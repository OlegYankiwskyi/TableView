//
//  DetailController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var modelEntity: DataStructureProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = modelEntity?.getDescript() ?? "We don`t have description for this ATD"
        self.title = modelEntity?.getTitle() ?? "Default ATD"
    }
}
