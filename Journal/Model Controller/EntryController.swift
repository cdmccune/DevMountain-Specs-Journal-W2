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
        Entry(title: "To-dos", body: "dfadfadsf"),
        Entry(title: "2 To-dos", body: "dfadfadsf"),
        Entry(title: "3 To-dos", body: "dfadfadsf"),
        Entry(title: "4 To-dos", body: "dfadfadsf")
    ]
    
    func createEntryWith (title:String, body:String) {
        let entry = Entry(title: title, body: body)
        
        entries.append(entry)
    }
    
    func deleteEntry (entry: Entry){
        //        print(entry.title)
        //        print(entry.body)
        //        print(entry.timestamp)
        //
        //        print(EntryController.shared.entries[0].title)
        //        print(EntryController.shared.entries[0].body)
        //        print(EntryController.shared.entries[0].timestamp)
        
        //        if let index = self.entries.firstIndex(where: {$0 == entry}) {
        //            print(EntryController.shared.entries[index].title)
        //            print(EntryController.shared.entries[index].body)
        //            print("hi")
        //            entries.remove(at: index)
        //        }
        guard let index = entries.firstIndex(of: entry) else {
            return
        }
        
        entries.remove(at: index)
        
    }
    
    
    
}
