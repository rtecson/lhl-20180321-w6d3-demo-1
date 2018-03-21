//
//  FilesViewController.swift
//  w6d3-demo-1
//
//  Created by Roland on 2018-03-20.
//  Copyright © 2018 MoozX Internet Ventures. All rights reserved.
//

import UIKit

class FilesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - IBActions
    @IBAction func loadButtonTapped(_ sender: UIButton) {
        loadFile()
        dismissKeyboard()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        saveFile()
        dismissKeyboard()
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
    }
    
    // MARK: - Private properties
    private lazy var fileUrl: URL? = {
        // Get user's documents directory
        let fileManager = FileManager.default
        guard let documentsUrl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            assertionFailure("Error, documents folder does not exist")
            return nil  // This will never be executed
        }
        
        // Generate filepath -- file may or may not exist yet
        let fileUrl = documentsUrl.appendingPathComponent("appData")
        return fileUrl
    }()
}

// MARK: - UIViewController methods
extension FilesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadFile()
    }
}

// MARK: - Private methods
extension FilesViewController {
    
    private func loadFile() {
        guard let fileUrl = fileUrl else {
            return
        }

        do {
            let fileContents = try String(contentsOf: fileUrl)
            textView.text = fileContents
        }
        catch {
            textView.text = ""
        }
    }

    private func saveFile() {
        guard let fileUrl = fileUrl, let contents = textView.text, !contents.isEmpty else {
            return
        }
        
        do {
            // Create or overwrite the file
            try contents.write(to: fileUrl, atomically: false, encoding: .utf8)
        }
        catch {
            print("Error in writing to file")
        }
    }
    
    private func dismissKeyboard() {
        textView.resignFirstResponder()
    }
}

