//
//  SafaryController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit
import SafariServices


class SFSafariController: UIViewController, SFSafariViewControllerDelegate, BrowserControllerProtocol {

    var linkWiki: String?
    var isClickDone = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let url = URL(string: self.linkWiki!) else {
            print("Error url")
            return
        }
        
        let controller = SFSafariViewController(url: url, entersReaderIfAvailable: true)
        controller.delegate = self
        
        if isClickDone {
            dismiss(animated: true)
        } else {
            self.present(controller, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isClickDone = true
    }
    
}
