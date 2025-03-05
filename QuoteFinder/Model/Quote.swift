//
//  Quote.swift
//  QuoteFinder
//
//  Created by Sebastian on 2025-03-05.
//

import Foundation

struct Quote: Codable {
    
    // MARK: Stored properties
    let quoteText: String?
    let quoteAuthor: String?
        
}
 
// Create an example joke for testing purposes
let exampleQuote = Quote(
    quoteText: "Adversity causes some men to break, others to break records. ",
    quoteAuthor: "William Ward"
)
