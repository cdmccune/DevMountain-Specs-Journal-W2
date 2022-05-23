//
//  Entry.swift
//  Journal
//
//  Created by Curt McCune on 5/23/22.
//

import Foundation

class Entry {
    
    init(timestamp: Date = Date(), title: String, body: String,id: UUID = UUID()) {
        self.timestamp = timestamp
        self.title = title
        self.body = body
        self.id = id
    }
    
    var timestamp: Date
    var title: String
    var body: String
    var id: UUID
    
    
}

extension Entry: Equatable {}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.id == rhs.id
}


