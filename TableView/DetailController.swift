//
//  DetailController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var viewForOpacity: UIView!
    @IBOutlet weak var buttonConstrain: NSLayoutConstraint!
    @IBOutlet weak var heightConstrain: NSLayoutConstraint!
    @IBOutlet weak var buttonShowText: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    var modelEntity: DataStructureProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        viewForOpacity.opacityGradient()
        textLabel.text = modelEntity?.getDescript() ?? "We don`t have description for this ATD"
        self.title = modelEntity?.getTitle() ?? "Default ATD"
    }
    
    @IBAction func onButtonShowText(_ sender: Any) {
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

extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.superview?.bounds ?? CGRect.null
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.15, 0.25, 0.75, 0.85, 1.0]
        self.superview?.layer.mask = gradient
        self.backgroundColor = UIColor.clear
    }
}
