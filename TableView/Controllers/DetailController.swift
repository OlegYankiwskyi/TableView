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
    var isOpen = false
    var modelEntity: EntityDataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewForOpacity.opacityGradient()
        textLabel.text = modelEntity?.getDescript() ?? "We don`t have description for this ATD"
        self.title = modelEntity?.getTitle() ?? "Default ATD"
    }
    
    @IBAction func onButtonShowText(_ sender: Any) {
        let high = UILayoutPriority(rawValue: 999)
        let small = UILayoutPriority(rawValue: 250)
        let titleForOpenView = "Less"
        let titleForCloseView = "More"
        
        if isOpen {
            buttonShowText.setTitle(titleForOpenView, for: .normal)
            heightConstrain.priority = small
            buttonConstrain.priority = small
            viewForOpacity.isHidden = true
            isOpen = false
        }
        else {
            buttonShowText.setTitle(titleForCloseView, for: .normal)
            heightConstrain.priority = high
            buttonConstrain.priority = high
            viewForOpacity.isHidden = false
            isOpen = true
        }
    }
}

extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        self.layer.mask = gradient
    }
}











