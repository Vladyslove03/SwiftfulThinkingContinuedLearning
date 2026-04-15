//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by User on 15.04.2026.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

@Observable
class ArrayModificationViewModel {
    
    var dataArray: [UserModel] = []
    var filteredArray: [UserModel] = []
    var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFiltereArray()
    }
    
    func updateFiltereArray() {
        // sort
        /*
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        }
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        */
        // filter
        /*
//        filteredArray = dataArray.filter({ (user) in
//            return user.isVerified
//        })
        
        filteredArray = dataArray.filter({ $0.isVerified })
         */
        // map
        /*
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name ?? "ERROR"
//        })
//        mappedArray = dataArray.map({ $0.name })
//        mappedArray = dataArray.compactMap({ (user) -> String? in
//            return user.name
//        })
        
        mappedArray = dataArray.compactMap({ $0.name }) */
        
        mappedArray = dataArray
            .sorted(by:  { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel(name:  nil, points: 20, isVerified: true)
        let user4 = UserModel(name: "Emili", points: 50, isVerified: false)
        let user5 = UserModel(name: "Samantha", points: 45, isVerified: true)
        let user6 = UserModel(name: "Jason", points: 35, isVerified: false)
        let user7 = UserModel(name: "Sarah", points: 65, isVerified: true)
        let user8 = UserModel(name: nil, points: 16, isVerified: false)
        let user9 = UserModel(name: "Steve", points: 21, isVerified: true)
        let user10 = UserModel(name: "Amanda", points: 19, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
}

struct ArraysBootcamp: View {
    
    @State private var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
