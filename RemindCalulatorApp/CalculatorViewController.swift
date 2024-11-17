//
//  ViewController.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/15/24.
//

import UIKit

class CalulatorViewController: UIViewController {
    private let calculatorView = CalulatorView()
    private let
    
    override func loadView() {
        self.view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

