//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by User on 08.04.2026.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isCompleted: Bool = false
    @State var isPressing: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: (isPressing || isCompleted) ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack{
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(.buttonBorder)
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50) {
                            withAnimation(.easeInOut) {
                                isSuccess = true
                            }
                            
                            isCompleted = true
                        } onPressingChanged: { pressing in
                            withAnimation(.easeInOut(duration: 1.0)) {
                                if !isCompleted {
                                    isPressing = pressing
                                } else {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                                    {
                                        if !isSuccess {
                                            withAnimation(.easeInOut) {
                                                isCompleted = false
                                            }
                                        }
                                    }
                                }
                            }
                        }
                
                
                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(.buttonBorder)
                    .onTapGesture {
                        isPressing = false
                        isSuccess = false
                    }
                
            }
            
            
            
            
            
            
            
            
            
            //        Text(isCompleted ? "COMPLETED" : "NO COMPLETE")
            //            .padding()
            //            .padding(.horizontal)
            //            .background(isCompleted ? Color.green : Color.gray)
            //            .clipShape(.buttonBorder)
            ////            .onTapGesture {
            ////                isCompleted.toggle()
            ////            }
            //            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
            //                isCompleted.toggle()
            //            }
        }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
