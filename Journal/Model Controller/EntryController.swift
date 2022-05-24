//
//  EntryController.swift
//  Journal
//
//  Created by Curt McCune on 5/23/22.
//

import Foundation

class EntryController {
    
    static func createEntryWith (title:String, body:String, journal: Journal) {
        let entry = Entry(title: title, body: body)
        
        JournalContoller.shared.addEntryTo(journal: journal, entry)
    }
    
    static func deleteEntry (entry: Entry, journal:Journal){
        JournalContoller.shared.removeEntryFrom(journal: journal, entry)
    }
    
    static func update (entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
        JournalContoller.shared.saveToPersistentStorage()
    }
}
