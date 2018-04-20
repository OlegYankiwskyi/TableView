//
//  DetailController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewForOpacity: UIView!
    @IBOutlet weak var buttonConstrain: NSLayoutConstraint!
    @IBOutlet weak var heightConstrain: NSLayoutConstraint!
    @IBOutlet weak var toggleButton: UIButton!
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
            toggleButton.setTitle(titleForCloseView)
            heightConstrain.priority = high
            buttonConstrain.priority = high
            viewForOpacity.isHidden = false
            isOpen = false
        }
        else {
            toggleButton.setTitle(titleForOpenView)
            heightConstrain.priority = small
            buttonConstrain.priority = small
            viewForOpacity.isHidden = true
            isOpen = true
        }

//        if isOpen {
//            UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
//                self.heightConstrain.priority = high
//                self.buttonConstrain.priority = high
//            }, completion: { finished in
//                self.buttonShowText.setTitle(titleForCloseView, for: .normal)
//                self.viewForOpacity.isHidden = false
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

    private func presentController(identifierController: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webViewController = storyboard.instantiateViewController(withIdentifier: nameController)
        self.present(webViewController, animated: true, completion: nil)
    }
    
    @IBAction func onOpenWiki(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose browser", message: "You should choose the browser for open link", preferredStyle: .actionSheet)

        let UIWebView = UIAlertAction(title: "UIWebView", style: .default, handler: {
            _ in
                self.presentController(identifierController: "WebViewController")
        })
        let WkWebKit = UIAlertAction(title: "WkWebKit", style: .default, handler: {
            _ in
                self.presentController(identifierController: "WebKitController")
        })
        let SFSafary = UIAlertAction(title: "SFSafary", style: .default, handler: {
            _ in
                self.presentController(identifierController: "SafaryController")
        })
        let close = UIAlertAction(title: "close", style: .default, handler: nil)
        
        alertController.addAction(UIWebView)
        alertController.addAction(WkWebKit)
        alertController.addAction(SFSafary)
        alertController.addAction(close)
        
        present(alertController, animated: true, completion: nil)
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

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .focused)
    }
}











