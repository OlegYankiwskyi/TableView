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
    var modelEntity: EntityDataProtocol?

    var isOpen = false {
        willSet {
            let high = UILayoutPriority(rawValue: 999)
            let small = UILayoutPriority(rawValue: 250)
            let titleForOpenView = "Less"
            let titleForCloseView = "More"
            
            if isOpen {
                UIView.transition(with: scrollView,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.toggleButton.setTitle(titleForCloseView)
                                    self.heightConstrain.priority = high
                                    self.buttonConstrain.priority = high
                                    self.viewForOpacity.isHidden = false
                })
            } else {
                UIView.transition(with: scrollView,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.toggleButton.setTitle(titleForOpenView)
                                    self.heightConstrain.priority = small
                                    self.buttonConstrain.priority = small
                                    self.viewForOpacity.isHidden = true
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewForOpacity.opacityGradient()
        textLabel.text = modelEntity?.getDescript() ?? "We don`t have description for this ATD"
        self.title = modelEntity?.getTitle() ?? "Default ATD"
    }
    
    @IBAction func onButtonShowText(_ sender: Any) {
        isOpen = !isOpen
    }
    
    @IBAction func onOpenWiki(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let alertController = UIAlertController(title: "Choose browser", message: "", preferredStyle: .actionSheet)

        let UIWebView = UIAlertAction(title: "WebView", style: .default, handler: {
            _ in
            guard let controller = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else { return }
            controller.linkWiki = self.modelEntity?.getLink()
            self.present(controller, animated: true, completion: nil)
        })
        let WkWebKit = UIAlertAction(title: "WebKit", style: .default, handler: {
            _ in
            guard let controller = storyboard.instantiateViewController(withIdentifier: "WebKitController") as? WebKitController else { return }
            controller.linkWiki = self.modelEntity?.getLink()
            self.present(controller, animated: true, completion: nil)
        })
        let SFSafary = UIAlertAction(title: "SFSafary", style: .default, handler: {
            _ in
            guard let controller = storyboard.instantiateViewController(withIdentifier: "SFSafariController") as? SFSafariController else { return }
            controller.linkWiki = self.modelEntity?.getLink()
            self.present(controller, animated: true, completion: nil)
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











