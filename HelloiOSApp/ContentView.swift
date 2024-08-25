//
//  ContentView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    // 経過時間を保持変数
    @State var count = 0
    // 永続化する秒数設定
    @AppStorage("timer_value") var timerValue = 10
    // アラート表示フラグ
    @State var showAleart = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.backgroundTimer)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(spacing: 30.0){
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    HStack {
                        // スタートボタン
                        Button {
                            startTimer()
                        } label: {
                            Text("スタート")
                                .font(.title) // 文字サイズ
                                .foregroundStyle(Color.white) // 文字のスタイル
                                .frame(width: 140, height: 140) // フレームサイズ
                                .background(Color.start) // 背景色
                                .clipShape(Circle()) // 円形に切り抜き
                        }
                        // ストップボタン
                        Button {
                            if let timerHandler {
                                // タイマーが実行中の場合、停止
                                if timerHandler.isValid {
                                    timerHandler.invalidate()
                                }
                            }
                        } label: {
                            Text("ストップ")
                                .font(.title) // 文字サイズ
                                .foregroundStyle(Color.white) // 文字のスタイル
                                .frame(width: 140, height: 140) // フレームサイズ
                                .background(Color.stop) // 背景色
                                .clipShape(Circle()) // 円形に切り抜き
                        }
                    }
                }
            }
            .onAppear {
                // この View が表示されたときに count を初期化する
                count = 0
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingView()
                    } label: {
                        Text("秒数設定")
                    }
                }
            }
            .alert("終了", isPresented: $showAleart) {
                Button("OK") {
                    print("OKがタップされた")
                    // isPresented に指定した showAleart は OK が押されたら false に設定される
                }
            } message: {
                 Text("タイマー終了時間です")
            }
        }
    }
    
    /// カウトダウン関数
    func countDownTimer() {
        // 経過時間毎に +1 する
        count += 1
        if timerValue - count <= 0 {
            // タイマー停止
            timerHandler?.invalidate()
            
            // アラート表示 ON
            showAleart = true
        }
    }
    
    /// タイマー開始処理
    func startTimer() {
        // timerHandler のアンラップ
        if let timerHandler {
            // タイマーが有効の場合、スタートしない
            if timerHandler.isValid {
                return
            }
        }
        
        // 残り時間が 0 以下のとき、count を 0 に戻す
        if timerValue - count <= 0 {
            count = 0
        }
        
        // タイマースタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            // タイマー実行時に呼び出される
            // 1秒ごとに実行されてカウントダウンする関数を実行する
            countDownTimer()
        }
    }
}

#Preview {
    ContentView()
}
