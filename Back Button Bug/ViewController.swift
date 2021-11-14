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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateGestureRecognizerCount()
    }
    
    @IBAction func changeTitle(_ sender: Any) {
        for i in 0..<100 {
            navigationItem.title = "Change \(i)"
        }
        updateGestureRecognizerCount()
    }
        
    @IBAction func changeRightBarItem(_ sender: Any) {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        for _ in 0..<100 {
            navigationItem.rightBarButtonItem = barButtonItem
        }
        updateGestureRecognizerCount()
    }
    
    @IBAction func changeNavBarBackgroundImage(_ sender: Any) {
        for _ in 0..<100 {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        }
        updateGestureRecognizerCount()
    }
    
    @IBAction func printGestureRecognizers(_ sender: Any) {
        navigationController?.navigationBar.printGestureRecognizersRecursively()
    }
    
    private func updateGestureRecognizerCount() {
        outputLabel.text = "\(navigationController?.navigationBar.recursiveGestureRecognizerCount() ?? 0)"
    }
}

