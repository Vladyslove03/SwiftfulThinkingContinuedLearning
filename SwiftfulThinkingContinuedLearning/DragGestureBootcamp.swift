//
//  DragGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by User on 09.04.2026.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 500)
                    .offset(offset)
                    .scaleEffect(getScaleAmount(width: geo.size.width))
                    .rotationEffect(Angle(degrees: getRotationAmount(width: geo.size.width)))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.spring()) {
                                    offset = value.translation
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.spring()) {
                                    offset = .zero
                                }
                            })
                    )
            }
            
        }
    }
    
    func getScaleAmount(width: CGFloat) -> CGFloat {
        let max = width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount(width: CGFloat) -> Double {
        let max = width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGestureBootcamp()
}
