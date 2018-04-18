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
    
        viewForOpacity.opacityGradient()
        textLabel.text = modelEntity?.getDescript() ?? "We don`t have description for this ATD"
        self.title = modelEntity?.getTitle() ?? "Default ATD"
    }
    
    @IBAction func onButtonShowText(_ sender: Any) {
        if buttonShowText.currentTitle! == "More" {
            print("good")
            heightConstrain.priority = UILayoutPriority(rawValue: 250)
            buttonShowText.setTitle("Less", for: .normal)
        }
        else {
            print("bad")
            heightConstrain.priority = UILayoutPriority(rawValue: 999)
            buttonShowText.setTitle("More", for: .normal)
        }
    }
}

extension UIView {
    func opacityGradient() {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1]
        self.layer.mask = gradient
    }
}











