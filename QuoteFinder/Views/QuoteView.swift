//
//  ContentView.swift
//  QuoteFinder
//
//  Created by Sebastian on 2025-03-05.
//

import SwiftUI

struct QuoteView: View {
    
    // MARK: Stored properties
    
    // Create the view model (temporarily show the default joke)
    @State var viewModel = QuoteViewModel(currentQuote: exampleQuote)
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let currentQuote = viewModel.currentQuote {
                
                Group {
                    Text(currentQuote.quoteText ?? "")
                        .padding(.bottom, 100)
                    
                    Text(currentQuote.quoteAuthor ?? "")
 
                }
                .font(.title)
                .multilineTextAlignment(.center)
                
            }
            
        }
    }
}
 
#Preview {
    QuoteView()
}
