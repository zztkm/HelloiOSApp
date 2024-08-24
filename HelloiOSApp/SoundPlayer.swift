//
//  SoundPlayer.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    // 音源データの読み込み
    private let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    private let guitarData = NSDataAsset(name: "guitarSound")!.data
    
    
    // プレイヤー
    private var cymbalPlayer: AVAudioPlayer!
    private var guitarPlayer: AVAudioPlayer!
    
    func cymbalPlay() {
        print("シンバルプレイ実行")
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            // 再生
            cymbalPlayer.play()
        } catch {
            print("シンバル再生でエラーが発生した")
        }
        
    }
    
    func guitarPlay() {
        print("ギタープレイ実行")
        do {
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            // 再生
            guitarPlayer.play()
        } catch {
            print("ギター再生でエラーが発生した")
        }
        
    }

}
