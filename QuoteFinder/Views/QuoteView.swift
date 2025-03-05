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
    @State var viewModel = QuoteViewModel()
    
    // Controls button visibility
    @State var buttonOpacity = 0.0
    
    // Starts a timer to wait on revealing button to get new joke
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
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
                
                
                Button {
                 
                    // Hide punchline and button
                    withAnimation {
                        viewModel.currentQuote = nil
                        buttonOpacity = 0.0
                    }
                                        
                    // Get a new joke
                    Task {
                        await viewModel.fetchQuote()
                    }
                    
                    // Restart timers
                    buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
                    
                } label: {
                 
                    Text("New Quote")
                    
                }
                .buttonStyle(.borderedProminent)
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    
                    // Stop the timer
                    buttonTimer.upstream.connect().cancel()
                }
            }
            
        }
    }
}
 
#Preview {
    QuoteView()
}
