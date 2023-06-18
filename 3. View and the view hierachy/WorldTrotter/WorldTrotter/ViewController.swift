//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Khanh Son on 6/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor].reversed()
        
        // Add subLayer append layer in the end of the layer array, insertSublayer at index so you can choose the position to add
        // view.layer.addSublayer(layer)
        
        view.layer.insertSublayer(layer, at: 0)
    }
}

