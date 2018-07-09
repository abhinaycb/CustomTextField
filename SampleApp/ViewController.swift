//
//  ViewController.swift
//  SampleApp
//
//  Created by Coffeebeans on 06/07/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var emailTextField:ExpandableTextFieldView = {
        let textField = ExpandableTextFieldView(fieldName: "Email", fieldValue: "Email")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField:ExpandableTextFieldView = {
        let textField = ExpandableTextFieldView(fieldName: "Password", fieldValue: "Password")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewGesture()
    }
    
    private func addViewGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func viewClicked() {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTextFieldsOnScreen()
    }
    
    func loadTextFieldsOnScreen() {
        view.backgroundColor = UIColor.cyan
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        let viewDict = ["emailTextField":emailTextField, "passwordTextField":passwordTextField]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[emailTextField]-|", options: [], metrics: nil, views: viewDict))
         view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[passwordTextField]-|", options: [], metrics: nil, views: viewDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[emailTextField]-(40)-[passwordTextField]", options: [.alignAllCenterX], metrics: nil, views: viewDict))
    }
}
