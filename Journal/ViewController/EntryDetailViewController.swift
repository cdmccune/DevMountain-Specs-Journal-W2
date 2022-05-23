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
        if let entry = entry {
            print("will be implemented tomorrow")
        } else {
            EntryController.shared.createEntryWith(title: titleTextField.text!, body: bodyTextView.text!)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
