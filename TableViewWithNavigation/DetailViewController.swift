//
//  DetailViewController.swift
//  TableViewWithNavigation
//
//  Created by 舟木正憲 on 2018/12/30.
//  Copyright © 2018 masanori. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var message: String?

    @IBOutlet var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }

}
