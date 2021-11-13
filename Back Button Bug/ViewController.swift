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
    }

    @IBAction func runTest(_ sender: Any) {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        for _ in 0..<100 {
            navigationItem.rightBarButtonItem = barButtonItem
        }
        updateGestureRecognizerCount()
    }
    
    private func updateGestureRecognizerCount() {
        outputLabel.text = "\(navigationController?.navigationBar.recursiveGestureRecognizerCount() ?? 0)"
    }
}

