//
//  UserDefaultsViewController.swift
//  w6d3-demo-1
//
//  Created by Roland on 2018-03-20.
//  Copyright © 2018 MoozX Internet Ventures. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var highScoreTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        saveUserPreferences()
        dismissKeyboard()
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
    }
}

// MARK: - UIViewController methods
extension UserDefaultsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadUserPreferences()
    }
}

// MARK: - Private methods
extension UserDefaultsViewController {
    
    private func saveUserPreferences() {
        if let newName = nameTextField.text {
            UserDefaults.standard.set(newName, forKey: "userName")
        }
        if let newHighScore = highScoreTextField.text {
            UserDefaults.standard.set(newHighScore, forKey: "highScore")
        }
    }

    private func loadUserPreferences() {
        nameTextField.text = UserDefaults.standard.string(forKey: "userName")
        highScoreTextField.text = UserDefaults.standard.string(forKey: "highScore")
    }

    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
