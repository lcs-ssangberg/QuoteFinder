//
//  QuoteViewModel.swift
//  QuoteFinder
//
//  Created by Sebastian on 2025-03-05.
//

import Foundation
 
@Observable
class QuoteViewModel {
    
    // MARK: Stored properties
    
    // Whatever joke has most recently been downloaded
    // from the endpoint
    var currentQuote: Quote?
    
    // MARK: Initializer(s)
    init(currentQuote: Quote? = nil) {
        
        // Take whatever joke was provided when an instance of
        // this view model is created, and make it the current joke.
        //
        // Otherwise, the default value for the current joke
        // will be a nil.
        self.currentQuote = currentQuote
    }
    
}
