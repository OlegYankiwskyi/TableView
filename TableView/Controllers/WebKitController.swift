//
//  WebKitController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit
import WebKit
import Foundation

class WebKitController: UIViewController, WKUIDelegate {

    var windowBrowser: WKWebView!
    var linkWiki: String?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        windowBrowser = WKWebView(frame: .zero, configuration: webConfiguration)
        windowBrowser.uiDelegate = self
        view = windowBrowser
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton.createButtonBack()
        view.addSubview(button)
        button.addTarget(self, action: #selector(onButtonBack), for: .touchUpInside)
        
        guard let url = URL(string: linkWiki!) else {
            print("Error url")
            return
        }
        let request = URLRequest(url: url)
        windowBrowser.load(request)
    }
    
    @objc func onButtonBack() {
        self.dismiss(animated: true)
    }
}

extension UIButton {
    static func createButtonBack() -> UIButton {
        let button = UIButton(frame: CGRect(x: 5, y: 5, width: 63, height: 40))
        button.setTitle("Back", for: .normal)
        button.setTitle("Back", for: .disabled)
        button.setTitle("Back", for: .focused)
        button.setTitle("Back", for: .highlighted)
        
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.blue, for: .disabled)
        button.setTitleColor(.blue, for: .focused)
        button.setTitleColor(.blue, for: .highlighted)

        return button
    }
}

