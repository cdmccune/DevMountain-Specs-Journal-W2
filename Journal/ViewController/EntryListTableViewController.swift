//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Curt McCune on 5/23/22.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    
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
        return EntryController.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = EntryController.shared.entries[indexPath.row].title

        cell.contentConfiguration = content
        return cell
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // called to delete our cell on swipe
                /// Grabs the `Entry` that we want to delete
                let entry = EntryController.shared.entries[indexPath.row]
                /// Calls the delete function on our `EntryController`
                EntryController.shared.deleteEntry(entry: entry)
                
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
                
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
                    let entry = EntryController.shared.entries[index.row]
                    EntryDetailVC.entry = entry
                }
            }
        }
    }
    

}
