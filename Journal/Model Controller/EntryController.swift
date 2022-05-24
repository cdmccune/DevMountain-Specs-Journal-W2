//
//  EntryController.swift
//  Journal
//
//  Created by Curt McCune on 5/23/22.
//

import Foundation

class EntryController {
    
    static let shared = EntryController()
    var entries : [Entry] = [
//        Entry(title: "To-dos", body: "dfadfadsf"),
//        Entry(title: "2 To-dos", body: "dfadfadsf"),
//        Entry(title: "3 To-dos", body: "dfadfadsf"),
//        Entry(title: "4 To-dos", body: "dfadfadsf")
    ]
    
    func createEntryWith (title:String, body:String) {
        let entry = Entry(title: title, body: body)
        
        entries.append(entry)
    }
    
    func deleteEntry (entry: Entry){
        guard let index = entries.firstIndex(of: entry) else {
            return
        }
        entries.remove(at: index)
    }
    
    //Persistence
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let je = JSONEncoder()
        
        do {
            let data = try je.encode(entries)
            try data.write(to: fileURL())
        } catch let e {print("Error saving to storage: \(e)")}
    }
    
    func loadFromPersistentStorage() {
        let jd = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let entry = try jd.decode([Entry].self, from: data)
            self.entries = entry
        } catch let e {
            print("Error loading entries: \(e)")
        }
    }
    
    
    
}
