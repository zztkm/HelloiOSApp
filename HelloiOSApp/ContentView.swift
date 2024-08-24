//
//  ContentView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var outputText = "Hello zztkm!"
    var body: some View {
        VStack {
            Text(outputText)
                .font(.largeTitle)
            Button("切り替えボタン") {
                outputText = "Hi, Swift!"
            }
            .padding(.all)
            .background(.blue)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
