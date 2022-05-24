//
//  JournalController.swift
//  Journal
//
//  Created by Curt McCune on 5/24/22.
//

import Foundation

class JournalContoller: Codable {
    
    static let shared = JournalContoller()
    
    var journals: [Journal] = []
    
    func createJournalWith(title: String) {
        JournalContoller.shared.journals.append(Journal(title: title))
        
        saveToPersistentStorage()
    }
    
    func delete(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else {return}
        journals.remove(at: index)
        
        saveToPersistentStorage()
    }
    
    func addEntryTo(journal: Journal, _ entry:Entry) {
        guard let index = journals.firstIndex(of: journal) else {return}
        journals[index].entries.append(entry)
        
        saveToPersistentStorage()
    }
    
    func removeEntryFrom(journal: Journal, _ entry:Entry) {
        guard let journalIndex = journals.firstIndex(of: journal) else {return}
        guard let entryIndex = journals[journalIndex].entries.firstIndex(of: entry) else {return}
        
        journals[journalIndex].entries.remove(at: entryIndex)
        
        saveToPersistentStorage()
    }
    
    //Persistence Functions
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let je = JSONEncoder()
        
        do {
            let data = try je.encode(journals)
            try data.write(to: fileURL())
        } catch let e {print("Error saving to storage: \(e)")}
    }
    
    func loadFromPersistentStorage() {
        let jd = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let journals = try jd.decode([Journal].self, from: data)
            self.journals = journals
        } catch let e {print("Error loading Journals: \(e)")}
    }
}
