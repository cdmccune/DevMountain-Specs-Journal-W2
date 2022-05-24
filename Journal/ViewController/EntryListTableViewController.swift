//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Curt McCune on 5/23/22.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    var journal: Journal?
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let rows = journal?.entries.count {
            return rows
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        if let title = journal?.entries[indexPath.row].title {
            content.text = title
            cell.contentConfiguration = content
            return cell
        } else {
            return UITableViewCell()
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let entry = journal?.entries[indexPath.row] {
                if let journal = journal {
                    EntryController.deleteEntry(entry: entry, journal: journal)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowEntry" {
            if let index = tableView.indexPathForSelectedRow {
                if let EntryDetailVC = segue.destination as? EntryDetailViewController {
                    if let journal = journal {
                        let entry = journal.entries[index.row]
                        EntryDetailVC.entry = entry
                        EntryDetailVC.journal = journal
                    }
                    
                }
            }
        } else if segue.identifier == "createNewEntry" {
            if let EntryDetailVC = segue.destination as? EntryDetailViewController {
                if let journal = journal {
                    EntryDetailVC.journal = journal
                }
            }
        }
    }
    
    
}
