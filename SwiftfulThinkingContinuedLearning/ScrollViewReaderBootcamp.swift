//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by User on 10.04.2026.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var scrollToIndex: Int = 0
    @State var textFieldtext: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldtext)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("SCROLL NOW") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldtext) {
                        scrollToIndex = index
                    }
                }
                
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { _, value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top )
                        }
                        
                    }
                }
                
            }
        }
        
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
