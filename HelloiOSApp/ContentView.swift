//
//  ContentView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI

struct ContentView: View {
    
    // 入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    
    // 検索キーワードを保持する状態変数
    // 初期値は 小田原駅
    @State var displaySearchKey: String = "小田原駅"
    
    // マップ種類
    @State var displayMapType: MapType = .standard
    
    var body: some View {
        VStack {
            TextField("検索キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
            ZStack(alignment: .bottomTrailing) {
                // マップ表示
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                
                // MapType 切り替えボタン
                Button {
                    // 切り替え処理
                    switch displayMapType {
                    case .standard:
                        displayMapType = .satellite
                    case .satellite:
                        displayMapType = .hybrid
                    case .hybrid:
                        displayMapType = .standard
                    }
                } label: {
                    Image(systemName: "map.circle")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
