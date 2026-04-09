//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by User on 09.04.2026.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        angle = value.rotation
                    }
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            angle = .zero
                        }
                    })
            )
            
    }
}

#Preview {
    RotationGestureBootcamp()
}
