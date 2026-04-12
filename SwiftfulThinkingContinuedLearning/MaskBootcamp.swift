//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by User on 12.04.2026.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack {
            starView
                .overlay {
                    overlayView.mask(starView)
                }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                        
                    }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
