//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Curt McCune on 5/23/22.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    
    var entry: Entry?
    var journal: Journal?
    
    func updateViews() {
        if let entry = entry {
            titleTextField.text = entry.title
            bodyTextView.text = entry.body
        } else {return}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearText(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let journal = journal else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        
        if let entry = entry {
            if let title = titleTextField.text, let body = bodyTextView.text {
                if title != "" && body != "" {
                    EntryController.update(entry: entry, title: title, body: body)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        } else {
            
            if let title = titleTextField.text, let body = bodyTextView.text {
                if title != "" && body != "" {
                    EntryController.createEntryWith(title: title, body: body, journal: journal)
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
        }
        
        
    }
    
}
