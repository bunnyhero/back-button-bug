//
//  ViewController.swift
//  Back Button Bug
//
//  Created by bunnyhero on 2021-11-12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func runTest(_ sender: Any) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
}

