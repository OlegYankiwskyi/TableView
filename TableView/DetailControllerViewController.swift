//
//  DetailControllerViewController.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/16/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
