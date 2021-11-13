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
        updateGestureRecognizerCount()
    }

    @IBAction func runTest(_ sender: Any) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        updateGestureRecognizerCount()
    }
    
    private func updateGestureRecognizerCount() {
        outputLabel.text = "\(navigationController?.navigationBar.recursiveGestureRecognizerCount() ?? 0)"
    }
}

