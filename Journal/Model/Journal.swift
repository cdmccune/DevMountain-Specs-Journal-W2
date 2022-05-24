//
//  Journal.swift
//  Journal
//
//  Created by Curt McCune on 5/24/22.
//

import Foundation

class Journal: Codable {
    
    init(title: String, entries: [Entry] = [], id: UUID = UUID()) {
        self.title = title
        self.entries = entries
        self.id = id
    }
    
    var title: String
    var entries: [Entry] = []
    var id: UUID
    
}
extension Journal: Equatable {}

func ==(lhs:Journal, rhs:Journal) -> Bool{
    return rhs.id == lhs.id
}


