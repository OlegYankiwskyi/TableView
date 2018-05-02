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

class WebKitController: UIViewController, WKUIDelegate, BrowserControllerProtocol {

    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var containerView: UIView!
    var windowBrowser: WKWebView!
    var linkWiki: String!
    
    override func loadView() {
        super.loadView()
        
        let webConfiguration = WKWebViewConfiguration()
        windowBrowser = WKWebView(frame: .zero, configuration: webConfiguration)
        windowBrowser.frame = containerView.frame
        containerView.addSubview(windowBrowser)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: linkWiki!) else {
            print("Error url")
            return
        }
        
        let request = URLRequest(url: url)
        windowBrowser.load(request)
    }
    
    @IBAction func onButtonDone(_ sender: Any) {
        self.dismiss(animated: true)

    }
}


