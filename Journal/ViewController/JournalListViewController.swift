//
//  JournalListViewController.swift
//  Journal
//
//  Created by Curt McCune on 5/24/22.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var journalTitleTextField: UITextField!
    @IBOutlet var journalListTableView: UITableView!
    
    // MARK: - LifeCycles
    
    override func viewWillAppear(_ animated: Bool) {
        journalListTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JournalContoller.shared.loadFromPersistentStorage()
    }
    
    // MARK: - Functionality
    
    @IBAction func createNewJournalButtonTapped(_ sender: Any) {
        if let title = journalTitleTextField.text {
            if title != "" {
                JournalContoller.shared.createJournalWith(title: title)
            }
        }
        journalListTableView.reloadData()
        journalTitleTextField.text = ""
    }
    
    // MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalContoller.shared.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = JournalContoller.shared.journals[indexPath.row].title
        content.secondaryText = "\(JournalContoller.shared.journals[indexPath.row].entries.count) Entries"
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toListEntry" {
            if let index = journalListTableView.indexPathForSelectedRow {
                if let EntryListVC = segue.destination as? EntryListTableViewController {
                    let journal = JournalContoller.shared.journals[index.row]
                    EntryListVC.journal = journal
                }
            }
        }
        
    }
    

}
