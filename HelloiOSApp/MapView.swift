//
//  MapView.swift
//  HelloiOSApp
//
//  Created by zztkm on 2024/08/24.
//

import SwiftUI
import MapKit

enum MapType {
    case standard // 標準
    case satellite // 衛星写真
    case hybrid // 衛星写真・交通機関ラベル
}

struct MapView: View {
    /// 検索キーワード
    let searchKey: String
    ///マップ種類
    let mapType: MapType
    
    /// 検索キーワードから取得した緯度経度
    @State var targetCoordinate = CLLocationCoordinate2D()
    /// 表示するマップの位置
    @State var cameraPosition: MapCameraPosition = .automatic
    
    var mapStyle: MapStyle {
        switch mapType {
        case .standard:
            MapStyle.standard()
        case .satellite:
            MapStyle.imagery()
        case .hybrid:
            MapStyle.hybrid()
        }
    }
    
    var body: some View {
        // マップ表示
        Map(position: $cameraPosition) {
            Marker(searchKey, coordinate: targetCoordinate)
        }
        .mapStyle(mapStyle)
        .onChange(of: searchKey, initial: true) { oldValue, newValue in
            // 入力文字をデバッグプリント
            print("検索キーワード \(newValue)")
            
            let req = MKLocalSearch.Request()
            req.naturalLanguageQuery = newValue
            
            let search = MKLocalSearch(request: req)
            
            // 検索開始
            search.start { res, error in
                if let mapItems = res?.mapItems,
                   let mapItem = mapItems.first {
                    
                    // 位置情報から緯度経度を取り出す
                    targetCoordinate = mapItem.placemark.coordinate
                    
                    print("緯度経度: \(targetCoordinate)")
                    
                    // 表示するマップの領域を作成
                    cameraPosition = .region(MKCoordinateRegion(
                        center: targetCoordinate
                        , latitudinalMeters: 500.0
                        , longitudinalMeters: 500.0
                    ))
                    
                }
            }
        }
    }
}

#Preview {
    MapView(searchKey: "富水駅", mapType: .standard)
}
