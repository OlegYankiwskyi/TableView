//
//  SafaryController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/20/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class SFSafariController: UIViewController {

    var linkWiki: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: self.linkWiki!) else {
            print("Error url")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: {
            (success) in
            self.dismiss(animated: true)
        })
    }
}
