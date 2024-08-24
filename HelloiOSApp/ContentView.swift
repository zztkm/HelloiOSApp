//
//  ContentView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI

struct ContentView: View {
    // 音再生用プレイヤーをインスタンス化
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        ZStack {
            Image(.background)
                .backgroundModifier()
            
            HStack {
                Button {
                    soundPlayer.cymbalPlay()
                } label: {
                    Image(.cymbal)
                }
                
                Button {
                    soundPlayer.guitarPlay()
                } label: {
                    Image(.guitar)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
