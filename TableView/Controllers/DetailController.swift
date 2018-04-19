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
            buttonShowText.setTitle(titleForCloseView, for: .normal)
            heightConstrain.priority = high
            buttonConstrain.priority = high
            viewForOpacity.isHidden = false
            isOpen = false
        }
        else {
            buttonShowText.setTitle(titleForOpenView, for: .normal)
            heightConstrain.priority = small
            buttonConstrain.priority = small
            viewForOpacity.isHidden = true
            isOpen = true
        }
//        if isOpen {
//            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
//                self.buttonShowText.alpha = 0
//                self.viewForOpacity.alpha = 0
//                self.textLabel.alpha = 0
//            }, completion: { finished in
//                self.buttonShowText.alpha = 1
//                self.viewForOpacity.alpha = 1
//                self.textLabel.alpha = 1
//                self.buttonShowText.setTitle(titleForCloseView, for: .normal)
//                self.heightConstrain.priority = high
//                self.buttonConstrain.priority = high
//                self.viewForOpacity.isHidden = false
//
//                self.isOpen = false
//            })
//        } else {
//            buttonShowText.setTitle(titleForOpenView, for: .normal)
//            heightConstrain.priority = small
//            buttonConstrain.priority = small
//            viewForOpacity.isHidden = true
//            isOpen = true
//        }
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











