//
//  WebViewController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, BrowserControllerProtocol {

    @IBOutlet weak var windowBrowser: UIWebView!
    var linkWiki: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: linkWiki!) else {
            print("Error url")
            return
        }
        let request = URLRequest(url: url)
        windowBrowser.loadRequest(request)
    }
    
    @IBAction func onButtonBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
