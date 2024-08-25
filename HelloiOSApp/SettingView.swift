//
//  SettingView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/25.
//

import SwiftUI

struct SettingView: View {
    // 永続化する秒数設定
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        ZStack {
            Color.backgroudSetting
                .ignoresSafeArea()
            
            // 垂直レイアウトで設定項目を定義
            VStack {
                Spacer()
                
                Text("\(timerValue)秒")
                    .font(.largeTitle)
                Picker(selection: $timerValue) {
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                } label: {
                    Text("選択")
                }
                .pickerStyle(.wheel)
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingView()
}
