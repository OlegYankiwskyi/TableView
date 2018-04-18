//
//  DetailController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var buttonConstrain: NSLayoutConstraint!
    @IBOutlet weak var heightConstrain: NSLayoutConstraint!
    @IBOutlet weak var buttonShowText: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    var modelEntity: DataStructureProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = modelEntity?.getDescript() ?? "We don`t have description for this ATD"
        self.title = modelEntity?.getTitle() ?? "Default ATD"
    }
    
    @IBAction func onButtonShowText(_ sender: Any) {
        print(123)
        if buttonShowText.currentTitle! == "More" {
            heightConstrain.priority = UILayoutPriority(rawValue: 250)
            buttonShowText.setTitle("Less", for: .normal)
//            buttonConstrain.constant = 30
//            buttonConstrain.priority  = UILayoutPriority(rawValue: 250)
//            self.view.updateConstraints()
        }
        else {
            heightConstrain.priority = UILayoutPriority(rawValue: 999)
            buttonShowText.setTitle("More", for: .normal)
            //            buttonConstrain.constant = 30
            //            buttonConstrain.priority  = UILayoutPriority(rawValue: 250)
//            self.view.updateConstraints()

        }
    }
}
