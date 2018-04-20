//
//  WebViewController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var windowBrowser: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://developer.apple.com")
        let request = URLRequest(url: url!)
        windowBrowser.loadRequest(request)
        
        print("WebViewController")

    }

}
