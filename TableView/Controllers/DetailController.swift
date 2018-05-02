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
    @IBOutlet weak var openLinkButton: UIButton!
    var modelEntity: EntityDataProtocol!

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
        textLabel.text = modelEntity.descript
        title = modelEntity.title
        if modelEntity?.link == nil {
            openLinkButton.isEnabled = false
        }
    }
    
    @IBAction func onButtonShowText(_ sender: Any) {
        isOpen = !isOpen
    }
    
    @IBAction func onOpenWiki(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose browser", message: "", preferredStyle: .actionSheet)

        let actionWebView = getAction(title: "WebView", idController: "WebViewController")
        let actionWebKit = getAction(title: "WebKit", idController: "WebKitController")
        let actionSFSafary = getAction(title: "SFSafary", idController: "SFSafariController")
        let actionClose = getAction(title: "close")
        
        alertController.addAction(actionWebView)
        alertController.addAction(actionWebKit)
        alertController.addAction(actionSFSafary)
        alertController.addAction(actionClose)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func getAction(title: String, idController: String? = nil) -> UIAlertAction {
        guard let idController = idController else {
            return UIAlertAction(title: title, style: .cancel)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let action = UIAlertAction(title: title, style: .default, handler: {
            _ in
            guard var controller = storyboard.instantiateViewController(withIdentifier: idController) as? BrowserControllerProtocol else { return }
            controller.linkWiki = self.modelEntity?.link
            
            guard let viewController = controller as? UIViewController else {
                return
            }
            self.present(viewController, animated: true, completion: nil)
        })
        return action
    }
    
    @IBAction func actionVisualize(_ sender: Any) {
        let identifier = "Visualization"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let visualController = storyboard.instantiateViewController(withIdentifier: identifier) as? VisualizationController
            else {
                print("Error instantiate ViewController: \(identifier)")
                return
        }
        visualController.controlManager = ControlManagerFactory.getControlManager(type: modelEntity.type)
        visualController.title = self.title
        self.navigationController?.pushViewController(visualController, animated: true)
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
        self.setTitle(title, for: .highlighted)
    }
}











