//
//  ContentView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var jankenNumber: Int = 0
    var body: some View {
        VStack {
            // スペース追加
            Spacer()
            jankenView()
            Button(action: {
                // ボタンがタップされたときの処理を記述
                print("タップされたよ")
                var newJankennNumber = 0
                repeat {
                    newJankennNumber = Int.random(in: 1...3)
                    // 前回と同じ結果の場合、再度ランダムに数値を選択する
                } while jankenNumber == newJankennNumber
                jankenNumber = newJankennNumber
            }, label: {
                // ボタンに表示するテキスト
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(.pink)
                    .foregroundColor(.white)
            })
        }
    }
    
    /**
     じゃんけんの main view に表示するコンテンツを返す関数
     */
    @ViewBuilder
    private func jankenView() -> some View {
        switch jankenNumber {
        case 0:
            Text("これからじゃんけんをします")
                .padding(.bottom)
        case 1:
            Image(.gu).resizable().scaledToFit()
            Text("グー")
                .padding(.bottom)
            // スペース追加
            Spacer()
        case 2:
            Image(.choki).resizable().scaledToFit()
            Text("チョキ")
                .padding(.bottom)
            // スペース追加
            Spacer()
        case 3:
            Image(.pa).resizable().scaledToFit()
            Text("パー")
                .padding(.bottom)
            // スペース追加
            Spacer()
        default:
            Text("")
        }
    }
}

#Preview {
    ContentView()
}
